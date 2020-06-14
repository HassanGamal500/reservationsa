<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;


class AuthController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function register(Request $request) {
        $validator = validator()->make($request->all(), [
            'name' => 'required|max:30',
            'phone' => 'required|unique:users|max:13',
            'phone_code' => 'required|max:6',
            'email' => 'required|unique:users|email',
            'password' => 'required|confirmed|min:8|regex:/^(?=.*?[a-zA-Z])(?=.*?[0-9])/',
            'image' => 'nullable',
            'gender' => 'required'
        ]);

        if ($validator->fails()) {

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        if(filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) && !preg_match("/[0-9]/u", $request->name)){
            $user = new User();

            $user->name = $request->name;
            $user->phone = $request->phone;
            $user->phone_code = $request->phone_code;
            $user->email = strtolower($request->email);
            $user->password = bcrypt($request->password);
            if ($request->gender == 1) {
                $user->gender = 'male';
            } else {
                $user->gender = 'female';
            }
            $user->token = $request->token;
            
            //hefny
            if(!empty($request->image)){
    			$image = substr($request->image, strpos($request->image, ",") + 1);
    			$img = base64_decode($image);
    			$dir="images/user";
    			if (!file_exists($dir) and !is_dir($dir)) {
    				mkdir($dir);
    			}
    			$uploadfile = $dir."/pic_".time().".jpg";
    			file_put_contents(base_path().'/'.$uploadfile, $img);
    			$profile_photo=$uploadfile;
    		}else{
    			$profile_photo="images/user/logo_avatar.png";
    		}
    
            $user->api_token = Str::random(60);
    
            $user->image = $profile_photo;
            
            $user->default_language = $request->language_id;
    
            $user->save();
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $user
            ];
            return response()->json($response);
        } else {
            if($request->name) {
                $response = [
                    'status' => 0,
                    'message' => trans('admin.this name must contain only characters'),
                    'data' => []
                ];
                return response()->json($response);
            } else {
                $response = [
                    'status' => 0,
                    'message' => trans('admin.your email is not correct'),
                    'data' => []
                ];
                return response()->json($response);
            }
        }
    }

    public function login(Request $request) {

        if (is_numeric($request->input)) {
            $validator = validator()->make($request->all(), [
                'input' => 'required|max:13',
                'password' => 'required|min:8',
                'phone_code' => 'required'
            ]);

            if ($validator->fails()){
                $response = [
                    'status' => 0,
                    'message' => trans("admin.your phone or password is not correct"),
                    'data' => []
                ];
                return response()->json($response);
            }
            $user = User::where('phone', $request->input)->where('phone_code', '=', $request->phone_code)->first();
        }elseif (filter_var(filter_var(strtolower($request->input), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL)) {
            $validator = validator()->make($request->all(), [
                'input' => 'required|email',
                'password' => 'required'
            ]);

            if ($validator->fails()){
                $response = [
                    'status' => 0,
                    'message' => trans('admin.your email or password is not correct'),
                    'data' => []
                ];
                return response()->json($response);
            }
            $user = User::where('email', strtolower($request->input))->first();
        }else{
            $user=false;
        }

        if ($user) {
            $notifications = DB::table('notifications')->where('user_id', '=', $user->id)->where('is_seen', '=', 0)->count();
            $user->countNotification = $notifications;
            if (Hash::check($request->password, $user->password)) {
                $response = [
                    'status' => 1,
                    'message' => trans('admin.your account is correct'),
                    'data' => [
                        'User' => $user
                    ]
                ];
                
                $lang = DB::table('users')->where('id', '=', $user->id)->update(['default_language' => $request->language_id]);
                
                if (is_numeric($request->input)) {
                    DB::table('users')->where('phone', $request->input)->where('phone_code', '=', $request->phone_code)->update([
                		'token'=>$request->token
                	]);
                } else {
                    DB::table('users')->where('email', $request->input)->update([
                		'token'=>$request->token
                	]);
                }
                    
                return response()->json($response);
            } else {
                $response = [
                    'status' => 0,
                    'message' => trans('admin.your password is not correct, Try Again'),
                    'data' => []
                ];
                return response()->json($response);
            }

        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.your account is not correct'),
                'data' => []
            ];
            return response()->json($response);
        }

    }

    public function resetPassword(Request $request) {
        $validator = validator()->make($request->all(),[
            'email' => 'required|email',
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $user = User::where('email', strtolower($request->email))->first();

        if ($user) {
            $code = rand(1111, 9999);
            $update = $user->update(['pin_code' => $code,'is_used' => 0]);

            if ($update) {
                $to_name = $user->name;
                $to_email = $user->email;
                $data = array('name'=> $user->name, "body" => "Your Reset Code Is :".$code);

                Mail::send('email.mail', $data, function($message) use ($to_name, $to_email) {
                    $message->to($to_email, $to_name)
                        ->subject('Reset Password');
                    $message->from('info@reservationsa.com','Reservation');
                });

                $response = [
                    'status' => 1,
                    'message' => trans('admin.check your message on google mail'),
                    'data' => []
                ];
                return response()->json($response);

            } else {
                $response = [
                    'status' => 0,
                    'message' => trans('admin.Please Try Again'),
                    'data' => []
                ];
                return response()->json($response);
            }

        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.your account is not exist'),
                'data' => []
            ];
            return response()->json($response);
        }

    }

    public function pinCode(Request $request) {
        $validator = validator()->make($request->all(),[
            'email' => 'required|email',
            'pin_code' => 'required'
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }

        $user = User::where('pin_code', $request->pin_code)
            ->where('email', strtolower($request->email))
            ->first();

        if ($user){
            $response = [
                'status' => 1,
                'message' => 'successful',
                'data' => $user
            ];
            return response()->json($response);
        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.This code is invalid'),
                'data' => []
            ];
            return response()->json($response);
        }
    }

    public function newPassword(Request $request) {

        $validator = validator()->make($request->all(),[
            'email' => 'required|email',
            'password' => 'required|confirmed|min:8|regex:/^(?=.*?[a-zA-Z])(?=.*?[0-9])/',
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }

        $user = User::where('email', strtolower($request->email))->first();

        if ($user) {

            $user->password = bcrypt($request->password);
            $user->is_used = 1;

            if ($user->save()) {

                $response = [
                    'status' => 1,
                    'message' => trans('admin.password changed successfully'),
                    'data' => $user
                ];
                return response()->json($response);

            } else {

                $response = [
                    'status' => 0,
                    'message' => trans('admin.something wrong, try again'),
                    'data' => []
                ];
                return response()->json($response);

            }

        } else {

            $response = [
                'status' => 0,
                'message' => trans('admin.This email is invalid'),
                'data' => []
            ];
            return response()->json($response);

        }
    }
    
    public function profile(Request $request) {
        //Hefny
       $validator= validator()->make($request->all(),[
            'id' => 'required',
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        $id = $request->id;
        $user=User::find($id);
        
        $notifications = DB::table('notifications')
            ->where('user_id', '=', $id)
            ->where('is_seen', '=', 0)
            ->count();
            
        $user->countNotification = $notifications;
        
        if($user){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $user
            ];
        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.failed'),
                'data' => []
            ];
        }
        return response()->json($response);
    }

    public function updateProfile(Request $request) {

        $id = $request->id;
        $validator= validator()->make($request->all(),[
            'name' => 'required|max:30',
            'phone' => 'required|max:13',
            'phone_code' => 'required|max:6',
            'email' => 'required|email',
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-zA-Z])(?=.*?[0-9])/',
            'gender' => 'nullable',
            'interest' => 'nullable'
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }

        $user=User::find($id);
        $allPhone = User::where('phone', $request->phone)->where('phone_code', '=', $request->phone_code)->where('id', '!=', $id)->first();
        
        if ($user){
            
            if(preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) && !preg_match("/[0-9]/u", $request->name)) {
                $user->name = $request->name;
                $user->save();
            } else {
                $response = [
                     'status' => 0,
                     'message' => trans('admin.this name must contain only characters'),
                     'data' => []
                ];
                return response()->json($response);
            }

            if ($allPhone) {
                 $response = [
                     'status' => 0,
                     'message' => trans('admin.This phone has been taken before'),
                     'data' => []
                 ];
                 return response()->json($response);
            } else {
                 $user->phone = $request->phone;
                 $user->save();
            }
            
            if(!empty($request->image)){
				$image = substr($request->image, strpos($request->image, ",") + 1);
				$img = base64_decode($image);
				$dir="images/user";
				if (!file_exists($dir) and !is_dir($dir)) {
					mkdir($dir);
				}
				$uploadfile = $dir."/pic_".time().".jpg";
				file_put_contents(base_path().'/'.$uploadfile, $img);
				$profile_photo=$uploadfile;
				$user->image = $profile_photo;
                $user->save();
			}
			
			if(filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL)){
                $allEmail = User::where('email', strtolower($request->email))->where('id', '!=', $id)->first();
                if ($allEmail) {
                    $response = [
                        'status' => 0,
                        'message' => trans('admin.This Email has been taken before'),
                        'data' => []
                    ];
                    return response()->json($response);
                } else {
                    $user->email = strtolower($request->email);
                    $user->save();
                }
            } else {
                $response = [
                    'status' => 0,
                    'message' => trans('admin.your email is not correct'),
                    'data' => []
                ];
                return response()->json($response);
            }
            
            if ($request->phone_code) {
                $user->phone_code = $request->phone_code;
                $user->save;
            } 

            if ($request->password) {
                $user->password = bcrypt($request->password);
                $user->save;
            } 
            
            if ($request->gender == 1) {
                $user->gender = 'male';
                $user->save();
            } else {
                $user->gender = 'female';
                $user->save();
            }

            $user->api_token = Str::random(60);

            $user->save();
            
            $delete = DB::table('user_interest')
                ->where('user_id', '=', $id)
                ->delete();
            $interset = $request->interest;
            if (!array_filter($interset) == []){
                foreach ($interset as  $value) {
                    $add = DB::table('user_interest')
                        ->insert([
                            'interest_id' => $value,
                            'user_id' => $id
                        ]);
                }
            }

            $response = [
                'status' => 1,
                'message' => trans('admin.update successfully'),
                'data' => $user
            ];
            return response()->json($response);

        }else{

            $response = [
                'status' => 0,
                'message' => trans('admin.update successfully'),
                'data' => $user
            ];
            return response()->json($response);

        }

    }
    
    public function getUserDetail(Request $request){
        $validator = validator()->make($request->all(), [
            'user_id' => 'required'
        ]);
        
        if($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $check = DB::table('users')->where('id', '=', $request->user_id)->get();
        
        $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $check
            ];
        return response()->json($response);
    }
    
    //customer LogOut
	public function userLogOut(Request $request){
	    
    DB::table('users')->where('id', $request->user_id)->update([
		'token'=>''
	]);
	$responseData = array('status'=>1, 'data'=>array(), 'message'=>trans('admin.success'));
		
	$userResponse = json_encode($responseData);	
	print $userResponse;
	}
}

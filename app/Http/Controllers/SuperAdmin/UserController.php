<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $users = DB::table('users')
            ->select('id', 'name', 'phone', 'email', 'image', 'gender', 'active')
            ->orderBy('id', 'desc')
            ->get();
        
        return view('superAdmin.users.index', compact('users'));
    }
    
    public function changeStatus(Request $request){
        if($request->type == 'user') {
            $user = DB::table('users')->where('id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'hospital') {
            $hospital = DB::table('hospitals')->where('hospital_id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'clinic') {
            $clinic = DB::table('clinics')->where('clinic_id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'restaurant') {
            $restaurant = DB::table('restaurants')->where('restaurant_id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'catering') {
            $catering = DB::table('catering')->where('catering_id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'hospital_clinic') {
            $hClinic = DB::table('clinics')->where('clinic_id', '=', $request->id)->update(['active' => $request->status]);
        } elseif($request->type == 'doctor') {
            $doctor = DB::table('doctors')->where('doctor_id', '=', $request->id)->update(['active' => $request->status]);
        } else {
            $price = DB::table('price_plan')->where('price_plan_id', '=', $request->id)->update(['active' => $request->status]);
        }
        
    }

    public function create(){
        if(language() == 1) {
            $codes = DB::table('apps_countries')->select('country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        } else {
            $codes = DB::table('apps_countries')->select('country_a_name as country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_a_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        }
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->where('language_id', '=', language())
            ->select('interests.interest_id as id', 'interest_name as name')
            ->get();
        return view('superAdmin.users.create', compact('codes', 'interests'));
    }

    public function store(Request $request){

        $validator = validator()->make($request->all(), [
            'name' => 'required',
            'phone' => 'required|unique:users',
            'phone_code' => 'required',
            'email' => 'required|unique:users|email',
            'password' => 'required|min:8|regex:/^(?=.*?[a-zA-Z])(?=.*?[0-9])/',
            'gender' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/user', $request->file('image'));
        } else {
            $imageName = 'images/user/logo_avatar.png';
        }
        
        if(filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email)) && preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) && !preg_match("/[0-9]/u", $request->name)){
            $users = DB::table('users')
            ->insertGetId([
                'name' => $request->name,
                'phone' => convert($request->phone),
                'phone_code' => $request->phone_code,
                'email' => strtolower($request->email),
                'password' => bcrypt($request->password),
                'image' => $imageName,
                'api_token' => Str::random(60),
                'gender' => $request->gender,
            ]);
        } else {
            if(!preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) || preg_match("/[0-9]/u", $request->name)) {
                $error = trans('admin.this name must contain only characters');
                return Redirect::back()->withInput($request->all())->with('error', $error);
            } else {
                $error = trans('admin.your email is not correct');
                return Redirect::back()->withInput($request->all())->with('error', $error);
            }
        }
        
        if(isset($request->interests)){
            foreach($request->interests as $interest){
                $user_interest = DB::table('user_interest')
                    ->insert([
                        'user_id' => $users,
                        'interest_id' => $interest
                    ]);
            }
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);

    }

    public function edit($id){
        $users = DB::table('users')
            ->select('id', 'name', 'phone', 'email', 'image', 'gender', 'active', 'phone_code')
            ->where('id', '=', $id)
            ->first();
            
        if(language() == 1) {
            $codes = DB::table('apps_countries')->select('country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        } else {
            $codes = DB::table('apps_countries')->select('country_a_name as country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_a_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        }
        
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->where('language_id', '=', language())
            ->select('interests.interest_id as id', 'interest_name as name')
            ->get();
        foreach($interests as $interest){
            $interest_user = DB::table('user_interest')->where('user_id', '=', $id)->where('interest_id', '=', $interest->id)->count();
            if($interest_user > 0) {
                $interest->checked = 1;
            } else {
                $interest->checked = 0;
            }
        }
            
        $interest_user = DB::table('user_interest')->where('user_id', '=', $id)->select('interest_id')->get();
        // dd($interests);
        return view('superAdmin.users.edit', compact('users', 'codes', 'interests', 'interest_user'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'name' => 'required',
            'phone' => 'required',
            'phone_code' => 'required',
            'email' => 'required|email',
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-zA-Z])(?=.*?[0-9])/',
            'gender' => 'nullable',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'active' => 'nullable'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }

        $getUser = User::find($id);
        $allPhone = User::where('phone', convert($request->phone))->where('phone_code', '=', $request->phone_code)->where('id', '!=', $id)->first();
        $email = strtolower($request->email);

        if(preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) && !preg_match("/[0-9]/u", $request->name)) {
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['name' => $request->name, 'api_token' => Str::random(60)]);
        } else {
            $error = trans('admin.this name must contain only characters');
            return Redirect::back()->with('error', $error);
        }
        
        if ($allPhone) {
            $error = trans('admin.This phone has been taken before');
            return Redirect::back()->with('error', $error);
        } else {
            $getUser->phone = convert($request->phone);
            $getUser->phone_code = $request->phone_code;
            $getUser->save();
        }
        
        if(filter_var(filter_var($email, FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
            $allEmail = User::where('email', $email)->where('id', '!=', $id)->first();
            if ($allEmail) {
                $error = trans('admin.This Email has been taken before');
                return Redirect::back()->with('error', $error);
            } else {
                $users = DB::table('users')
                    ->where('id', '=', $id)
                    ->update(['email' => $email]);
                // $user->email = $email;
                // $user->save();
            }
        } else {
            $error = trans('admin.your email is not correct');
            return Redirect::back()->with('error', $error);
        }

        if ($request->password) {
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['password' => bcrypt($request->password),]);
        }

        if ($request->hasFile('image')) {
            if($getUser->image != 'images/user/logo_avatar.png'){
                $myFile = base_path($getUser->image);
                File::delete($myFile);
            }
            
            $imageName = Storage::disk('edit_path')->putFile('images/user', $request->file('image'));

            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['image' => $imageName]);
        } else {
            $imageName = $request->old_image;
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['image' => $imageName]);
        }

        if ($request->gender) {
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['gender' => $request->gender]);
        }
        
        $delete_interestUser = DB::table('user_interest')->where('user_id', '=', $id)->delete();
        
        if(isset($request->interests)){
            foreach($request->interests as $interest){
                $user_interest = DB::table('user_interest')
                    ->insert([
                        'user_id' => $id,
                        'interest_id' => $interest
                    ]);
            }
        }
        
        $CustomersPush = new CustomersPush();
        if ($request->active == 1) {
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['active' => $request->active]);
            
            $customersToken = DB::table('users')->select('token')->where('id', '=', $id)->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
            $CustomersPush->send('User Active','This User Is Active',$customersTokenArr,'','1');
        } else {
            $users = DB::table('users')
                ->where('id', '=', $id)
                ->update(['active' => $request->active]);
                
            $customersToken = DB::table('users')->select('token')->where('id', '=', $id)->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
            $CustomersPush->send('User InActive','This User Is InActive',$customersTokenArr,'','1');
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy(Request $request, $id){
        $CustomersPush = new CustomersPush();
        $customersToken = DB::table('users')->select('token', 'default_language')->where('id', '=', $id)->get();
        foreach($customersToken as $customer){
            $customersTokenArr[]=$customer->token;
        }
        if($customersToken[0]->default_language == 1) {
            $CustomersPush->send('Reservation','The user has been deleted',$customersTokenArr,'','1', '2');
        } else {
            $CustomersPush->send('الحجوزات','تم حذف المستخدم',$customersTokenArr,'','1', '2');
        }
        $getUser = User::find($id);
        if($getUser->image != 'images/user/logo_avatar.png'){
            $myFile = base_path($getUser->image);
            File::delete($myFile);
        }
        $users = DB::table('users')
            ->where('id', '=', $id)
            ->delete();
    }

}

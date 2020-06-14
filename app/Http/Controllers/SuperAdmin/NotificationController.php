<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class NotificationController extends Controller
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
        $notifications = DB::table('notifications')
            ->join('notification_description', 'notification_description.notification_id', '=', 'notifications.notification_id')
            ->select('notifications.notification_id as id', 'notification_description.notification_name as name', 'notification_description.notification_content as content', 'notification_image as image')
            ->where('type','5')
            ->where('language_id', '=', language())
            ->orderBy('notifications.notification_id', 'desc')
            ->get();
        // dd($notifications);
        return view('superAdmin.notifications.index', compact('notifications'));
    }

    public function create(){
        $users = DB::table('users')->select('id', 'email')->get();
        return view('superAdmin.notifications.create', compact('users'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'send' => 'required',
            'email' => 'nullable',
            'notification_name' => 'required',
            'notification_content' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->notification_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->notification_content[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->notification_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->notification_content[2])) {
            $CustomersPush = new CustomersPush();
            if($request->send == 1){
                $users = DB::table('users')->where('active','1')->get();
                foreach($users as $user){
                    $notification = DB::table('notifications')
                        ->insertGetId([
                            // 'notification_name' => $request->notification_name,
                            // 'notification_content' => $request->notification_content,
                            'notification_image' => 'images/user/ic_launcher.png',
                            'user_id' => $user->id,
                            'type' => 5,
                            'type_id' => 0,
                            'is_seen' => 0
                        ]);
                    for ($i = 1; $i <= 2; $i++){
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $request->notification_name[$i],
                                'notification_content' => $request->notification_content[$i],
                                'language_id' => $i,
                                'notification_id' => $notification
                            ]);
                    }
                }
                    
                // English
                $customersTokenEN = DB::table('users')->select('token')->where('default_language', '=', 1)->where('active','1')->get();
                if($customersTokenEN->count() > 0) {
                    foreach($customersTokenEN as $customer){
                        $customersTokenArrEN[]=$customer->token;
                    }
                    $notEN = DB::table('notification_description')
                        ->select('notification_name', 'notification_content')
                        ->where('language_id', '=', 1)
                        ->where('notification_id', '=', $notification)
                        ->first();
                    $CustomersPush->send($notEN->notification_name,$notEN->notification_content,$customersTokenArrEN,'','1');
                }
                    
                // Arabic
                $customersTokenAR = DB::table('users')->select('token')->where('default_language', '=', 2)->where('active','1')->get();
                if($customersTokenAR->count() > 0) {
                    foreach($customersTokenAR as $customer){
                        $customersTokenArrAR[]=$customer->token;
                    }
                    $notAR = DB::table('notification_description')
                        ->select('notification_name', 'notification_content')
                        ->where('language_id', '=', 2)
                        ->where('notification_id', '=', $notification)
                        ->first();
                    $CustomersPush->send($notAR->notification_name,$notAR->notification_content,$customersTokenArrAR,'','1');
                }
                
                // $CustomersPush->send($request->notification_name,$request->notification_content,$customersTokenArr,'','1');
            } else {
                $notification = DB::table('notifications')
                    ->insertGetId([
                        // 'notification_name' => $request->notification_name,
                        // 'notification_content' => $request->notification_content,
                        'notification_image' => 'images/user/ic_launcher.png',
                        'user_id' => $request->email,
                        'type' => 5,
                        'type_id' => 0,
                        'is_seen' => 0
                    ]);
                for ($i = 1; $i <= 2; $i++){
                    $description = DB::table('notification_description')
                        ->insert([
                            'notification_name' => $request->notification_name[$i],
                            'notification_content' => $request->notification_content[$i],
                            'language_id' => $i,
                            'notification_id' => $notification
                        ]);
                }
                $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$request->email)->get();
                foreach($customersToken as $customer){
                    $customersTokenArr[]=$customer->token;
                }
                $getUserLanguage = DB::table('users')->select('default_language')->where('id', '=', $request->email)->first();
                $not = DB::table('notification_description')
                    ->select('notification_name', 'notification_content')
                    ->where('language_id', '=', $getUserLanguage->default_language)
                    ->where('notification_id', '=', $notification)
                    ->first();
                $CustomersPush->send($not->notification_name,$not->notification_content,$customersTokenArr,'','1');
            }
        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->notification_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->notification_content[1])) {
                $error = trans('admin.name or description content must be contain only english characters');
            } else {
                $error = trans('admin.name or description content must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
            
        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }
    
    public function destroy($id){
        $notifications = DB::table('notifications')
            ->where('notification_id', '=', $id)
            ->delete();
    }
}
<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ContactController extends Controller
{
    public function index(){
        return view('superAdmin.contact.contactUs');
    }
    
    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email)) && preg_match("/[\p{Arabic}A-Za-z]/u", $request->name) && !preg_match("/[0-9]/u", $request->name)){
            $coupon = DB::table('contacts')
                ->insert([
                    'contact_name' => $request->name,
                    'contact_email' => $request->email,
                    'contact_phone' => $request->phone,
                    'contact_message' => $request->message,
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
            
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 5)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, trans('admin.contact message'), trans('admin.you have new contact message'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'contacts', '1');

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }
    
    public function showAll(){
        $contacts = DB::table('contacts')
            ->select('contact_id as id', 'contact_name as name', 'contact_email as email', 'contact_phone as phone', 'contact_message as message')
            ->orderBy('contact_id', 'desc')
            ->get();
        $readAll = DB::table('contacts')->update(['contact_read' => 1]);
        return view('superAdmin.contact.index', compact('contacts'));
    }
    
    public function getContacts(){
        $contacts = DB::table('contacts')->where('contact_read', '=', 0)->orderBy('contact_id', 'desc')->count();
        return response()->json($contacts);
    }
    
    public function contact_notify(){
        $contacts = DB::table('contacts')->where('notify_read', '=', 0)->count();
        $update = DB::table('contacts')->where('notify_read', '=', 0)->update(['notify_read' => 1]);
        return response()->json($contacts);
    }
    
    public function destroy($id){
        $contacts = DB::table('contacts')
            ->where('contact_id', '=', $id)
            ->delete();
    }
}
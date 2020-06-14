<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class InterestController extends Controller
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
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->select('interests.interest_id as id', 'interest_name as name')
            ->where('language_id', '=', language())
            ->orderBy('interests.interest_id', 'desc')
            ->get();
            
        foreach($interests as $interest){
            $users = DB::table('user_interest')->where('interest_id', '=', $interest->id)->count();
            $interest->users = $users;
        }
        return view('superAdmin.interests.index', compact('interests'));
    }

    public function create(){
        return view('superAdmin.interests.create');
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'interest_name' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->interest_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[2])) {
            $check = DB::table('interests')->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')->where('interest_name', '=', $request->interest_name)->count();
            
            if($check > 0){
                $error = 'This Interest is Exist';
                return Redirect::back()->with('error', $error);
            } else {
                $interests = DB::table('interests')
                ->insertGetId(['interest_id' => null]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('interest_description')
                    ->insert([
                        'interest_name' => $request->interest_name[$i],
                        'language_id' => $i,
                        'interest_id' => $interests
                    ]);
                }
            }
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[1])) {
                $error = trans('admin.name must be contain only english characters');
            } else {
                $error = trans('admin.name must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->select('interests.interest_id', 'interest_name')
            ->where('interests.interest_id', '=', $id)
            ->get();
        return view('superAdmin.interests.edit', compact('interests'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'interest_name' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->interest_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[2])) {
            $check = DB::table('interest_description')->where('interest_name', '=', $request->interest_name[1])->where('interest_id', '=', $id)->count();
            
            if($check > 0) {
                $error = 'This Interest is Exist';
                return Redirect::back()->with('error', $error);
            } else {
                for ($i = 1; $i <= 2; $i++){
                    $description = DB::table('interest_description')
                        ->where('interest_id', '=', $id)
                        ->where('language_id', '=', $i)
                        ->update([
                            'interest_name' => $request->interest_name[$i],
                        ]);
                }
            }
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[1])) {
                $error = trans('admin.name must be contain only english characters');
            } else {
                $error = trans('admin.name must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $interests = DB::table('interests')
            ->where('interest_id', '=', $id)
            ->delete();
            
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->select('interests.interest_id as id', 'interest_name as name')
            ->where('language_id', '=', language())
            ->orderBy('interests.interest_id', 'desc')
            ->get();
            
        foreach($interests as $interest){
            $users = DB::table('user_interest')->where('interest_id', '=', $interest->id)->count();
            $interest->users = $users;
        }
        
        return response()->json($interests);
    }
    
    public function getInterest(Request $request) {
        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->select('interests.interest_id', 'interest_name')
            ->where('interests.interest_id', '=', $request->id)
            ->get();
        return response()->json($interests);
    }
    
    public function addInterest(Request $request) {
        $validator = validator()->make($request->all(), [
            'interest_name.*' => 'required',
            'interest_name' => 'required|array',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            $arr=array('status' => '0', 'data' => [], 'message' => $error);
            return response()->json($arr);
        }
        
        $check = DB::table('interest_description')
            ->where('interest_name', '=', $request->interest_name)
            ->count();
        
        if($check > 0){
            $error = trans('admin.This Interest is Exist');
            $arr=array('status'=>'0','data'=>[], 'message' => $error);
        } else {
            if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->interest_name[1]) 
            && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[2])) {
                $interests = DB::table('interests')
                ->insertGetId(['interest_id' => null]);
    
                for ($i = 1; $i <= 2; $i++){
                    $description = DB::table('interest_description')
                        ->insert([
                            'interest_name' => $request->interest_name[$i],
                            'language_id' => $i,
                            'interest_id' => $interests
                        ]);
                    }
                
                 $interests = DB::table('interests')
                    ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
                    ->select('interests.interest_id as id', 'interest_name as name')
                    ->where('language_id', '=', language())
                    ->orderBy('interests.interest_id', 'desc')
                    ->get();
                    
                foreach($interests as $interest){
                    $users = DB::table('user_interest')->where('interest_id', '=', $interest->id)->count();
                    $interest->users = $users;
                }
                $arr=array('status'=>'1','data'=>$interests);
            } else {
                if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[1])) {
                    $error = trans('admin.name must be contain only english characters');
                } else {
                    $error = trans('admin.name must be contain only arabic characters');
                }
                $arr=array('status'=>'0','data'=>[], 'message' => $error);
            }
                
        }
        return response()->json($arr);
    }
    
    public function updateInterest(Request $request) {
        $validator = validator()->make($request->all(), [
            'interest_name' => 'required|array',
            'interest_name.*' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            $arr=array('status' => '0', 'data' => [], 'message' => $error);
            return response()->json($arr);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->interest_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[2])) {
            $check = DB::table('interest_description')->where('interest_name', '=', $request->interest_name[1])->where('interest_id', '!=', $request->id)->count();
            
            if($check > 0) {
                $error = trans('admin.This Interest is Exist');
                $arr=array('status'=>'0','data'=>[], 'message' => $error);
            } else {
                for ($i = 1; $i <= 2; $i++){
                    $description = DB::table('interest_description')
                        ->where('interest_id', '=', $request->id)
                        ->where('language_id', '=', $i)
                        ->update([
                            'interest_name' => $request->interest_name[$i],
                        ]);
                }
                
                $interests = DB::table('interests')
                    ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
                    ->select('interests.interest_id as id', 'interest_name as name')
                    ->where('language_id', '=', language())
                    ->orderBy('interests.interest_id', 'desc')
                    ->get();
                    
                foreach($interests as $interest){
                    $users = DB::table('user_interest')->where('interest_id', '=', $interest->id)->count();
                    $interest->users = $users;
                }
                $arr=array('status'=>'1','data'=>$interests);
            }
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->interest_name[1])) {
                $error = trans('admin.name must be contain only english characters');
            } else {
                $error = trans('admin.name must be contain only arabic characters');
            }
            $arr=array('status'=>'0','data'=>[], 'message' => $error);
        }
        
        return response()->json($arr);
    }
}

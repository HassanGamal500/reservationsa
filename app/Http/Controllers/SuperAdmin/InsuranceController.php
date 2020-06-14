<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class InsuranceController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 1 && auth()->guard('admin')->user()->type != 2){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $insurances = DB::table('insurances')
            ->join('insurance_description', 'insurance_description.insurance_id', '=', 'insurances.insurance_id')
            ->select('insurances.insurance_id as id', 'insurance_name as name', 'insurance_image as image')
            ->where('type', '=', auth()->guard('admin')->user()->type)
            ->where('type_id', '=', auth()->guard('admin')->user()->type_id)
            ->where('language_id', '=', language())
            ->orderBy('insurance_description.insurance_description_id', 'desc')
            ->get();

        return view('superAdmin.insurances.index', compact('insurances'));
    }

    public function create(){
        return view('superAdmin.insurances.create');
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'insurance_name' => 'required|max:100',
            'insurance_description_content' => 'required|max:200',
            'image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->insurance_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->insurance_description_content[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_description_content[2])) {
            if ($request->hasFile('image')) {
                // $imageName = 'images/insurance/'.time().'_'.rand().'.'.$request->image->getClientOriginalExtension();
                // $request->file('image')->store(base_path('images/insurance'), $imageName);
                $imageName = Storage::disk('edit_path')->putFile('images/insurance', $request->file('image'));
            } else {
                $imageName = 'images/insurance/insurance_avatar.jpg';
            }
    
            $insurances = DB::table('insurances')
                ->insertGetId([
                    'insurance_image' => $imageName,
                    'type' => auth()->guard('admin')->user()->type,
                    'type_id' => auth()->guard('admin')->user()->type_id
                    ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('insurance_description')
                    ->insert([
                        'insurance_name' => $request->insurance_name[$i],
                        'insurance_description_content' => $request->insurance_description_content[$i],
                        'language_id' => $i,
                        'insurance_id' => $insurances
                    ]);
            }
        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_description_content[1])) {
                $error = trans('admin.name or description content must be contain only english characters');
            } else {
                $error = trans('admin.name or description content must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $insurances = DB::table('insurances')
            ->join('insurance_description', 'insurance_description.insurance_id', '=', 'insurances.insurance_id')
            ->select('insurances.insurance_id as id', 'insurance_name', 'insurance_description_content', 'insurance_image as image')
            ->where('insurances.insurance_id', '=', $id)
            ->get();
        return view('superAdmin.insurances.edit', compact('insurances'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'insurance_name' => 'required|max:100',
            'insurance_description_content' => 'required|max:200',
            'image' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->insurance_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->insurance_description_content[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_description_content[2])) {
            $getImage = DB::table('insurances')->where('insurance_id', '=', $id)->select('insurance_image')->first();
    
            if ($request->hasFile('image')) {
                if($getImage->insurance_image != 'images/insurance/insurance_avatar.jpg'){
                    $myFile = base_path($getImage->insurance_image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/insurance', $request->file('image'));
                
            } else {
                $imageName = $request->old_image;
            }
            
            $store = DB::table('insurances')->where('insurance_id', '=', $id)->update(['insurance_image' => $imageName]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('insurance_description')
                    ->where('insurance_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'insurance_name' => $request->insurance_name[$i],
                        'insurance_description_content' => $request->insurance_description_content[$i],
                    ]);
            }

        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->insurance_description_content[1])) {
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
        $getImage = DB::table('insurances')->where('insurance_id', '=', $id)->select('insurance_image')->first();
        if($getImage->insurance_image != 'images/insurance/insurance_avatar.jpg'){
            $myFile = base_path($getImage->insurance_image);
            File::delete($myFile);
        }
        $interests = DB::table('insurances')
            ->where('insurance_id', '=', $id)
            ->delete();
    }
}

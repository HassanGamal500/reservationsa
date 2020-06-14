<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class AdvertisementController extends Controller
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
        $ads = DB::table('advertisements')
            ->join('advertisement_description', 'advertisement_description.advertisement_id', '=', 'advertisements.advertisement_id')
            ->select('advertisements.advertisement_id as id', 'advertisements.advertisement_image as image', 'advertisement_description_name as name')
            ->where('language_id', '=', language())
            ->orderBy('advertisements.advertisement_id', 'desc')
            ->get();
        return view('superAdmin.advertisements.index', compact('ads'));
    }

    public function create(){
        $interests = DB::table('interest_description')->where('language_id', '=', language())->select('interest_id', 'interest_name')->get();
        return view('superAdmin.advertisements.create', compact('interests'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'advertisement_description_name' => 'required|max:50',
            'advertisement_image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'type' => 'required',
            'type_id' => 'required',
            'interest_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->advertisement_description_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-A-Za-z]+$/u", $request->advertisement_description_name[2])) {
            
            if ($request->hasFile('advertisement_image')) {
                $imageName = Storage::disk('edit_path')->putFile('images/advertisement', $request->file('advertisement_image'));
            } else {
                $imageName = 'images/advertisement/avatar_advertisement.png';
            }
            
            $CustomersPush = new CustomersPush();
    
            $advertisement = DB::table('advertisements')
                ->insertGetId([
                    'advertisement_image' => $imageName,
                    'interest_id' =>$request->interest_id,
                    'type' => $request->type,
                    'type_id' => $request->type_id
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('advertisement_description')
                    ->insert([
                        'advertisement_description_name' => $request->advertisement_description_name[$i],
                        'language_id' => $i,
                        'advertisement_id' => $advertisement
                    ]);
            }
            
            if($request->type == 1){
                $getName = DB::table('hospital_description')->select('hospital_name as name')->where('hospital_id', '=', $request->type_id)->where('language_id', '=', 2)->first();
            } elseif($request->type == 2) {
                $getName = DB::table('clinic_description')->select('clinic_name as name')->where('clinic_id', '=', $request->type_id)->where('language_id', '=', 2)->first();
            } elseif($request->type == 3) {
                $getName = DB::table('restaurant_description')->select('restaurant_name as name')->where('restaurant_id', '=', $request->type_id)->where('language_id', '=', 2)->first();
            } else {
                $getName = DB::table('catering_description')->select('catering_name as name')->where('catering_id', '=', $request->type_id)->where('language_id', '=', 2)->first();
            }
            
            $ads = DB::table('advertisements')
                ->join('advertisement_description', 'advertisement_description.advertisement_id', '=', 'advertisements.advertisement_id')
                ->select('advertisement_description_name as name')
                ->where('advertisements.advertisement_id', '=', $advertisement)
                ->where('language_id', '=', 2)
                ->first();
            
            $customersToken = DB::table('users')
                ->join('user_interest', 'user_interest.user_id', '=', 'users.id')
                ->select('token')
                ->where('active','1')
                ->where('interest_id', '=', $request->interest_id)
                ->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
            $CustomersPush->send($getName->name, $ads->name, $customersTokenArr, '', '1');
            
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-A-Za-z]+$/u", $request->advertisement_description_name[1])) {
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
        $advertisements = DB::table('advertisements')
            ->join('advertisement_description', 'advertisement_description.advertisement_id', '=', 'advertisements.advertisement_id')
            ->select('advertisements.advertisement_id as id', 'advertisement_image as image', 'advertisement_description_name as name', 'interest_id', 'type', 'type_id')
            ->where('advertisements.advertisement_id', '=', $id)
            ->get();
        if($advertisements[0]->type == 1){
            $select = DB::table('hospital_description')->select('hospital_id as id', 'hospital_name as name')->where('language_id', '=', language())->get();
        } elseif($advertisements[0]->type == 2) {
            $select = DB::table('clinics')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                ->select('clinics.clinic_id as id', 'clinic_name as name')
                ->where('clinics.city_id', '!=', null)
                ->where('language_id', '=', language())
                ->get();
        } elseif($advertisements[0]->type == 3) {
            $select = DB::table('restaurant_description')->select('restaurant_id as id', 'restaurant_name as name')->where('language_id', '=', language())->get();
        } else {
            $select = DB::table('catering_description')->select('catering_id as id', 'catering_name as name')->where('language_id', '=', language())->get();
        }
        $interests = DB::table('interest_description')->where('language_id', '=', language())->select('interest_id', 'interest_name')->get();
        return view('superAdmin.advertisements.edit', compact('advertisements', 'interests', 'select'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'advertisement_description_name' => 'required|max:50',
            'advertisement_image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'type' => 'required',
            'type_id' => 'required',
            'interest_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->advertisement_description_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-A-Za-z]+$/u", $request->advertisement_description_name[2])) {
            $getImage = DB::table('advertisements')->where('advertisement_id', '=', $id)->select('advertisement_image')->first();
    
            if ($request->hasFile('advertisement_image')) {
                if($getImage->advertisement_image != 'images/advertisement/avatar_advertisement.png'){
                    $myFile = base_path($getImage->advertisement_image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/advertisement', $request->file('advertisement_image'));
            } else {
                $imageName = $request->old_image;
            }
    
            $advertisements = DB::table('advertisements')
                ->where('advertisement_id', '=', $id)
                ->update([
                    'advertisement_image' => $imageName,
                    'interest_id' =>$request->interest_id,
                    'type' => $request->type,
                    'type_id' => $request->type_id
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('advertisement_description')
                    ->where('advertisement_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'advertisement_description_name' => $request->advertisement_description_name[$i],
                    ]);
            }
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-A-Za-z]+$/u", $request->advertisement_description_name[1])) {
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
        $getImage = DB::table('advertisements')->where('advertisement_id', '=', $id)->select('advertisement_image')->first();
        if($getImage->advertisement_image != 'images/advertisement/avatar_advertisement.png'){
            $myFile = base_path($getImage->advertisement_image);
            File::delete($myFile);
        }
        $caterings = DB::table('advertisements')
            ->where('advertisement_id', '=', $id)
            ->delete();
    }
    
    public function service(Request $request){
        $type = $request->type;
        if($type == 1){
            $services = DB::table('hospital_description')->where('language_id', '=', language())->select('hospital_id as id', 'hospital_name as name')->get();
        } elseif($type == 2) {
            $services = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
            ->select('clinic_description.clinic_id as id', 'clinic_description.clinic_name as name')
            ->where('clinic_description.language_id', '=', language())
            ->where('administration.type', '=', 2)
            ->where('clinics.city_id', '!=', null)
            ->orderBy('clinics.clinic_id', 'desc')
            ->get();
        } elseif($type == 3) {
            $services = DB::table('restaurant_description')->where('language_id', '=', language())->select('restaurant_id as id', 'restaurant_name as name')->get();
        } else {
            $services = DB::table('catering_description')->where('language_id', '=', language())->select('catering_id as id', 'catering_name as name')->get();
        }

        return response()->json($services);
        
    }
}

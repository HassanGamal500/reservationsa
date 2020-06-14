<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class CateringController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->except('editAdmin', 'update');
    }
    
    public function index(){
        $caterings = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
            ->select('catering.catering_id as id', 'catering_name as name', 'active',
                'image', 'catering_latitude as latitude', 'catering_longitude as longitude',
                'catering_description_part as description_part', 'catering_description_full as description_full')
            ->where('language_id', '=', language())
            ->where('type', '=', 4)
            ->orderBy('catering.catering_id', 'desc')
            ->get();
            
        foreach($caterings as $catering) {
            $numPrice = DB::table('price_plan')
                ->where('catering_id', '=', $catering->id)
                ->count();
                
            $catering->numPrice = $numPrice;
            $reservations = DB::table('reserve_catering')->where('catering_id', '=', $catering->id)->count();
            $catering->reservations = $reservations;
        }
        return view('superAdmin.caterings.index', compact('caterings'));
    }

    public function create(){
        $countries = DB::table('countries')
            ->join('country_description', 'country_description.country_id', '=', 'countries.country_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->select('countries.country_id as id', 'country_name as name')
            ->get();
        $cities = DB::table('cities')
            ->join('city_description', 'city_description.city_id', '=', 'cities.city_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();
        return view('superAdmin.caterings.create', compact('countries', 'cities'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'catering_name' => 'required|max:50',
            'catering_phone' => 'required|unique:administration,phone|max:13',
            'catering_image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'catering_description_part' => 'required|max:140',
            'catering_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'catering_latitude' => 'required',
            'catering_longitude' => 'required',
            'email' => 'required|unique:administration,email',
            'password' => 'required|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('catering_image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/catering', $request->file('catering_image'));
        } else {
            $imageName = 'images/catering/avatar_catering.jpg';
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->catering_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->catering_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_full[2])) {
            $catering = DB::table('catering')
                ->insertGetId([
                    'catering_latitude' => convert($request->catering_latitude),
                    'catering_longitude' => convert($request->catering_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
                
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('catering_description')
                    ->insert([
                        'catering_name' => $request->catering_name[$i],
                        'catering_description_part' => $request->catering_description_part[$i],
                        'catering_description_full' => $request->catering_description_full[$i],
                        'language_id' => $i,
                        'catering_id' => $catering
                    ]);
            }
            
            $admin = DB::table('administration')
                ->insert([
                    'phone' => convert($request->catering_phone),
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'image' => $imageName,
                    'type' => 4,
                    'type_id' => $catering
                ]);
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->catering_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->catering_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_full[1])) {
                $error = trans('admin.name or description part or description full must be contain only english characters');
            } else {
                $error = trans('admin.name or description part or description full must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $caterings = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
            ->select('catering.catering_id as id', 'image', 'phone', 'active', 'country_id',
                'catering_latitude as latitude', 'catering_longitude as longitude', 'city_id',
                'catering_name as name', 'catering_description_part as description_part',
                'catering_description_full as description_full')
            ->where('catering.catering_id', '=', $id)
            ->where('type', '=', 4)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $id)->select('email')->first();
        
        $countries = DB::table('countries')
            ->join('country_description', 'country_description.country_id', '=', 'countries.country_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->select('countries.country_id as id', 'country_name as name')
            ->get();
        $cities = DB::table('cities')
            ->join('city_description', 'city_description.city_id', '=', 'cities.city_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->where('country_id', '=', $caterings[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.caterings.edit', compact('caterings', 'user', 'countries', 'cities'));
    }
    
    public function editAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $caterings = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
            ->select('catering.catering_id as id', 'image', 'phone', 'country_id',
                'catering_latitude as latitude', 'catering_longitude as longitude', 'city_id',
                'catering_name as name', 'catering_description_part as description_part',
                'catering_description_full as description_full')
            ->where('catering.catering_id', '=', $type_id)
            ->where('type', '=', 4)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $type_id)->select('email')->first();
        
        $countries = DB::table('countries')
            ->join('country_description', 'country_description.country_id', '=', 'countries.country_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->select('countries.country_id as id', 'country_name as name')
            ->get();
        
        $cities = DB::table('cities')
            ->join('city_description', 'city_description.city_id', '=', 'cities.city_id')
            ->where('language_id', '=', language())
            ->where('is_active', '=', 1)
            ->where('country_id', '=', $caterings[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.caterings.edit', compact('caterings', 'user', 'countries', 'cities'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'catering_name' => 'required|max:50',
            'catering_phone' => 'required|max:13',
            'catering_image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'catering_description_part' => 'required|max:140',
            'catering_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'catering_latitude' => 'required',
            'catering_longitude' => 'required',
            'email' => 'required', 
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/',
            'active' => 'nullable'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->catering_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->catering_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->catering_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_full[2])) {
            $caterings = DB::table('catering')
                ->where('catering_id', '=', $id)
                ->update([
                    'catering_latitude' => convert($request->catering_latitude),
                    'catering_longitude' => convert($request->catering_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
                
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('catering_description')
                    ->where('catering_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'catering_name' => $request->catering_name[$i],
                        'catering_description_part' => $request->catering_description_part[$i],
                        'catering_description_full' => $request->catering_description_full[$i],
                    ]);
            }
            
            if ($request->catering_phone) {
                $phone = DB::table('administration')->where('phone', '=', $request->catering_phone)->where('type', '=', 4)->where('type_id', '!=', $id)->first();
                if($phone) {
                    $error = trans('admin.This phone has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 1)
                    ->where('type_id', '=', $id)
                    ->update(['phone' => convert($request->catering_phone)]);
                }
            }
            
            if ($request->email) {
                $email = DB::table('administration')->where('email', '=', $request->email)->where('type', '=', 1)->where('type_id', '!=', $id)->first();
                if($email) {
                    $error = trans('admin.This email has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 4)
                    ->where('type_id', '=', $id)
                    ->update(['email' => $request->email]);
                }
            }
            
            $getImage = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $id)->select('image')->first();
    
            if ($request->hasFile('catering_image')) {
                if($getImage->image != 'images/catering/avatar_catering.jpg'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/catering', $request->file('catering_image'));
                $user = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $user = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $id)->update(['image' => $imageName]);
            }
    
            if ($request->password) {
                $user = DB::table('administration')
                ->where('type', '=', 4)
                ->where('type_id', '=', $id)
                ->update(['password' => bcrypt($request->password)]);
            }
            
            if(auth()->guard('admin')->user()->type == 5) {
                if ($request->active == 1) {
                    $catering = DB::table('catering')
                        ->where('catering_id', '=', $id)
                        ->update(['active' => $request->active]);
                } else {
                    $catering = DB::table('catering')
                        ->where('catering_id', '=', $id)
                        ->update(['active' => $request->active]);
                }
            }
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->catering_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->catering_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->catering_description_full[1])) {
                $error = trans('admin.name or description part or description full must be contain only english characters');
            } else {
                $error = trans('admin.name or description part or description full must be contain only arabic characters');
            }
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $getImage = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $id)->select('image')->first();
        if($getImage->image != 'images/catering/avatar_catering.jpg'){
            $myFile = base_path($getImage->image);
            File::delete($myFile);
        }
        $caterings = DB::table('catering')
            ->where('catering_id', '=', $id)
            ->delete();
        $admin = DB::table('administration')
            ->where('type', '=', 4)
            ->where('type_id', '=', $id)
            ->delete();
    }
}

<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class HospitalController extends Controller
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
        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
            ->select('hospitals.hospital_id as id', 'hospital_name as name', 'image', 'phone', 'active',
                'hospital_description_part as description_part', 'hospital_description_full as description_full',
                'hospital_latitude as latitude', 'hospital_longitude as longitude')
            ->where('language_id', '=', language())
            ->where('type', '=', 1)
            ->orderBy('hospitals.hospital_id', 'desc')
            ->get();

        foreach ($hospitals as $hospital) {
            $numClinic = DB::table('hospital_clinic')
                ->join('clinics', 'clinics.clinic_id', '=', 'hospital_clinic.clinic_id')
                ->where('hospital_clinic.hospital_id', '=', $hospital->id)
                ->count();

            $numDoctor = DB::table('doctors')
                ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
                ->where('hospital_clinic.hospital_id', '=', $hospital->id)
                ->count();
                
            $reservations = DB::table('reserve_hospital')->where('hospital_id', '=', $hospital->id)->count();

            $hospital->numClinic = $numClinic;
            $hospital->numDoctor = $numDoctor;
            $hospital->reservations = $reservations;

        }

        return view('superAdmin.hospitals.index', compact('hospitals'));
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
            ->where('is_used', '=', 1)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();
        return view('superAdmin.hospitals.create', compact('countries', 'cities'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'hospital_name' => 'required|max:50',
            'hospital_phone' => 'required|unique:administration,phone|max:13',
            'hospital_image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'hospital_description_part' => 'required|max:140',
            'hospital_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'hospital_latitude' => 'required',
            'hospital_longitude' => 'required',
            'email' => 'required|unique:administration,email',
            'password' => 'required|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('hospital_image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/hospital', $request->file('hospital_image'));
        } else {
            $imageName = 'images/hospital/avatar_hospital.png';
        }

        if(preg_match("/^[0-9.]+$/i", convert($request->hospital_latitude))
        && preg_match("/^[0-9.]+$/i", convert($request->hospital_longitude))
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email)) 
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_full[2])) {
            $hospitals = DB::table('hospitals')
                ->insertGetId([
                    'hospital_latitude' => convert($request->hospital_latitude),
                    'hospital_longitude' => convert($request->hospital_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
            
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('hospital_description')
                    ->insert([
                        'hospital_name' => $request->hospital_name[$i],
                        'hospital_description_part' => $request->hospital_description_part[$i],
                        'hospital_description_full' => $request->hospital_description_full[$i],
                        'language_id' => $i,
                        'hospital_id' => $hospitals
                    ]);
            }
            
            $admin = DB::table('administration')
                ->insert([
                    'phone' => convert($request->hospital_phone),
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'image' => $imageName,
                    'type' => 1,
                    'type_id' => $hospitals
                ]);
                
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->hospital_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->hospital_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z0-9].*[A-Za-z0-9]+$/", $request->hospital_name[1]) && !preg_match("/^[A-Za-z0-9].*[A-Za-z0-9]+$/", $request->hospital_description_part[1]) && !preg_match("/^[A-Za-z0-9].*[A-Za-z0-9]+$/", $request->hospital_description_full[1])) {
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
        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
            ->select('hospitals.hospital_id as id', 'image', 'phone', 'city_id', 'active', 'country_id',
                'hospital_latitude as latitude', 'hospital_longitude as longitude', 'hospital_name as name',
                'hospital_description_part as description_part', 'hospital_description_full as description_full')
            ->where('hospitals.hospital_id', '=', $id)
            ->where('type', '=', 1)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $id)->select('phone', 'email')->first();
        
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
            ->where('country_id', '=', $hospitals[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.hospitals.edit', compact('hospitals', 'user', 'countries', 'cities'));
    }
    
    public function editAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
            ->select('hospitals.hospital_id as id', 'image', 'phone', 'city_id', 'country_id',
                'hospital_latitude as latitude', 'hospital_longitude as longitude', 'hospital_name as name',
                'hospital_description_part as description_part', 'hospital_description_full as description_full')
            ->where('hospitals.hospital_id', '=', $type_id)
            ->where('type', '=', 1)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $type_id)->select('email')->first();

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
            ->where('country_id', '=', $hospitals[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.hospitals.edit', compact('hospitals', 'user', 'countries', 'cities'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'hospital_name' => 'required|max:50',
            'hospital_phone' => 'required|max:13',
            'hospital_image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'hospital_description_part' => 'required|max:140',
            'hospital_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'hospital_latitude' => 'required',
            'hospital_longitude' => 'required',
            'email' => 'required',
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->hospital_latitude)) && preg_match("/^[0-9.]+$/i", convert($request->hospital_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->hospital_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_full[2])) {
            $hospitals = DB::table('hospitals')
                ->where('hospital_id', '=', $id)
                ->update([
                    'hospital_latitude' => convert($request->hospital_latitude),
                    'hospital_longitude' => convert($request->hospital_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
            
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('hospital_description')
                    ->where('hospital_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'hospital_name' => $request->hospital_name[$i],
                        'hospital_description_part' => $request->hospital_description_part[$i],
                        'hospital_description_full' => $request->hospital_description_full[$i],
                    ]);
            }
            
            if ($request->hospital_phone) {
                $phone = DB::table('administration')->where('phone', '=', $request->hospital_phone)->where('type', '=', 1)->where('type_id', '!=', $id)->first();
                if($phone) {
                    $error = trans('admin.This phone has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 1)
                    ->where('type_id', '=', $id)
                    ->update(['phone' => convert($request->hospital_phone)]);
                }
            }
            
            if ($request->email) {
                $email = DB::table('administration')->where('email', '=', $request->email)->where('type', '=', 1)->where('type_id', '!=', $id)->first();
                if($email) {
                    $error = trans('admin.This email has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 1)
                    ->where('type_id', '=', $id)
                    ->update(['email' => $request->email]);
                }
            }
            
            $getImage = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $id)->select('image')->first();
    
            if ($request->hasFile('hospital_image')) {
                if($getImage->image != 'images/hospital/avatar_hospital.png'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/hospital', $request->file('hospital_image'));
                $user = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $user = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $id)->update(['image' => $imageName]);
            }
            
            if ($request->password) {
                $user = DB::table('administration')
                ->where('type', '=', 1)
                ->where('type_id', '=', $id)
                ->update(['password' => bcrypt($request->password)]);
            }
            
            if(auth()->guard('admin')->user()->type == 5) {
                if ($request->active == 1) {
                    $hospitals = DB::table('hospitals')
                        ->where('hospital_id', '=', $id)
                        ->update(['active' => $request->active]);
                } else {
                    $hospitals = DB::table('hospitals')
                        ->where('hospital_id', '=', $id)
                        ->update(['active' => $request->active]);
                }
            }
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->hospital_longitude)) && !preg_match("/^[0-9.]+$/i", convert($request->hospital_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->hospital_description_full[1])) {
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
        $getImage = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $id)->select('image')->first();
        if($getImage->image != 'images/hospital/avatar_hospital.png'){
            $myFile = base_path($getImage->image);
            File::delete($myFile);
        }
        $hospitals = DB::table('hospitals')
            ->where('hospital_id', '=', $id)
            ->delete();
        $admin = DB::table('administration')
            ->where('type', '=', 1)
            ->where('type_id', '=', $id)
            ->delete();
    }
}

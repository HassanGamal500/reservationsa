<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ClinicController extends Controller
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
        $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'clinic_name as name', 'phone', 'active',
                'image', 'clinic_latitude as latitude', 'clinic_longitude as longitude',
                'clinic_description_part as description_part', 'clinic_description_full as description_full')
            ->where('language_id', '=', language())
            ->where('city_id', '!=', null)
            ->where('type', '=', 2)
            ->orderBy('clinics.clinic_id', 'desc')
            ->get();

        foreach ($clinics as $clinic) {
            $numDoctor = DB::table('doctors')
                ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                ->where('clinic_doctor.clinic_id', '=', $clinic->id)
                ->count();
                
            $reservations = DB::table('reserve_clinic')->where('clinic_id', '=', $clinic->id)->count();

            $clinic->numDoctor = $numDoctor;
            $clinic->reservations = $reservations;
        }
        return view('superAdmin.clinics.index', compact('clinics'));
    }

    public function show($id){
        $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinic_doctor.clinic_id')
            ->select('doctors.doctor_id as id', 'doctor_detail_name as name', 'clinic_name', 'active', 'doctor_price as price',
                'doctor_detail_specialization as specialization','doctor_available_start as start', 'doctor_available_end as end')
            ->where('clinic_doctor.clinic_id', '=', $id)
            ->where('doctor_detail.language_id', '=', language())
            ->where('clinic_description.language_id', '=', language())
            ->orderBy('doctors.doctor_id', 'desc')
            ->get();
            
        $clinic_name = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinic_name')
            ->where('clinics.clinic_id', '=', $id)
            ->where('clinic_description.language_id', '=', language())
            ->first();

        return view('superAdmin.clinic_doctor.index', compact('doctors', 'clinic_name'));
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
        return view('superAdmin.clinics.create', compact('countries', 'cities'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'clinic_name' => 'required|max:50',
            'clinic_phone' => 'required|unique:administration,phone|max:13',
            'clinic_image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'clinic_description_part' => 'required|max:140',
            'clinic_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'clinic_latitude' => 'required',
            'clinic_longitude' => 'required',
            'email' => 'required|unique:administration,email',
            'password' => 'required|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('clinic_image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/clinic', $request->file('clinic_image'));
        } else {
            $imageName = 'images/clinic/avatar_clinic.jpg';
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->clinic_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->clinic_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_full[2])) {
            $clinics = DB::table('clinics')
                ->insertGetId([
                    'clinic_latitude' => convert($request->clinic_latitude),
                    'clinic_longitude' => convert($request->clinic_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
            
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('clinic_description')
                    ->insert([
                        'clinic_name' => $request->clinic_name[$i],
                        'clinic_description_part' => $request->clinic_description_part[$i],
                        'clinic_description_full' => $request->clinic_description_full[$i],
                        'language_id' => $i,
                        'clinic_id' => $clinics
                    ]);
            }
            
            $admin = DB::table('administration')
                ->insert([
                    'phone' => convert($request->clinic_phone),
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'image' => $imageName,
                    'type' => 2,
                    'type_id' => $clinics
                ]);
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->clinic_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->clinic_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_full[1])) {
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
        $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'phone', 'city_id', 'active', 'country_id',
                'image', 'clinic_latitude as latitude', 'clinic_longitude as longitude',
                'clinic_name as name', 'clinic_description_part as description_part', 'clinic_description_full as description_full')
            ->where('clinics.clinic_id', '=', $id)
            ->where('type', '=', 2)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $id)->select('email')->first();
        // dd($user);
        
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
            ->where('country_id', '=', $clinics[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.clinics.edit', compact('clinics', 'user', 'countries', 'cities'));
    }
    
    public function editAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        
        $clinics = DB::table('clinics')
        ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
        ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
        ->select('clinics.clinic_id as id', 'phone', 'city_id', 'country_id',
            'image', 'clinic_latitude as latitude', 'clinic_longitude as longitude',
            'clinic_name as name', 'clinic_description_part as description_part', 'clinic_description_full as description_full')
        ->where('clinics.clinic_id', '=', $type_id)
        ->where('type', '=', 2)
        ->get();
        
        $user = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $type_id)->select('email')->first();
        
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
            ->where('country_id', '=', $clinics[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.clinics.edit', compact('clinics', 'user', 'countries', 'cities'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'clinic_name' => 'required|max:50',
            'clinic_phone' => 'required|max:13',
            'clinic_image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'clinic_description_part' => 'required|max:140',
            'clinic_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'clinic_latitude' => 'required',
            'clinic_longitude' => 'required',
            'email' => 'required',
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->clinic_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->clinic_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_full[2])) {
            $clinics = DB::table('clinics')
                ->where('clinic_id', '=', $id)
                ->update([
                    'clinic_latitude' => convert($request->clinic_latitude),
                    'clinic_longitude' => convert($request->clinic_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
                
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('clinic_description')
                    ->where('clinic_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'clinic_name' => $request->clinic_name[$i],
                        'clinic_description_part' => $request->clinic_description_part[$i],
                        'clinic_description_full' => $request->clinic_description_full[$i],
                    ]);
            }
            
            if ($request->clinic_phone) {
                $phone = DB::table('administration')->where('phone', '=', $request->clinic_phone)->where('type', '=', 2)->where('type_id', '!=', $id)->first();
                if($phone) {
                    $error = trans('admin.This phone has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 2)
                    ->where('type_id', '=', $id)
                    ->update(['phone' => convert($request->clinic_phone)]);
                }
            }
            
            if ($request->email) {
                $email = DB::table('administration')->where('email', '=', $request->email)->where('type', '=', 2)->where('type_id', '!=', $id)->first();
                if($email) {
                    $error = trans('admin.This email has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 2)
                    ->where('type_id', '=', $id)
                    ->update(['email' => $request->email]);
                }
            }
            
            $getImage = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $id)->select('image')->first();
    
            if ($request->hasFile('clinic_image')) {
                if($getImage->clinic_image != 'images/clinic/avatar_clinic.jpg'){
                    $myFile = base_path($getImage->clinic_image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/clinic', $request->file('clinic_image'));
                $user = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $user = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $id)->update(['image' => $imageName]);
            }
            
            if ($request->password) {
                $user = DB::table('administration')
                ->where('type', '=', 2)
                ->where('type_id', '=', $id)
                ->update(['password' => bcrypt($request->password)]);
            }
            
            if(auth()->guard('admin')->user()->type == 5) {
                if ($request->active == 1) {
                    $clinics = DB::table('clinics')
                        ->where('clinic_id', '=', $id)
                        ->update(['active' => $request->active]);
                } else {
                    $clinics = DB::table('clinics')
                        ->where('clinic_id', '=', $id)
                        ->update(['active' => $request->active]);
                }
            }
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->clinic_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->clinic_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->clinic_description_full[1])) {
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
        $getImage = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $id)->select('image')->first();
        if($getImage->image != 'images/clinic/avatar_clinic.jpg'){
            $myFile = base_path($getImage->image);
            File::delete($myFile);
        }
        $hospitals = DB::table('clinics')
            ->where('clinic_id', '=', $id)
            ->delete();
        $admin = DB::table('administration')
            ->where('type', '=', 2)
            ->where('type_id', '=', $id)
            ->delete();
    }
}

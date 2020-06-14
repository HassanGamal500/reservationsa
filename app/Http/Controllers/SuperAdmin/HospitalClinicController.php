<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class HospitalClinicController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5 && auth()->guard('admin')->user()->type != 1){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $hospitals = DB::table('hospital_clinic')
            ->join('hospitals', 'hospitals.hospital_id', '=', 'hospital_clinic.hospital_id')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('clinics', 'clinics.clinic_id', '=', 'hospital_clinic.clinic_id')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'hospitals.hospital_id', 'hospital_name', 'clinics.active',
                'clinic_latitude as latitude', 'clinic_longitude as longitude', 'clinic_name as name')
            ->where('hospital_description.language_id', '=', language())
            ->where('clinic_description.language_id', '=', language())
            ->where('hospital_clinic.hospital_id', '=', $type_id)
            ->orderBy('clinics.clinic_id', 'desc')
            ->get();
            
            foreach ($hospitals as $hospital) {
            
                $numDoctor = DB::table('doctors')
                    ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                    ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
                    ->where('hospital_clinic.hospital_id', '=', $type_id)
                    ->where('hospital_clinic.clinic_id', '=', $hospital->id)
                    ->count();
    
                $hospital->numDoctor = $numDoctor;
                
            }
            
            // dd($hospitals);

        return view('superAdmin.hospital_clinic.hospital_doctor', compact('hospitals'));
    }

    public function show($id){
        $hospitals = DB::table('hospital_clinic')
            ->join('hospitals', 'hospitals.hospital_id', '=', 'hospital_clinic.hospital_id')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('clinics', 'clinics.clinic_id', '=', 'hospital_clinic.clinic_id')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'hospitals.hospital_id', 'hospital_name', 'clinics.active',
                'clinic_latitude as latitude', 'clinic_longitude as longitude', 'clinic_name as name')
            ->where('hospital_description.language_id', '=', language())
            ->where('clinic_description.language_id', '=', language())
            ->where('hospital_clinic.hospital_id', '=', $id)
            ->orderBy('clinics.clinic_id', 'desc')
            ->get();
            
            foreach ($hospitals as $hospital) {
            
                $numDoctor = DB::table('doctors')
                    ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                    ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
                    ->where('hospital_clinic.clinic_id', '=', $hospital->id)
                    ->count();
    
                $hospital->numDoctor = $numDoctor;
                
            }
            
        $hospital_name = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->select('hospital_name')
            ->where('hospital_description.language_id', '=', language())
            ->where('hospitals.hospital_id', '=', $id)
            ->first();
        
        return view('superAdmin.hospital_clinic.hospital_doctor', compact('hospitals', 'hospital_name'));
    }

    public function create(){
        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->select('hospitals.hospital_id as id', 'hospital_name as name')
            ->where('language_id', '=', language())
            ->get();
        return view('superAdmin.hospital_clinic.create', compact('hospitals'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'clinic_name' => 'required|max:50',
            'hospital_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->clinic_name[2])) {
            $clinics = DB::table('clinics')
                ->insertGetId([
                    'city_id' => null,
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('clinic_description')
                    ->insert([
                        'clinic_name' => $request->clinic_name[$i],
                        'language_id' => $i,
                        'clinic_id' => $clinics
                    ]);
            }
    
            $hospital_clinic = DB::table('hospital_clinic')->insert([
                'hospital_id' => $request->hospital_id,
                'clinic_id' => $clinics
            ]);
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->clinic_name[1])) {
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
        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->select('hospitals.hospital_id as id', 'hospital_name as name')
            ->where('language_id', '=', language())
            ->get();

        $clinics = DB::table('clinics')
            ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinics.clinic_id')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'hospital_id', 'clinic_name as name', 'active')
            ->where('clinics.clinic_id', '=', $id)
            ->get();

        return view('superAdmin.hospital_clinic.edit', compact('clinics', 'hospitals'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'clinic_name' => 'required|max:50',
            'hospital_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->clinic_name[1]) 
        && preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->clinic_name[2])) {
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('clinic_description')
                    ->where('clinic_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'clinic_name' => $request->clinic_name[$i],
                    ]);
            }
            
            if ($request->active == 1) {
                $clinics = DB::table('clinics')
                    ->where('clinic_id', '=', $id)
                    ->update(['active' => $request->active]);
            } else {
                $clinics = DB::table('clinics')
                    ->where('clinic_id', '=', $id)
                    ->update(['active' => $request->active]);
            }
    
            $hospital_clinic = DB::table('hospital_clinic')
                ->where('clinic_id', '=', $id)
                ->update([
                    'hospital_id' => $request->hospital_id
                ]);
        } else {
            if(preg_match("/^[\p{Arabic}\s\p{N}_.,{}@#!~%()<>-]+$/u", $request->clinic_name[1])) {
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
        // $getImage = DB::table('clinics')->where('clinic_id', '=', $id)->select('clinic_image')->first();
        // if($getImage->clinic_image != 'images/clinic/avatar_clinic.jpg'){
        //     $myFile = base_path($getImage->clinic_image);
        //     File::delete($myFile);
        // }
        $clinic = DB::table('clinics')
            ->where('clinic_id', '=', $id)
            ->delete();
    }
}

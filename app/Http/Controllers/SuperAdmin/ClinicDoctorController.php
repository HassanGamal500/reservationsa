<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ClinicDoctorController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5 && auth()->guard('admin')->user()->type != 2 && auth()->guard('admin')->user()->type != 1){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $type_id = auth()->guard('admin')->user()->type_id;
        if(auth()->guard('admin')->user()->type == 1){
            $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
            ->select('doctors.doctor_id as id', 'doctor_detail_name as name',
                'doctor_detail_specialization as specialization', 'active', 'doctor_price as price',
                'doctor_available_start as start', 'doctor_available_end as end')
            ->where('hospital_clinic.hospital_id', '=', $type_id)
            ->where('language_id', '=', language())
            ->orderBy('doctors.doctor_id', 'desc')
            ->get();
        } else {
            $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->select('doctors.doctor_id as id', 'doctor_detail_name as name',
                'doctor_detail_specialization as specialization', 'active', 'doctor_price as price',
                'doctor_available_start as start', 'doctor_available_end as end')
            ->where('clinic_doctor.clinic_id', '=', $type_id)
            ->where('language_id', '=', language())
            ->orderBy('doctors.doctor_id', 'desc')
            ->get();
        }
        return view('superAdmin.clinic_doctor.index', compact('doctors'));
    }

    public function show($id){
        $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospital_clinic.hospital_id')
            ->select('doctors.doctor_id as id', 'doctor_detail_name as name', 'hospital_name',
                'doctor_detail_specialization as specialization', 'active', 'doctor_price as price',
                'doctor_available_start as start', 'doctor_available_end as end')
            ->where('hospital_clinic.hospital_id', '=', $id)
            // ->orwhere('hospital_clinic.clinic_id', '=', $id)
            ->where('hospital_description.language_id', '=', language())
            ->where('doctor_detail.language_id', '=', language())
            ->orderBy('doctors.doctor_id', 'desc')
            ->get();
            
        $hospital_name = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->select('hospital_name')
            ->where('hospital_description.language_id', '=', language())
            ->where('hospitals.hospital_id', '=', $id)
            ->first();
            
            // dd($doctors);

        return view('superAdmin.clinic_doctor.index', compact('doctors', 'hospital_name'));
    }
    
    public function showTwo($id){
        $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinic_doctor.clinic_id')
            ->select('doctors.doctor_id as id', 'doctor_detail_name as name', 'clinic_name',
                'doctor_detail_specialization as specialization', 'active', 'doctor_price as price',
                'doctor_available_start as start', 'doctor_available_end as end')
            ->where('clinic_doctor.clinic_id', '=', $id)
            ->where('clinic_description.language_id', '=', language())
            ->where('doctor_detail.language_id', '=', language())
            ->orderBy('doctors.doctor_id', 'desc')
            ->get();
            
        $clinic_name = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinic_name')
            ->where('clinic_description.language_id', '=', language())
            ->where('clinics.clinic_id', '=', $id)
            ->first();
            
            // dd($doctors);

        return view('superAdmin.clinic_doctor.index', compact('doctors', 'clinic_name'));
    }

    public function create(){
        if(auth()->guard('admin')->user()->type == 5){
            $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'clinic_name as name')
            ->where('language_id', '=', language())
            ->get();
        } else {
            $type_id = auth()->guard('admin')->user()->type_id;
            $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'clinic_name as name')
            ->where('hospital_id', '=', $type_id)
            ->where('language_id', '=', language())
            ->get();
        }
        return view('superAdmin.clinic_doctor.create', compact('clinics'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'doctor_detail_name' => 'required|max:50',
            'doctor_detail_specialization' => 'required|max:100',
            'doctor_available_start' => 'required',
            'doctor_available_end' => 'required',
            'doctor_price' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->doctor_detail_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->doctor_detail_specialization[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_specialization[2])) {
            
            $doctor = DB::table('doctors')
                ->insertGetId([
                    'doctor_available_start' => $request->doctor_available_start,
                    'doctor_available_end' => $request->doctor_available_end,
                    'doctor_price' => convert($request->doctor_price)
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('doctor_detail')
                    ->insert([
                        'doctor_detail_name' => $request->doctor_detail_name[$i],
                        'doctor_detail_specialization' => $request->doctor_detail_specialization[$i],
                        'language_id' => $i,
                        'doctor_id' => $doctor
                    ]);
            }
    
            $clinic_doctor = DB::table('clinic_doctor')->insert([
                'clinic_id' => $request->clinic_id,
                'doctor_id' => $doctor
            ]);

        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_specialization[1])) {
                $error = trans('admin.name or specialization must be contain only english characters');
            } else {
                $error = trans('admin.name or specialization must be contain only arabic characters');
            }
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        if(auth()->guard('admin')->user()->type == 5){
            $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'clinic_name as name')
            ->where('language_id', '=', language())
            ->get();
        } else {
            $type_id = auth()->guard('admin')->user()->type_id;
            $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinics.clinic_id as id', 'clinic_name as name')
            ->where('hospital_id', '=', $type_id)
            ->where('language_id', '=', language())
            ->get();
        }
        

        $doctors = DB::table('doctors')
            ->leftJoin('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->leftJoin('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
            ->select('doctors.doctor_id as id', 'doctor_available_start as start', 'doctor_price as price', 'active',
                'doctor_available_end as end', 'clinic_id', 'doctor_detail_name as name', 'doctor_detail_specialization as specialization')
            ->where('doctors.doctor_id', '=', $id)
            ->get();
//        dd($doctors);
        return view('superAdmin.clinic_doctor.edit', compact('clinics', 'doctors'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'doctor_detail_name' => 'required|max:50',
            'doctor_detail_specialization' => 'required|max:100',
            'doctor_available_start' => 'required',
            'doctor_available_end' => 'required',
            'doctor_price' => 'required',
            'clinic_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->doctor_detail_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->doctor_detail_specialization[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_specialization[2])) {
            $hospitals = DB::table('doctors')
                ->where('doctor_id', '=', $id)
                ->update([
                    'doctor_available_start' => $request->doctor_available_start,
                    'doctor_available_end' => $request->doctor_available_end,
                    'doctor_price' => convert($request->doctor_price)
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('doctor_detail')
                    ->where('doctor_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'doctor_detail_name' => $request->doctor_detail_name[$i],
                        'doctor_detail_specialization' => $request->doctor_detail_specialization[$i]
                    ]);
            }
    
            $hospital_clinic = DB::table('clinic_doctor')
                ->where('doctor_id', '=', $id)
                ->update([
                    'clinic_id' => $request->clinic_id
                ]);
                
            if ($request->active == 1) {
                $doctors = DB::table('doctors')
                    ->where('doctor_id', '=', $id)
                    ->update(['active' => $request->active]);
            } else {
                $doctors = DB::table('doctors')
                    ->where('doctor_id', '=', $id)
                    ->update(['active' => $request->active]);
            }
        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->doctor_detail_specialization[1])) {
                $error = trans('admin.name or specialization must be contain only english characters');
            } else {
                $error = trans('admin.name or specialization must be contain only arabic characters');
            }
        }
        
        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';
        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $doctor = DB::table('doctors')
            ->where('doctor_id', '=', $id)
            ->delete();
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClinicController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function allClinics(Request $request) {
        $validator = validator()->make($request->all(), [
            'language_id' => 'required',
            'country_id' => 'nullable',
            'city_id' => 'nullable'
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }
        
        $array = array();
        
        if($request->city_id){
            $clinics = DB::table('clinics')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
                ->where('language_id', '=', $request->language_id)
                ->where('country_id', '=', $request->country_id)
                ->where('city_id', '=', $request->city_id)
                ->where('type', '=', 2)
                ->where('active', '=', 1)
                ->select('clinics.clinic_id', 'clinic_name', 'image as clinic_image', 'clinic_description_part', 'language_id')
                ->get();
    
            foreach($clinics as $clinic){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 2)
                    ->where('rates.type_id', '=', $clinic->clinic_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $clinic->rates=$rates;
                $array[]=$clinic;
            }
        } else {
            $clinics = DB::table('clinics')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
                ->where('language_id', '=', $request->language_id)
                ->where('city_id', '!=', null)
                ->where('type', '=', 2)
                ->where('active', '=', 1)
                ->select('clinics.clinic_id', 'clinic_name', 'image as clinic_image', 'clinic_description_part', 'language_id')
                ->get();
    
            foreach($clinics as $clinic){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 2)
                    ->where('rates.type_id', '=', $clinic->clinic_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $clinic->rates=$rates;
                $array[]=$clinic;
            }
        }
        
        if($clinics){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $array
            ];
            return response()->json($response);
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
            return response()->json($response);
        }

    }

    public function clinic(Request $request) {
        $validator = validator()->make($request->all(), [
            'clinic_id' => 'required',
            'language_id' => 'required'
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }

        $array = array();

        $clinics = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
            ->where('clinics.clinic_id', '=', $request->clinic_id)
            ->where('language_id', '=', $request->language_id)
            ->where('type', '=', 2)
            ->where('active', '=', 1)
            ->select('clinics.clinic_id', 'image as clinic_image', 'phone as clinic_phone',
                'clinic_latitude', 'clinic_longitude','clinic_name',
                'clinic_description_part', 'clinic_description_full',
                'language_id')
            ->get();

        foreach($clinics as $clinic){
            $rates = DB::table('rates')
                ->where('rates.type', '=', 2)
                ->where('rates.type_id', '=', $clinic->clinic_id)
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id', 'rate_star', 'rate_content', 'user_id', 'name', 'image')
                ->orderBy('rate_id', 'desc')
                ->limit(3)
                ->get();
            $count = DB::table('rates')
                ->where('rates.type', '=', 2)
                ->where('rates.type_id', '=', $clinic->clinic_id)
                ->count();
            $clinic->rates=$rates;
            $clinic->count=$count;
            $images = DB::table('images')->where('type', '=', 2)->where('type_id', '=', $clinic->clinic_id)->get();
            $clinic->images = $images;
            $array[]=$clinic;
        }

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $array
        ];

        return response()->json($response);
    }
    
    public function available_work(Request $request){
        $validator = validator()->make($request->all(), [
            'day' => 'required',
            'doctor_id' => 'required',
            'language_id' => 'required'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $doctors = DB::table('doctors')
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->where('doctors.doctor_id', '=', $request->doctor_id)
            ->where('language_id', '=', $request->language_id)
            ->select('doctor_detail_name as name', 'doctor_detail_specialization as specialization', 'doctor_available_start as start', 'doctor_available_end as end', 'doctor_price')
            ->first();
        
        $start = $doctors->start;
        $end = $doctors->end;
        
        $dates = array();
    
        for($i = $start; $i <= $end; $i++){
            $hours = DB::table('reserve_clinic')
                ->where('doctor_id', '=', $request->doctor_id)
                ->where('reserve_clinic_day', '=', $request->day)
                ->where('reserve_clinic_time', '=', $i)
                ->count();
            if($hours == 0){
                $dates[] = $i . ":00";
            }
        }
        
        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => [
                    'doctor_detail' => $doctors,
                    'available_work' => $dates
                ]
        ];
        return response()->json($response);
    }

    public function reserveClinic(Request $request) {
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
            'clinic_id' => 'required',
            'doctor_id' => 'required',
            'reserve_clinic_day' => 'required',
            'reserve_clinic_time' => 'required',
            'reserve_clinic_is_insurance' => 'required',
            'reserve_clinic_payment_id' => 'required',
            'reserve_clinic_has_file' => 'required',
            'reserve_clinic_notice' => 'nullable'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $user = DB::table('users')->where('id', '=', $request->user_id)->select('name', 'email', 'phone', 'phone_code')->first();
        $clinic = DB::table('clinic_description')->where('clinic_id', '=', $request->clinic_id)->where('language_id', '=', $request->language_id)->select('clinic_name')->first();
        $clinic_admin = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $request->clinic_id)->select('email', 'phone')->first();
        $doctor_price = DB::table('doctors')->where('doctor_id', '=', $request->doctor_id)->select('doctor_price')->first();
        $doctor = DB::table('doctor_detail')->where('doctor_id', '=', $request->doctor_id)->where('language_id', '=', $request->language_id)->select('doctor_detail_name', 'doctor_detail_specialization')->first();

        $reserve = DB::table('reserve_clinic')->insertGetId([
            'user_id' => $request->user_id,
            'user_name' => $user->name,
            'user_email' => $user->email,
            'user_phone' => $user->phone,
            'user_phone_code' => $user->phone_code, 
            'clinic_id' => $request->clinic_id,
            'clinic_name' => $clinic->clinic_name,
            'clinic_email' => $clinic_admin->email,
            'clinic_phone' => $clinic_admin->phone,
            'doctor_id' => $request->doctor_id,
            'doctor_name' => $doctor->doctor_detail_name,
            'doctor_specialization' => $doctor->doctor_detail_specialization,
            'doctor_price' => $doctor_price->doctor_price,
            'reserve_clinic_day' => $request->reserve_clinic_day,
            'reserve_clinic_time' => $request->reserve_clinic_time,
            'reserve_clinic_is_insurance' => $request->reserve_clinic_is_insurance,
            'reserve_clinic_payment_id' => $request->reserve_clinic_payment_id,
            'reserve_clinic_has_file' => $request->reserve_clinic_has_file,
            'reserve_clinic_notice' => $request->reserve_clinic_notice,
            'status_id' => 1,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $history = DB::table('history_status')->insert([
            'reserve_id' => $reserve,
            'status_id' => 1,
            'type' => 2,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $request->clinic_id)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, trans('admin.new reservation'), trans('admin.you have new reservation'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', '/show_reserve_clinic/' . $reserve);
        
        $query = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $reserve)->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $query
        ];
        return response()->json($response);
    }

}

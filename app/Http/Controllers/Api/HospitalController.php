<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HospitalController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function allHospitals(Request $request) {
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
        
        if ($request->city_id) {
            $hospitals = DB::table('hospitals')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
                ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
                ->where('language_id', '=', $request->language_id)
                ->where('country_id', '=', $request->country_id)
                ->where('city_id', '=', $request->city_id)
                ->where('type', '=', 1)
                ->where('active', '=', 1)
                ->select('hospitals.hospital_id', 'image as hospital_image', 'hospital_name', 'hospital_description_part', 'language_id')
                ->get();
    
            foreach($hospitals as $hospital){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 1)
                    ->where('rates.type_id', '=', $hospital->hospital_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $hospital->rates=$rates;
                $array[]=$hospital;
            }
        } else {
            $hospitals = DB::table('hospitals')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
                ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
                ->where('language_id', '=', $request->language_id)
                ->where('type', '=', 1)
                ->where('active', '=', 1)
                ->select('hospitals.hospital_id', 'image as hospital_image', 'hospital_name', 'hospital_description_part', 'language_id')
                ->get();
    
            foreach($hospitals as $hospital){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 1)
                    ->where('rates.type_id', '=', $hospital->hospital_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $hospital->rates=$rates;
                $array[]=$hospital;
            }
        }
        
        if($hospitals){
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

    public function hospital(Request $request) {
        $validator = validator()->make($request->all(), [
            'hospital_id' => 'required',
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

        $hospitals = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
            ->where('hospitals.hospital_id', '=', $request->hospital_id)
            ->where('language_id', '=', $request->language_id)
            ->where('type', '=', 1)
            ->where('active', '=', 1)
            ->select('hospitals.hospital_id', 'image as hospital_image', 'phone as hospital_phone',
                'hospital_latitude', 'hospital_longitude', 'hospital_name',
                'hospital_description_part', 'hospital_description_full',
                'language_id')
            ->get();
            
        

        foreach($hospitals as $hospital){
            $rates = DB::table('rates')
                ->where('rates.type', '=', 1)
                ->where('rates.type_id', '=', $hospital->hospital_id)
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id', 'rate_star', 'rate_content', 'user_id', 'name', 'image')
                ->orderBy('rate_id', 'desc')
                ->limit(3)
                ->get();
            $count = DB::table('rates')
                ->where('rates.type', '=', 1)
                ->where('rates.type_id', '=', $hospital->hospital_id)
                ->select('rate_id', 'rate_star', 'rate_content', 'user_id')
                ->count();
            $hospital->rates=$rates;
            $hospital->count=$count;
            $images = DB::table('images')->where('type', '=', 1)->where('type_id', '=', $hospital->hospital_id)->get();
            $hospital->images = $images;
            $array[]=$hospital;
        }

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $array
        ];

        return response()->json($response);
    }

    public function hospital_clinic(Request $request) {
        $validator = validator()->make($request->all(), [
            'hospital_id' => 'required',
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

        $hospitals = DB::table('hospital_clinic')
            ->join('clinics', 'clinics.clinic_id', '=', 'hospital_clinic.clinic_id')
            ->where('hospital_clinic.hospital_id', '=', $request->hospital_id)
            ->where('active', '=' , 1)
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->where('clinic_description.language_id', '=', $request->language_id)
            ->select('hospital_clinic_id', 'hospital_clinic.hospital_id',
                'hospital_clinic.clinic_id', 'clinics.clinic_id', 'clinic_description.clinic_name')
            ->get();

        $response = [
            'status' => 1,
            'message' => 'successful',
            'data' => $hospitals
        ];

        return response()->json($response);
    }

    public function clinic_doctor(Request $request) {
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

        $hospitals = DB::table('clinic_doctor')
            ->join('doctors', 'doctors.doctor_id', '=', 'clinic_doctor.doctor_id')
            ->where('clinic_doctor.clinic_id', '=', $request->clinic_id)
            ->where('active', '=' , 1)
            ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'doctors.doctor_id')
            ->where('doctor_detail.language_id', '=', $request->language_id)
            ->select('clinic_doctor_id', 'clinic_doctor.clinic_id',
                'clinic_doctor.doctor_id', 'doctor_detail.doctor_detail_name', 'doctor_price')
            ->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $hospitals
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
        
        date_default_timezone_set('Asia/Riyadh');
        $dateTime = date('H'); // "17"
        $dateDay = date('Y-m-d');
        // dd($dateDay == $request->day);
        // dd((int)$dateTime);
        for($i = $start; $i <= $end; $i++){
            // echo $i.'<br>';
            // if((int)$dateTime < $i && strtotime($dateDay) == strtotime($request->day)) {
            //     echo 'done';
            // }else{
            //     echo 'no';
            // }
            // if((int)$dateTime < $i && $dateDay == $request->day) {
                $hours = DB::table('reserve_hospital')
                    ->where('doctor_id', '=', $request->doctor_id)
                    ->where('reserve_hospital_day', '=', $request->day)
                    ->where('reserve_hospital_hour', '=', $i)
                    ->count();
                if($hours == 0){
                    if((int)$dateTime < $i && strtotime($dateDay) == strtotime($request->day)) {
                        $dates[] = $i . ":00";
                    } elseif(strtotime($dateDay) != strtotime($request->day)){
                        $dates[] = $i . ":00";
                    }
                    // $dates[] = $i . ":00";
                }
            // }
        }
        // $array = array();
        // foreach($dates as $date){
        //     dd((int)$dateTime);
        //     if((int)$dateTime < $date && $dateDay == $request->day) {
        //         $array[] = $date . ":00";
        //     } else {
        //         $array[] = $date . ":00";
        //     }
        // }
        
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

    public function reserveHospital(Request $request) {
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
            'hospital_id' => 'required',
            'clinic_id' => 'required',
            'doctor_id' => 'required',
            'reserve_hospital_day' => 'required',
            'reserve_hospital_hour' => 'required',
            'reserve_hospital_is_insurance' => 'required',
            'reserve_hospital_payment_id' => 'required',
            'reserve_hospital_has_file' => 'required',
            'reserve_hospital_notice' => 'nullable'
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
        $hospital = DB::table('hospital_description')->where('hospital_id', '=', $request->hospital_id)->where('language_id', '=', $request->language_id)->select('hospital_name')->first();
        $hospital_admin = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $request->hospital_id)->select('email', 'phone')->first();
        $clinic = DB::table('clinic_description')->where('clinic_id', '=', $request->clinic_id)->where('language_id', '=', $request->language_id)->select('clinic_name')->first();
        $doctor_price = DB::table('doctors')->where('doctor_id', '=', $request->doctor_id)->select('doctor_price')->first();
        $doctor = DB::table('doctor_detail')->where('doctor_id', '=', $request->doctor_id)->where('language_id', '=', $request->language_id)->select('doctor_detail_name', 'doctor_detail_specialization')->first();

        $reserve = DB::table('reserve_hospital')->insertGetId([
            'user_id' => $request->user_id,
            'user_name' => $user->name,
            'user_email' => $user->email,
            'user_phone' => $user->phone,
            'user_phone_code' => $user->phone_code, 
            'hospital_id' => $request->hospital_id,
            'hospital_name' => $hospital->hospital_name,
            'hospital_email' => $hospital_admin->email,
            'hospital_phone' => $hospital_admin->phone,
            'clinic_id' => $request->clinic_id,
            'clinic_name' => $clinic->clinic_name,
            'doctor_id' => $request->doctor_id,
            'doctor_name' => $doctor->doctor_detail_name,
            'doctor_specialization' => $doctor->doctor_detail_specialization,
            'doctor_price' => $doctor_price->doctor_price,
            'reserve_hospital_day' => $request->reserve_hospital_day,
            'reserve_hospital_hour' => $request->reserve_hospital_hour,
            'reserve_hospital_is_insurance' => $request->reserve_hospital_is_insurance,
            'reserve_hospital_payment_id' => $request->reserve_hospital_payment_id,
            'reserve_hospital_has_file' => $request->reserve_hospital_has_file,
            'reserve_hospital_notice' => $request->reserve_hospital_notice,
            'status_id' => 1,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $history = DB::table('history_status')->insert([
            'reserve_id' => $reserve,
            'status_id' => 1,
            'type' => 1,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $request->hospital_id)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, trans('admin.new reservation'), trans('admin.you have new reservation'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', '/show_reserve_hospital/'. $reserve);

        $query = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $reserve)->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $query
        ];
        return response()->json($response);
    }

}

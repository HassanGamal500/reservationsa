<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AppController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function advertisements(Request $request) {
        $validator = validator()->make($request->all(), [
            'language_id' => 'required',
            'user_id' => 'required',
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $ad = DB::table('advertisements')
            ->join('advertisement_description', 'advertisement_description.advertisement_id', '=', 'advertisements.advertisement_id')
            // ->join('user_interest', 'user_interest.interest_id', '=', 'advertisements.interest_id')
            // ->where('user_id', '=', $request->user_id)
            ->select('advertisements.advertisement_id', 'advertisement_image', 'advertisement_description_name', 'type', 'type_id', 'advertisements.interest_id')
            ->orderBy('advertisements.advertisement_id', 'DESC')
            ->where('language_id', '=', $request->language_id)
            ->get();

        if($ad) {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $ad
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
        }
        
        //$CustomersPush = new CustomersPush();
        //echo $CustomersPush->send('hi','hi test message',array('fxFTMb-sJcc:APA91bHI_ELsShUsGD8YQoSyallVSGNA7hECxcO98ezyhhP1Yd8RwmHuNrr9yF5jtFgxQe5Mgf_-49S4NFaqq2mC7N6L_FFql1QAFrv8f-2UIit0zxgeIoG8G4sqL0Vd9N9ik-I-mh00'),'','1');

        return response()->json($response);
    }

    public function histories(Request $request) {
        $array= array();
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $checkOneReserves = DB::table('reserve_hospital')->where('user_id', '=', $request->user_id)->select('hospital_id')->get();
        $checkTwoReserves = DB::table('reserve_clinic')->where('user_id', '=', $request->user_id)->select('clinic_id')->get();
        $checkThreeReserves = DB::table('reserve_restaurant')->where('user_id', '=', $request->user_id)->select('restaurant_id')->get();
        $checkFourReserves = DB::table('reserve_catering')->where('user_id', '=', $request->user_id)->select('catering_id')->get();
        
        // dd($checkOneReserves->count());
        
        
        if($checkOneReserves->count() > 0) {
            foreach($checkOneReserves as $check){
                $checkHospital = DB::table('hospitals')->where('hospital_id', '=', $check->hospital_id)->count();
                if($checkHospital > 0) {
                    $reserveHospitals = DB::table('reserve_hospital')
                        ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                        ->where('user_id', '=', $request->user_id)
                        ->where('language_id', '=', $request->language_id)
                        ->select('reserve_hospital_id', 'reserve_hospital_notice', 'status_id', 'hospital_description.hospital_id', 'hospital_description.hospital_name', 'reserve_hospital.created_at')
                        ->get();
                } else {
                    $reserveHospitals = DB::table('reserve_hospital')
                        ->where('user_id', '=', $request->user_id)
                        ->select('reserve_hospital_id', 'reserve_hospital_notice', 'status_id', 'reserve_hospital.hospital_id', 'reserve_hospital.hospital_name', 'reserve_hospital.created_at')
                        ->get();
                }
            }
            
            foreach ($reserveHospitals as $hospital){
                $hospital->type = 1;
                $rate = DB::table('rates')
                    ->where('type', '=', 1)
                    ->where('type_id', '=', $hospital->hospital_id)
                    ->where('user_id', '=', $request->user_id)
                    ->where('reserve_id', '=', $hospital->reserve_hospital_id)
                    ->count();
                if ($rate > 0){
                    $hospital->isRate = 1;
                } else {
                    $hospital->isRate = 0;
                }
                $array[strtotime($hospital->created_at)] = $hospital;
            }
        }
        
        if($checkTwoReserves->count() > 0) {
            foreach($checkTwoReserves as $check){
                $checkClinic = DB::table('clinics')->where('clinic_id', '=', $check->clinic_id)->count();
                if($checkClinic > 0) {
                    $reserveClinics = DB::table('reserve_clinic')
                        ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                        ->where('user_id', '=', $request->user_id)
                        ->where('language_id', '=', $request->language_id)
                        ->select('reserve_clinic_id', 'reserve_clinic_notice', 'status_id', 'clinic_description.clinic_id', 'clinic_description.clinic_name', 'reserve_clinic.created_at')
                        ->get();
                } else {
                    $reserveClinics = DB::table('reserve_clinic')
                        ->where('user_id', '=', $request->user_id)
                        ->select('reserve_clinic_id', 'reserve_clinic_notice', 'status_id', 'reserve_clinic.clinic_id', 'reserve_clinic.clinic_name', 'reserve_clinic.created_at')
                        ->get();
                }
            }
            
            foreach ($reserveClinics as $clinic){
                $clinic->type = 2;
                $rate = DB::table('rates')
                    ->where('type', '=', 2)
                    ->where('type_id', '=', $clinic->clinic_id)
                    ->where('user_id', '=', $request->user_id)
                    ->where('reserve_id', '=', $clinic->reserve_clinic_id)
                    ->count();
                if ($rate > 0){
                    $clinic->isRate = 1;
                } else {
                    $clinic->isRate = 0;
                }
                $array[strtotime($clinic->created_at)] = $clinic;
            }
        }
            
        if($checkThreeReserves->count() > 0) {
            foreach($checkThreeReserves as $check) {
                $checkRestaurant = DB::table('restaurants')->where('restaurant_id', '=', $check->restaurant_id)->count();
                if($checkRestaurant > 0) {
                    $reserveRestaurants = DB::table('reserve_restaurant')
                        ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                        ->where('user_id', '=', $request->user_id)
                        ->where('language_id', '=', $request->language_id)
                        ->select('reserve_restaurant_id', 'reserve_restaurant_notice', 'status_id', 'restaurant_description.restaurant_id', 'restaurant_description.restaurant_name', 'reserve_restaurant.created_at')
                        ->get();
                } else {
                    $reserveRestaurants = DB::table('reserve_restaurant')
                        ->where('user_id', '=', $request->user_id)
                        ->select('reserve_restaurant_id', 'reserve_restaurant_notice', 'status_id', 'reserve_restaurant.restaurant_id', 'reserve_restaurant.restaurant_name', 'reserve_restaurant.created_at')
                        ->get();
                }
            }
            
            foreach ($reserveRestaurants as $restaurant){
                $restaurant->type = 3;
                $rate = DB::table('rates')
                    ->where('type', '=', 3)
                    ->where('type_id', '=', $restaurant->restaurant_id)
                    ->where('user_id', '=', $request->user_id)
                    ->where('reserve_id', '=', $restaurant->reserve_restaurant_id)
                    ->count();
                if ($rate > 0){
                    $restaurant->isRate = 1;
                } else {
                    $restaurant->isRate = 0;
                }
                $array[strtotime($restaurant->created_at)] = $restaurant;
            }
        }
        
        if($checkFourReserves->count() > 0) {
            foreach($checkFourReserves as $check) {
                $checkCatering = DB::table('catering')->where('catering_id', '=', $check->catering_id)->count();
                if($checkCatering > 0){
                    $reserveCaterings = DB::table('reserve_catering')
                        ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                        ->where('user_id', '=', $request->user_id)
                        ->where('language_id', '=', $request->language_id)
                        ->select('reserve_catering_id', 'reserve_catering_notice', 'status_id', 'catering_description.catering_id', 'catering_description.catering_name', 'reserve_catering.created_at')
                        ->get();
                } else {
                    $reserveCaterings = DB::table('reserve_catering')
                        ->where('user_id', '=', $request->user_id)
                        ->select('reserve_catering_id', 'reserve_catering_notice', 'status_id', 'reserve_catering.catering_id', 'reserve_catering.catering_name', 'reserve_catering.created_at')
                        ->get();
                }
            }
            
            foreach ($reserveCaterings as $catering){
                $catering->type = 4;
                $rate = DB::table('rates')
                    ->where('type', '=', 4)
                    ->where('type_id', '=', $catering->catering_id)
                    ->where('user_id', '=', $request->user_id)
                    ->where('reserve_id', '=', $catering->reserve_catering_id)
                    ->count();
                if ($rate > 0){
                    $catering->isRate = 1;
                } else {
                    $catering->isRate = 0;
                }
                $array[strtotime($catering->created_at)] = $catering;
            }
        }
        
            
        
        krsort($array);
        foreach($array as $value){
            $allData[]=$value;
        }
        
        // dd($array);
        if (!empty($array)){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $allData
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
        }

        return response()->json($response);
    }

    public function notifications(Request $request){
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
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
        $notifications = DB::table('notifications')
            ->join('notification_description', 'notification_description.notification_id', '=', 'notifications.notification_id')
            ->where('user_id', '=', $request->user_id)
            ->where('language_id', '=', $request->language_id)
            ->orwhere('user_id', '=', 0)
            ->select('notification_description.notification_name','notification_description.notification_content', 'notification_image', 'is_seen', 'notifications.created_at')
            ->orderBy('notifications.notification_id', 'desc')
            ->get();
            
        $seen = DB::table('notifications')
            ->where('user_id', '=', $request->user_id)
            ->update(['is_seen' => 1]);

        if (!empty($notifications)){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $notifications
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
        }

        return response()->json($response);

    }

    public function images(Request $request){
        $validator = validator()->make($request->all(), [
            'type' => 'required',
            'type_id' => 'required'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $images = DB::table('images')
            ->where('type', '=', $request->type)
            ->where('type_id', '=', $request->type_id)
            ->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $images
        ];

        return response()->json($response);
    }

    public function interests(Request $request) {
        $validator = validator()->make($request->all(), [
            'language_id' => 'required',
            'user_id' => 'required'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $interests = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->where('interest_description.language_id', '=', $request->language_id)
            ->get();

        $user_interest = DB::table('interests')
            ->join('interest_description', 'interest_description.interest_id', '=', 'interests.interest_id')
            ->join('user_interest', 'user_interest.interest_id', '=', 'interests.interest_id')
            ->where('interest_description.language_id', '=', $request->language_id)
            ->where('user_interest.user_id', '=', $request->user_id)
            ->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => [
                'interests' => $interests,
                'user_interest' => $user_interest
                ]
        ];

        return response()->json($response);
    }

    public function add_interest(Request $request) {
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
            'interest' => 'required|array'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $delete = DB::table('user_interest')
            ->where('user_id', '=', $request->user_id)
            ->delete();

        if (!array_filter($request->interest) == []){
            foreach ($request->interest as $key => $value) {
                $add = DB::table('user_interest')
                    ->insert([
                        'interest_id' => $request->interest[$key],
                        'user_id' => $request->user_id
                    ]);
            }
        }

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => []
        ];

        return response()->json($response);
    }
    
    public function rates(Request $request) {
        $validator = validator()->make($request->all(), [
            'star' => 'required',
            'content' => 'required',
            'user_id' => 'required',
            'type' => 'required',
            'type_id' => 'required',
            'reserve_id' => 'required'
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $rate = DB::table('rates')
            ->insert([
                'rate_star' => $request->star,
                'rate_content' => $request->content,
                'user_id' => $request->user_id,
                'type' => $request->type,
                'type_id' => $request->type_id,
                'reserve_id' => $request->reserve_id
            ]);

        if($rate) {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $rate
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
        }

        return response()->json($response);
    }
    
    public function allRates(Request $request) {
        $validator = validator()->make($request->all(), [
            'type' => 'required',
            'type_id' => 'required',
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $rates = DB::table('rates')
            ->join('users', 'users.id', '=', 'rates.user_id')
            ->where('type', '=', $request->type)
            ->where('type_id', '=', $request->type_id)
            ->select('rate_star', 'rate_content', 'name', 'image')
            ->get();
            
        if($rates) {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $rates
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => []
            ];
        }

        return response()->json($response);
    }
    
    public function insurances(Request $request){
        $validator = validator()->make($request->all(), [
            'type' => 'required',
            'type_id' => 'required',
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
        
        $insurances = DB::table('insurances')
            ->join('insurance_description', 'insurance_description.insurance_id', '=', 'insurances.insurance_id')
            ->where('type', '=', $request->type)
            ->where('type_id', '=', $request->type_id)
            ->where('language_id', '=', $request->language_id)
            ->select('insurances.insurance_id', 'insurance_name', 'insurance_image', 'insurance_description_content as content')
            ->get();
            
        if($insurances){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $insurances
            ];
        } else {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $insurances
            ];
        }
        return response()->json($response);
    }
    
    public function reserveDetails(Request $request){
        $user_id            =   $request->user_id;
        $type               =   $request->type;
        $id                 =   $request->reserve_id;
        $language           =   $request->language_id;
        $reservation=array();
        if($type==1){
            $reservation = DB::table('reserve_hospital')
                // ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                // ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
                // ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_hospital.clinic_id')
                // ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'reserve_hospital.doctor_id')
                // ->join('doctors', 'doctors.doctor_id', '=', 'reserve_hospital.doctor_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_hospital.reserve_hospital_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                ->where([
                    ['reserve_hospital_id', '=', $id],
                    // ['hospital_description.language_id', '=', $language],
                    // ['clinic_description.language_id', '=', $language],
                    ['payment_description.language_id', '=', $language],
                    // ['doctor_detail.language_id', '=', $language],
                    ['status_description.language_id', '=', $language]
                ])
                ->select('reserve_hospital_id as id', 'reserve_hospital.hospital_name', 'reserve_hospital.clinic_name', 'payment_name as payment', 'doctor_name as doctor_detail_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_hospital_day as day', 'status_name',
                    'reserve_hospital_hour as hour', 'reserve_hospital_is_insurance as insurance', 'reserve_hospital_has_file as file',
                    'reserve_hospital_notice as notice', 'reserve_hospital.status_id', 'doctor_price as price')
                ->get();
            $reservation[0]->type = 1;
        }if($type==2){
            $reservation = DB::table('reserve_clinic')
                // ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                // ->join('users', 'users.id', '=', 'reserve_clinic.user_id')
                // ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'reserve_clinic.doctor_id')
                // ->join('doctors', 'doctors.doctor_id', '=', 'reserve_clinic.doctor_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_clinic.reserve_clinic_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
                ->where([
                    ['reserve_clinic_id', '=', $id],
                    // ['clinic_description.language_id', '=', $language],
                    ['payment_description.language_id', '=', $language],
                    // ['doctor_detail.language_id', '=', $language],
                    ['status_description.language_id', '=', $language]
                ])
                ->select('reserve_clinic_id as id', 'clinic_name', 'doctor_name as doctor_detail_name', 'status_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_clinic_day as day',
                    'reserve_clinic_time as hour', 'reserve_clinic_is_insurance as insurance',
                    'payment_name as payment', 'reserve_clinic_has_file as file', 'doctor_price as price',
                    'reserve_clinic_notice as notice', 'reserve_clinic.status_id')
                ->get();
            $reservation[0]->type = 2;
        }if($type==3){
            $reservation = DB::table('reserve_restaurant')
                // ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                // ->join('users', 'users.id', '=', 'reserve_restaurant.user_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
                ->where([
                    ['reserve_restaurant_id', '=', $id],
                    // ['restaurant_description.language_id', '=', $language],
                    ['status_description.language_id', '=', $language]
                ])
                ->select('reserve_restaurant_id as id', 'restaurant_name', 'user_name as name', 'user_phone as phone',
                    'user_email as email', 'reserve_restaurant_day as day', 'reserve_restaurant_time as hour', 'status_name',
                    'reserve_restaurant_num_person as numPerson', 'reserve_restaurant_notice as notice', 'reserve_restaurant.status_id')
                ->get();
            $reservation[0]->type = 3;
        }if($type==4){
            $reservation = DB::table('reserve_catering')
                // ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                // ->join('users', 'users.id', '=', 'reserve_catering.user_id')
                // ->join('price_plan_description','price_plan_description.price_plan_id', '=', 'reserve_catering.price_plan_id')
                // ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_catering.reserve_catering_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
                ->where([
                    ['reserve_catering_id', '=', $id],
                    // ['catering_description.language_id', '=', $language],
                    // ['price_plan_description.language_id', '=', $language],
                //     ['payment_description.language_id', '=', $language],
                    ['status_description.language_id', '=', $language]
                ])
                ->select('reserve_catering_id as id', 'catering_name', 'price_plan_name as price_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'status_name',
                    'reserve_catering_day as day', 'reserve_catering_time as hour', /*'payment_name as payment',*/
                    'reserve_catering_num_of_person as numPerson', 'reserve_catering_notice as notice', 'reserve_latitude as latitude', 'reserve_longitude as longitude',
                    'reserve_catering_sub_price as subPrice', 'reserve_catering_coupon_code as coupon_code',
                    'reserve_catering_coupon_discount as discount', 'reserve_catering_final_price as finalPrice', 'reserve_catering.status_id')
                ->get();
            $reservation[0]->type = 4;
        }
        
        $responseData = array('status'=>1, 'data'=>$reservation, 'message'=>trans('admin.success'));
    	$userResponse = json_encode($responseData);	
    	return $responseData;
    }
    
    public function cancelOrder(Request $request) {
        $validator = validator()->make($request->all(), [
            'order_id' => 'required',
            'user_id' => 'required',
            'type' => 'required',
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
        
        if($request->type == 1) {
            $findOrder = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $request->order_id)->whereIn('status_id', [1, 2])->count();
            if($findOrder > 0){
                $cancel = DB::table('reserve_hospital')
                    ->where('reserve_hospital_id', '=', $request->order_id)
                    ->where('user_id', '=', $request->user_id)
                    ->update(['status_id' => 3]);
                
                $history = DB::table('history_status')
                    ->insert([
                        'reserve_id' => $request->order_id,
                        'type' => $request->type,
                        'status_id' => 3,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                $getId = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $request->order_id)->where('user_id', '=', $request->user_id)->select('hospital_id')->first();
                $sendNotification = new AdminsPush();
                $getTokens = DB::table('administration')->where('type', '=', 1)->where('type_id', '=', $getId->hospital_id)->select('token')->get();
                foreach($getTokens as $token){
                    $tokens[] = $token->token;
                }
                $sendNotification->send($tokens, trans('admin.reservation canceled'), trans('admin.the reservation is  canceled'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'reserve_hospital_admin', '3');
            } else {
                $cancel = 0;
            }
        } elseif($request->type == 2) {
            $findOrder = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $request->order_id)->whereIn('status_id', [1, 2])->count();
            if($findOrder > 0){
                $cancel = DB::table('reserve_clinic')
                    ->where('reserve_clinic_id', '=', $request->order_id)
                    ->where('user_id', '=', $request->user_id)
                    ->update(['status_id' => 3]);
                
                $history = DB::table('history_status')
                    ->insert([
                        'reserve_id' => $request->order_id,
                        'type' => $request->type,
                        'status_id' => 3,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                $getId = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $request->order_id)->where('user_id', '=', $request->user_id)->select('clinic_id')->first();
                $sendNotification = new AdminsPush();
                $getTokens = DB::table('administration')->where('type', '=', 2)->where('type_id', '=', $getId->clinic_id)->select('token')->get();
                foreach($getTokens as $token){
                    $tokens[] = $token->token;
                }
                $sendNotification->send($tokens, trans('admin.reservation canceled'), trans('admin.the reservation is  canceled'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'reserve_clinic_admin', '3');
            } else {
                $cancel = 0;
            }
        } elseif($request->type == 3) {
            $findOrder = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $request->order_id)->whereIn('status_id', [1, 2])->count();
            if($findOrder > 0){
                $cancel = DB::table('reserve_restaurant')
                    ->where('reserve_restaurant_id', '=', $request->order_id)
                    ->where('user_id', '=', $request->user_id)
                    ->update(['status_id' => 3]);
                
                $history = DB::table('history_status')
                    ->insert([
                        'reserve_id' => $request->order_id,
                        'type' => $request->type,
                        'status_id' => 3,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                $getId = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $request->order_id)->where('user_id', '=', $request->user_id)->select('restaurant_id')->first();
                $sendNotification = new AdminsPush();
                $getTokens = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $getId->restaurant_id)->select('token')->get();
                foreach($getTokens as $token){
                    $tokens[] = $token->token;
                }
                $sendNotification->send($tokens, trans('admin.reservation canceled'), trans('admin.the reservation is  canceled'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'reserve_restaurant_admin', '3');
            } else {
                $cancel = 0;
            }
        } else {
            $findOrder = DB::table('reserve_catering')->where('reserve_catering_id', '=', $request->order_id)->whereIn('status_id', [1, 2])->count();
            if($findOrder > 0){
                $cancel = DB::table('reserve_catering')
                    ->where('reserve_catering_id', '=', $request->order_id)
                    ->where('user_id', '=', $request->user_id)
                    ->update(['status_id' => 3]);
                
                $history = DB::table('history_status')
                    ->insert([
                        'reserve_id' => $request->order_id,
                        'type' => $request->type,
                        'status_id' => 3,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                $getId = DB::table('reserve_catering')->where('reserve_catering_id', '=', $request->order_id)->where('user_id', '=', $request->user_id)->select('catering_id')->first();
                $sendNotification = new AdminsPush();
                $getTokens = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $getId->catering_id)->select('token')->get();
                foreach($getTokens as $token){
                    $tokens[] = $token->token;
                }
                $sendNotification->send($tokens, trans('admin.reservation canceled'), trans('admin.the reservation is  canceled'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'reserve_catering_admin', '3');
            } else {
                $cancel = 0;
            }
        }
            
        if($cancel){
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $cancel
            ];
        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.failed'),
                'data' => []
            ];
        }
        return response()->json($response);
    }

}

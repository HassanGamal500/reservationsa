<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CateringController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function allCatering(Request $request) {
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
            $caterings = DB::table('catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
                ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
                ->where('language_id', '=', $request->language_id)
                ->where('country_id', '=', $request->country_id)
                ->where('city_id', '=', $request->city_id)
                ->where('type', '=', 4)
                ->where('active', '=', 1)
                ->select('catering.catering_id', 'catering_name', 'image as catering_image', 'catering_description_part', 'language_id')
                ->get();
    
            foreach($caterings as $catering) {
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 4)
                    ->where('rates.type_id', '=', $catering->catering_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $catering->rates = $rates;
                $array[] = $catering;
            }
        } else {
            $caterings = DB::table('catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
                ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
                ->where('language_id', '=', $request->language_id)
                ->where('type', '=', 4)
                ->where('active', '=', 1)
                ->select('catering.catering_id', 'catering_name', 'image as catering_image', 'catering_description_part', 'language_id')
                ->get();
    
            foreach($caterings as $catering) {
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 4)
                    ->where('rates.type_id', '=', $catering->catering_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $catering->rates = $rates;
                $array[] = $catering;
            }
        }

        if($caterings){
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

    public function allPackages(Request $request) {
        $validator = validator()->make($request->all(), [
            'language_id' => 'required',
            'catering_id' => 'required'
        ]);

        if ($validator->fails()){

            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);

        }

        $packages = DB::table('price_plan')
            ->join('price_plan_description', 'price_plan_description.price_plan_id', '=', 'price_plan.price_plan_id')
            ->where('language_id', '=', $request->language_id)
            ->where('catering_id', '=', $request->catering_id)
            ->select('price_plan.price_plan_id', 'price_plan_description_name',
                'price_plan_description_part', 'price_plan.price', 'language_id', 'catering_id')
            ->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $packages
        ];

        return response()->json($response);
    }

    public function catering(Request $request) {
        $validator = validator()->make($request->all(), [
            'language_id' => 'required',
            'catering_id' => 'required',
            'price_plan_id' => 'required'
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

        $caterings = DB::table('catering')
            ->leftJoin('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->leftJoin('administration', 'administration.type_id', '=', 'catering.catering_id')
            ->leftJoin('price_plan', 'price_plan.catering_id', '=', 'catering.catering_id')
            ->where('catering.catering_id', '=', $request->catering_id)
            ->where('price_plan.price_plan_id', '=', $request->price_plan_id)
            ->where('language_id', '=', $request->language_id)
            ->where('type', '=', 4)
            ->where('catering.active', '=', 1)
            ->where('price_plan.active', '=', 1)
            ->select('catering.catering_id', 'phone as catering_phone', 'catering_latitude', 'catering_longitude', 'catering_description_full', 'language_id', 'price')
            ->get();

        foreach($caterings as $catering){
            $rates = DB::table('rates')
                ->where('rates.type', '=', 4)
                ->where('rates.type_id', '=', $catering->catering_id)
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id', 'rate_star', 'rate_content', 'user_id', 'name', 'image')
                ->orderBy('rate_id', 'desc')
                ->limit(3)
                ->get();
            
            $count = DB::table('rates')
                ->where('rates.type', '=', 4)
                ->where('rates.type_id', '=', $catering->catering_id)
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->count();
                
            $catering->rates = $rates;
            
            $catering->count = $count;
            
            $images = DB::table('images')->where('type', '=', 4)->where('type_id', '=', $catering->catering_id)->get();
            
            $catering->images = $images;
            
            $array[]=$catering;
        }

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $array
        ];

        return response()->json($response);
    }

    public function coupon(Request $request) {

        $validator = validator()->make($request->all(), [
            'coupon_code' => 'required',
        ]);

        if ($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }

        $discount = DB::table('coupons')
            ->where('coupon_name', '=', $request->coupon_code)
            ->select('coupon_id', 'coupon_name', 'coupon_discount')
            ->first();

        if ($discount) {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $discount
            ];
            return response()->json($response);
        } else {
            $response = [
                'status' => 0,
                'message' => trans('admin.coupon code is invalid'),
                'data' => []
            ];
            return response()->json($response);
        }

    }

    public function reserveCatering(Request $request) {
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
            'catering_id' => 'required',
            'price_plan_id' => 'required',
            'reserve_catering_day' => 'required',
            'reserve_catering_time' => 'required',
            'reserve_catering_num_of_person' => 'required',
            'reserve_catering_notice' => 'nullable',
            'reserve_catering_sub_price' => 'required',
            'reserve_latitude' => 'required',
            'reserve_longitude' => 'required'
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
        $catering = DB::table('catering_description')->where('catering_id', '=', $request->catering_id)->where('language_id', '=', $request->language_id)->select('catering_name')->first();
        $catering_admin = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $request->catering_id)->select('email', 'phone')->first();
        $price_plan = DB::table('price_plan_description')->where('price_plan_id', '=', $request->price_plan_id)->where('language_id', '=', $request->language_id)->select('price_plan_description_name')->first();
        $price = DB::table('price_plan')->where('price_plan_id', '=', $request->price_plan_id)->where('catering_id', '=', $request->catering_id)->select('price')->first();

        $reserve = DB::table('reserve_catering')->insertGetId([
            'user_id' => $request->user_id,
            'user_name' => $user->name,
            'user_email' => $user->email,
            'user_phone' => $user->phone,
            'user_phone_code' => $user->phone_code, 
            'catering_id' => $request->catering_id,
            'catering_name' => $catering->catering_name,
            'catering_email' => $catering_admin->email,
            'catering_phone' => $catering_admin->phone,
            'price_plan_id' => $request->price_plan_id,
            'price_plan_name' => $price_plan->price_plan_description_name,
            'price_plane_price' => $price->price,
            'reserve_catering_day' => $request->reserve_catering_day,
            'reserve_catering_time' => $request->reserve_catering_time,
            'reserve_catering_num_of_person' => $request->reserve_catering_num_of_person,
            'reserve_catering_notice' => $request->reserve_catering_notice,
            'reserve_catering_sub_price' => $request->reserve_catering_sub_price,
            'reserve_latitude' => $request->reserve_latitude,
            'reserve_longitude' => $request->reserve_longitude,
            'status_id' => 1,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $history = DB::table('history_status')->insert([
            'reserve_id' => $reserve,
            'status_id' => 1,
            'type' => 4,
            'created_at' => get_local_time($request->getClientIp())
        ]);

        if ($request->reserve_catering_coupon_code){
            $reserveID = DB::table('reserve_catering')
                ->where('reserve_catering_id', '=', $reserve)
                ->update([
                    'reserve_catering_coupon_code' => $request->reserve_catering_coupon_code,
                    'reserve_catering_coupon_discount' => $request->reserve_catering_coupon_discount,
                    'reserve_catering_final_price' => $request->reserve_catering_final_price,
                ]);
        }
        
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 4)->where('type_id', '=', $request->catering_id)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, trans('admin.new reservation'), trans('admin.you have new reservation'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', '/show_reserve_catering/' . $reserve);

        $query = DB::table('reserve_catering')->where('reserve_catering_id', '=', $reserve)->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $query
        ];
        return response()->json($response);
    }

}

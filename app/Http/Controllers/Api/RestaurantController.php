<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RestaurantController extends Controller
{
    public function __construct(Request $request){
        languageApi($request->language_id);
    }
    
    public function allRestaurants(Request $request) {
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
            $restaurants = DB::table('restaurants')
                ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
                ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
                ->where('language_id', '=', $request->language_id)
                ->where('country_id', '=', $request->country_id)
                ->where('city_id', '=', $request->city_id)
                ->where('type', '=', 3)
                ->where('active', '=', 1)
                ->select('restaurants.restaurant_id', 'restaurant_name', 'image as restaurant_image', 'restaurant_description_part', 'language_id')
                ->get();
    
            foreach($restaurants as $restaurant){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 3)
                    ->where('rates.type_id', '=', $restaurant->restaurant_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $restaurant->rates=$rates;
                $array[]=$restaurant;
            }
        } else {
            $restaurants = DB::table('restaurants')
                ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
                ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
                ->where('language_id', '=', $request->language_id)
                ->where('type', '=', 3)
                ->where('active', '=', 1)
                ->select('restaurants.restaurant_id', 'restaurant_name', 'image as restaurant_image', 'restaurant_description_part', 'language_id')
                ->get();
    
            foreach($restaurants as $restaurant){
                $rates = DB::table('rates')
                    ->where('rates.type', '=', 3)
                    ->where('rates.type_id', '=', $restaurant->restaurant_id)
                    ->select('rate_star')
                    ->avg('rate_star');
                $restaurant->rates=$rates;
                $array[]=$restaurant;
            }
        }

        if($restaurants){
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

    public function restaurant(Request $request) {
        $validator = validator()->make($request->all(), [
            'restaurant_id' => 'required',
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

        $restaurants = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
            ->where('restaurants.restaurant_id', '=', $request->restaurant_id)
            ->where('language_id', '=', $request->language_id)
            ->where('type', '=', 3)
            ->where('active', '=', 1)
            ->select('restaurants.restaurant_id', 'image as restaurant_image', 'phone as restaurant_phone',
                'restaurant_latitude', 'restaurant_longitude','restaurant_name',
                'restaurant_description_part', 'restaurant_description_full',
                'language_id')
            ->get();

        foreach($restaurants as $restaurant){
            $rates = DB::table('rates')
                ->where('rates.type', '=', 3)
                ->where('rates.type_id', '=', $restaurant->restaurant_id)
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id', 'rate_star', 'rate_content', 'user_id', 'name', 'image')
                ->orderBy('rate_id', 'desc')
                ->limit(3)
                ->get();
            $count = DB::table('rates')
            ->where('rates.type', '=', 3)
            ->where('rates.type_id', '=', $restaurant->restaurant_id)
            ->join('users', 'users.id', '=', 'rates.user_id')
            ->count();
            $restaurant->rates=$rates;
            $restaurant->count=$count;
            $images = DB::table('images')->where('type', '=', 3)->where('type_id', '=', $restaurant->restaurant_id)->get();
            $restaurant->images = $images;
            $array[]=$restaurant;
        }

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $array
        ];

        return response()->json($response);
    }

    public function reserveRestaurant(Request $request) {
        $validator = validator()->make($request->all(), [
            'user_id' => 'required',
            'restaurant_id' => 'required',
            'reserve_restaurant_day' => 'required',
            'reserve_restaurant_time' => 'required',
            'reserve_restaurant_num_person' => 'required',
            'reserve_restaurant_notice' => 'nullable'
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
        $restaurant = DB::table('restaurant_description')->where('restaurant_id', '=', $request->restaurant_id)->where('language_id', '=', $request->language_id)->select('restaurant_name')->first();
        $restaurant_admin = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $request->restaurant_id)->select('email', 'phone')->first();

        $reserve = DB::table('reserve_restaurant')->insertGetId([
            'user_id' => $request->user_id,
            'user_name' => $user->name,
            'user_email' => $user->email,
            'user_phone' => $user->phone,
            'user_phone_code' => $user->phone_code, 
            'restaurant_id' => $request->restaurant_id,
            'restaurant_name' => $restaurant->restaurant_name,
            'restaurant_email' => $restaurant_admin->email,
            'restaurant_phone' => $restaurant_admin->phone,
            'reserve_restaurant_day' => $request->reserve_restaurant_day,
            'reserve_restaurant_time' => $request->reserve_restaurant_time,
            'reserve_restaurant_num_person' => $request->reserve_restaurant_num_person,
            'reserve_restaurant_notice' => $request->reserve_restaurant_notice,
            'status_id' => 1,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $history = DB::table('history_status')->insert([
            'reserve_id' => $reserve,
            'status_id' => 1,
            'type' => 3,
            'created_at' => get_local_time($request->getClientIp())
        ]);
        
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $request->restaurant_id)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, trans('admin.new reservation'), trans('admin.you have new reservation'), 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', '/show_reserve_restaurant/' . $reserve);
        
        $query = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $reserve)->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $query
        ];
        return response()->json($response);
    }

}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Model\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{
    public function languages() {
        $languages = Language::all();
        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $languages
        ];
        return response()->json($response);
    }
    
    public function setLangUser(Request $request) {
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
        
        $set = DB::table('users')->where('id', '=', $request->user_id)->update(['default_language' => $request->language_id]);
        
        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $set
        ];

        return response()->json($response);
    }

    public function page(Request $request) {
        $validator = validator()->make($request->all(), [
            'page_id' => 'required',
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
        $page = DB::table('pages')
            ->join('page_description', 'page_description.page_id', '=', 'pages.page_id')
            ->select('pages.page_id', 'page_description_name', 'page_description_content', 'language_id')
            ->where('pages.page_id', '=', $request->page_id)
            ->where('language_id', '=', $request->language_id)
            ->get();

        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $page
        ];

        return response()->json($response);
    }
    
    public function getCity(Request $request){
        $validator = validator()->make($request->all(), [
            'country_id' => 'required',
        ]);
        
        if($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $cities = DB::table('cities')
            ->where('country_id', '=', $request->country_id)
            // ->join('city_description', 'city_description.city_id', '=', 'cities.city_id')
            ->where('is_active', '=', 1)
            ->select('city_id')
            ->get();
        
        foreach($cities as $city){
            $en = DB::table('city_description')->where('city_id', '=', $city->city_id)->where('language_id', '=', 1)->select('city_name')->get();
            $city->nameEN = $en[0]->city_name;
            $ar = DB::table('city_description')->where('city_id', '=', $city->city_id)->where('language_id', '=', 2)->select('city_name')->get();
            $city->nameAR = $ar[0]->city_name;
        }
            
        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $cities
        ];

        return response()->json($response);
    }
    
    // Insert Data JSON into Database
    
    public function city(){
        $json = file_get_contents(storage_path('data.json'));
        $objs = json_decode($json,true);
        foreach ($objs as $obj)  {
    		foreach ($obj as $key => $value) {
    			$data = DB::table('cities')->insertGetId([
    			        'population' => $value['population'],
    			        'location' => $value['location'],
    			        'country_id' => 1,
    			        'is_used' => 0,
    			        'is_active' => 0
    			    ]);
    	        for($i = 1; $i <= 2; $i++){
    	            if($i == 1){
    	                DB::table('city_description')->insert([
            			        'city_name' => $value['asciiname'],
            			        'city_id' => $data,
            			        'language_id' => 1
            			    ]);
    	            } else {
    	                DB::table('city_description')->insert([
            			        'city_name' => "",
            			        'city_id' => $data,
            			        'language_id' => 2
            			    ]);
    	            }
        	            
    	        }
        			
    		}
    	}
        return 'Done';
    }
    
    public function contactUs(Request $request){
        $validator = validator()->make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required|max:13',
            'message' => 'required'
        ]);
        
        if($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        $coupon = DB::table('contacts')
            ->insert([
                'contact_name' => $request->name,
                'contact_email' => $request->email,
                'contact_phone' => $request->phone,
                'contact_message' => $request->message,
            ]);
            
        $sendNotification = new AdminsPush();
        $getTokens = DB::table('administration')->where('type', '=', 5)->select('token')->get();
        foreach($getTokens as $token){
            $tokens[] = $token->token;
        }
        $sendNotification->send($tokens, 'Contact Message', 'You Have New Contact Message', 'images/user/ic_launcher.png', 'images/user/ic_launcher.png', 'contacts');
            
        if($coupon) {
            $response = [
                'status' => 1,
                'message' => trans('admin.success'),
                'data' => $coupon
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
    
    public function country_code(Request $request){
        $validator = validator()->make($request->all(), [
            'language_id' => 'required'
        ]);
        
        if($validator->fails()){
            $response = [
                'status' => 0,
                'message' => $validator->errors()->first(),
                'data' => []
            ];
            return response()->json($response);
        }
        
        if($request->language_id == 1) {
            $codes = DB::table('apps_countries')->select('country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        } else {
            $codes = DB::table('apps_countries')->select('country_a_name as country_name', 'country_code', 'phonecode', 'phone_num')->where('isActive', '=', 1)->orderBy('country_a_name', 'asc')->get();
            foreach($codes as $code){
                $lowercase = strtolower($code->country_code);
                $code->code_image = 'images/flags/'. $lowercase .'.png';
            }
        }
        
        $response = [
            'status' => 1,
            'message' => trans('admin.success'),
            'data' => $codes
        ];
        return response()->json($response);
        
    }
}

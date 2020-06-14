<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class RestaurantController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5 && auth()->guard('admin')->user()->type != 3){
                return redirect('/permission');
            }
            return $next($request);
        })->except('editAdmin', 'update');
    }
    
    public function index(){
        $restaurants = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
            ->select('restaurants.restaurant_id as id', 'restaurant_name as name', 'phone', 'active',
                'image', 'restaurant_latitude as latitude', 'restaurant_longitude as longitude',
                'restaurant_description_part as description_part', 'restaurant_description_full as description_full')
            ->where('language_id', '=', language())
            ->where('type', '=', 3)
            ->orderBy('restaurants.restaurant_id', 'desc')
            ->get();
            
        foreach($restaurants as $restaurant){
            $reservations = DB::table('reserve_restaurant')->where('restaurant_id', '=', $restaurant->id)->count();
            $restaurant->reservations = $reservations;
        }
        
        return view('superAdmin.restaurants.index', compact('restaurants'));
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
        return view('superAdmin.restaurants.create', compact('countries', 'cities'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'restaurant_name' => 'required|max:50',
            'restaurant_phone' => 'required|unique:administration,phone|max:13',
            'restaurant_image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'restaurant_description_part' => 'required|max:140',
            'restaurant_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'restaurant_latitude' => 'required',
            'restaurant_longitude' => 'required',
            'email' => 'required|unique:administration,email',
            'password' => 'required|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('restaurant_image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/restaurant', $request->file('restaurant_image'));
        } else {
            $imageName = 'images/restaurant/avatar_restaurant.png';
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->restaurant_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->restaurant_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_full[2])) {
            $restaurants = DB::table('restaurants')
                ->insertGetId([
                    'restaurant_latitude' => convert($request->restaurant_latitude),
                    'restaurant_longitude' => convert($request->restaurant_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
                
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('restaurant_description')
                    ->insert([
                        'restaurant_name' => $request->restaurant_name[$i],
                        'restaurant_description_part' => $request->restaurant_description_part[$i],
                        'restaurant_description_full' => $request->restaurant_description_full[$i],
                        'language_id' => $i,
                        'restaurant_id' => $restaurants
                    ]);
            }
            
            $admin = DB::table('administration')
                ->insert([
                    'phone' => convert($request->restaurant_phone),
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                    'image' => $imageName,
                    'type' => 3,
                    'type_id' => $restaurants
                ]);
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->restaurant_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->restaurant_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_full[1])) {
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
        $restaurants = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
            ->select('restaurants.restaurant_id as id', 'image', 'phone', 'active', 'country_id',
                'restaurant_latitude as latitude', 'restaurant_longitude as longitude', 'city_id',
                'restaurant_name as name', 'restaurant_description_part as description_part',
                'restaurant_description_full as description_full')
            ->where('restaurants.restaurant_id', '=', $id)
            ->where('type', '=', 3)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $id)->select('email')->first();
        
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
            ->where('country_id', '=', $restaurants[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.restaurants.edit', compact('restaurants', 'user', 'countries', 'cities'));
    }
    
    public function editAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $restaurants = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
            ->select('restaurants.restaurant_id as id', 'image', 'phone', 'country_id',
                'restaurant_latitude as latitude', 'restaurant_longitude as longitude', 'city_id',
                'restaurant_name as name', 'restaurant_description_part as description_part',
                'restaurant_description_full as description_full')
            ->where('restaurants.restaurant_id', '=', $type_id)
            ->where('type', '=', 3)
            ->get();
            
        $user = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $type_id)->select('email')->first();
        
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
            ->where('country_id', '=', $restaurants[0]->country_id)
            ->select('cities.city_id as id', 'city_name as name')
            ->get();

        return view('superAdmin.restaurants.edit', compact('restaurants', 'user', 'countries', 'cities'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'restaurant_name' => 'required|max:50',
            'restaurant_phone' => 'required|max:13',
            'restaurant_image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'restaurant_description_part' => 'required|max:140',
            'restaurant_description_full' => 'required',
            'country_id' => 'required',
            'city_id' => 'required',
            'restaurant_latitude' => 'required',
            'restaurant_longitude' => 'required',
            'email' => 'required',
            'password' => 'nullable|min:8|regex:/^(?=.*?[a-z])(?=.*?[0-9])/'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[0-9.]+$/i", convert($request->restaurant_latitude)) 
        && preg_match("/^[0-9.]+$/i", convert($request->restaurant_longitude)) 
        && filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) 
        && preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_description_part[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->restaurant_description_full[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_part[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_full[2])) {
            $restaurants = DB::table('restaurants')
                ->where('restaurant_id', '=', $id)
                ->update([
                    'restaurant_latitude' => convert($request->restaurant_latitude),
                    'restaurant_longitude' => convert($request->restaurant_longitude),
                    'city_id' => $request->city_id,
                    'country_id' => $request->country_id
                ]);
                
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('restaurant_description')
                    ->where('restaurant_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'restaurant_name' => $request->restaurant_name[$i],
                        'restaurant_description_part' => $request->restaurant_description_part[$i],
                        'restaurant_description_full' => $request->restaurant_description_full[$i],
                    ]);
            }
            
            if ($request->restaurant_phone) {
                $phone = DB::table('administration')->where('phone', '=', $request->restaurant_phone)->where('type', '=', 3)->where('type_id', '!=', $id)->first();
                if($phone) {
                    $error = trans('admin.This phone has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 3)
                    ->where('type_id', '=', $id)
                    ->update(['phone' => convert($request->restaurant_phone)]);
                }
            }
            
            if ($request->email) {
                $email = DB::table('administration')->where('email', '=', $request->email)->where('type', '=', 3)->where('type_id', '!=', $id)->first();
                if($email) {
                    $error = trans('admin.This email has been taken before');
                    return Redirect::back()->with('error', $error);
                } else {
                    $user = DB::table('administration')
                    ->where('type', '=', 3)
                    ->where('type_id', '=', $id)
                    ->update(['email' => $request->email]);
                }
            }
            
            $getImage = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $id)->select('image')->first();
    
            if ($request->hasFile('restaurant_image')) {
                if($getImage->image != 'images/restaurant/avatar_restaurant.png'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/restaurant', $request->file('restaurant_image'));
                $user = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $user = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $id)->update(['image' => $imageName]);
            }
            
            if ($request->password) {
                $user = DB::table('administration')
                ->where('type', '=', 3)
                ->where('type_id', '=', $id)
                ->update(['password' => bcrypt($request->password)]);
            }
            
            if(auth()->guard('admin')->user()->type == 5) {
                if ($request->active == 1) {
                    $restaurants = DB::table('restaurants')
                        ->where('restaurant_id', '=', $id)
                        ->update(['active' => $request->active]);
                } else {
                    $restaurants = DB::table('restaurants')
                        ->where('restaurant_id', '=', $id)
                        ->update(['active' => $request->active]);
                }
            }
        } else {
            if(!preg_match("/^[0-9.]+$/i", convert($request->restaurant_latitude)) && !preg_match("/^[0-9.]+$/i", convert($request->restaurant_longitude))) {
                $error = trans('admin.latitude and longitude must contain only number and dot');
            } elseif(!filter_var(filter_var(strtolower($request->email), FILTER_SANITIZE_EMAIL), FILTER_VALIDATE_EMAIL) && !preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", strtolower($request->email))){
                $error = trans('admin.your email is not correct');
            } elseif(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_part[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->restaurant_description_full[1])) {
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
        $getImage = DB::table('administration')->where('type', '=', 3)->where('type_id', '=', $id)->select('image')->first();
        if($getImage->image != 'images/restaurant/avatar_restaurant.png'){
            $myFile = base_path($getImage->image);
            File::delete($myFile);
        }
        $restaurant = DB::table('restaurants')
            ->where('restaurant_id', '=', $id)
            ->delete();
        $admin = DB::table('administration')
            ->where('type', '=', 3)
            ->where('type_id', '=', $id)
            ->delete();
    }
}

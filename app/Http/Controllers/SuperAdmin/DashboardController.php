<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(){
        if (auth()->guard('admin')->user()->type == 5) {
            
            $users = DB::table('users')->count();
            $hospitals = DB::table('hospitals')->count();
            $clinics = DB::table('clinics')->where('city_id', '!=', null)->count();
            $doctors = DB::table('doctors')->count();
            $restaurants = DB::table('restaurants')->count();
            $caterings = DB::table('catering')->count();
            $ad = DB::table('advertisements')->count();
            $coupons = DB::table('coupons')->count();
            $interests = DB::table('interests')->count();
            $reserveHospitals = DB::table('reserve_hospital')->count();
            $reserveClinics = DB::table('reserve_clinic')->count();
            $reserveRestaurants = DB::table('reserve_restaurant')->count();
            $reserveCaterings = DB::table('reserve_catering')->count();
            $reservations = $reserveHospitals + $reserveClinics + $reserveRestaurants + $reserveCaterings;
            
            // Top Five Recordes ----------------------------
            
            $top_hospital = DB::table('reserve_hospital')
                    ->select(DB::raw('count(reserve_hospital.hospital_id) as hospital_count, reserve_hospital.hospital_id'))
                    ->join('hospitals', 'hospitals.hospital_id', '=', 'reserve_hospital.hospital_id')
                    // ->leftJoin('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                    ->groupBy('reserve_hospital.hospital_id')
                    ->orderBy('hospital_count', 'desc')
                    ->take(5)
                    ->get();
                    
            foreach($top_hospital as $top){
                $hospital = DB::table('hospitals')
                    ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
                    ->join('administration', 'administration.type_id', '=', 'hospitals.hospital_id')
                    ->where('hospitals.hospital_id', '=', $top->hospital_id)
                    ->where('language_id', '=', language())
                    ->where('type', '=', 1)
                    ->select('hospital_name','image')
                    ->first();
                $top->hospital_name = $hospital->hospital_name;
                $top->hospital_image = $hospital->image;
            }
            
            $top_clinic = DB::table('reserve_clinic')
                    ->select(DB::raw('count(reserve_clinic.clinic_id) as clinic_count, reserve_clinic.clinic_id'))
                    ->join('clinics', 'clinics.clinic_id', '=', 'reserve_clinic.clinic_id')
                    ->groupBy('reserve_clinic.clinic_id')
                    ->orderBy('clinic_count', 'desc')
                    ->take(5)
                    ->get();
                    
            foreach($top_clinic as $top){
                $clinic = DB::table('clinics')
                    ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                    ->join('administration', 'administration.type_id', '=', 'clinics.clinic_id')
                    ->where('clinics.clinic_id', '=', $top->clinic_id)
                    ->where('language_id', '=', language())
                    ->where('type', '=', 2)
                    ->select('clinic_name','image')
                    ->first();
                $top->clinic_name = $clinic->clinic_name;
                $top->clinic_image = $clinic->image;
            }
            
            $top_restaurant = DB::table('reserve_restaurant')
                    ->select(DB::raw('count(reserve_restaurant.restaurant_id) as restaurant_count, reserve_restaurant.restaurant_id'))
                    ->join('restaurants', 'restaurants.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                    ->groupBy('reserve_restaurant.restaurant_id')
                    ->orderBy('restaurant_count', 'desc')
                    ->take(5)
                    ->get();
                    
            foreach($top_restaurant as $top){
                $restaurant = DB::table('restaurants')
                    ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
                    ->join('administration', 'administration.type_id', '=', 'restaurants.restaurant_id')
                    ->where('restaurants.restaurant_id', '=', $top->restaurant_id)
                    ->where('language_id', '=', language())
                    ->where('type', '=', 3)
                    ->select('restaurant_name','image')
                    ->first();
                $top->restaurant_name = $restaurant->restaurant_name;
                $top->restaurant_image = $restaurant->image;
            }
            
            $top_catering = DB::table('reserve_catering')
                    ->select(DB::raw('count(reserve_catering.catering_id) as catering_count, reserve_catering.catering_id'))
                    ->join('catering', 'catering.catering_id', '=', 'reserve_catering.catering_id')
                    ->groupBy('reserve_catering.catering_id')
                    ->orderBy('catering_count', 'desc')
                    ->take(5)
                    ->get();
                    
            foreach($top_catering as $top){
                $catering = DB::table('catering')
                    ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
                    ->join('administration', 'administration.type_id', '=', 'catering.catering_id')
                    ->where('catering.catering_id', '=', $top->catering_id)
                    ->where('language_id', '=', language())
                    ->where('type', '=', 4)
                    ->select('catering_name','image')
                    ->first();
                $top->catering_name = $catering->catering_name;
                $top->catering_image = $catering->image;
            }
            // dd($top_hospital);
            
            // ------------------------------------------------------
            
            return view('superAdmin.dashboard')->with([
                'users' => $users,
                'hospitals' => $hospitals,
                'clinics' => $clinics,
                'doctors' => $doctors,
                'reservations' => $reservations,
                'restaurants' => $restaurants,
                'caterings' => $caterings,
                'ad' => $ad,
                'coupons' => $coupons,
                'interests' => $interests,
                'top_hospital' => $top_hospital,
                'top_clinic' => $top_clinic,
                'top_restaurant' => $top_restaurant,
                'top_catering' => $top_catering]);
                
        } elseif(auth()->guard('admin')->user()->type == 1) {
            
            $type = auth()->guard('admin')->user()->type;
            $type_id = auth()->guard('admin')->user()->type_id;
            
            $clinics = DB::table('clinics')
                ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinics.clinic_id')
                ->where('hospital_id', '=', $type_id)
                ->count();
            
            $doctors = DB::table('doctors')
                ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                ->join('hospital_clinic', 'hospital_clinic.clinic_id', '=', 'clinic_doctor.clinic_id')
                ->where('hospital_id', '=', $type_id)
                ->count();
                
            $reservations = DB::table('reserve_hospital')->where('hospital_id', '=', $type_id)->count();
            
            $rates = DB::table('rates')->where('type', '=', $type)->where('type_id', '=', $type_id)->count();
            
            return view('superAdmin.dashboard')->with([
                'clinics' => $clinics,
                'doctors' => $doctors,
                'reservations' => $reservations,
                'rates' => $rates
                ]);
                
        } elseif(auth()->guard('admin')->user()->type == 2) {
            
            $type = auth()->guard('admin')->user()->type;
            $type_id = auth()->guard('admin')->user()->type_id;
            
            $doctors = DB::table('doctors')
                ->join('clinic_doctor', 'clinic_doctor.doctor_id', '=', 'doctors.doctor_id')
                ->where('clinic_id', '=', $type_id)
                ->count();
                
            $reservations = DB::table('reserve_clinic')->where('clinic_id', '=', $type_id)->count();
            
            $rates = DB::table('rates')->where('type', '=', $type)->where('type_id', '=', $type_id)->count();
            
            return view('superAdmin.dashboard')->with([
                'doctors' => $doctors,
                'reservations' => $reservations,
                'rates' => $rates
                ]);
                
        } elseif(auth()->guard('admin')->user()->type == 3) {
            
            $type = auth()->guard('admin')->user()->type;
            $type_id = auth()->guard('admin')->user()->type_id;
                
            $reservations = DB::table('reserve_restaurant')->where('restaurant_id', '=', $type_id)->count();
            
            $rates = DB::table('rates')->where('type', '=', $type)->where('type_id', '=', $type_id)->count();
            
            return view('superAdmin.dashboard')->with([
                'reservations' => $reservations,
                'rates' => $rates
                ]);
            
        } elseif(auth()->guard('admin')->user()->type == 4) {
            
            $type = auth()->guard('admin')->user()->type;
            $type_id = auth()->guard('admin')->user()->type_id;
            
            $prices = DB::table('price_plan')->where('catering_id', '=', $type_id)->count();
                
            $reservations = DB::table('reserve_catering')->where('catering_id', '=', $type_id)->count();
            
            $rates = DB::table('rates')->where('type', '=', $type)->where('type_id', '=', $type_id)->count();
            
            return view('superAdmin.dashboard')->with([
                'prices' => $prices,
                'reservations' => $reservations,
                'rates' => $rates
                ]);
            
        }
    }
}

<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ReservationController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->only('hospital', 'clinic', 'restaurant', 'catering');
        
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 1 && auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->only('hospitalAdmin', 'showReserveHospital');
        
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 2 && auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->only('clinicAdmin', 'showReserveClinic');
        
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 3 && auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->only('restaurantAdmin', 'showReserveRestaurant');
        
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 4 && auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->only('cateringAdmin', 'showReserveCatering');
    }
    
    public function hospital($id){
        $reservations = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->join('reserve_hospital', 'reserve_hospital.hospital_id', '=', 'hospitals.hospital_id')
            // ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
            ->select('reserve_hospital_id as id', 'user_name as name', 'status_name', 'hospital_description.hospital_name',
                'reserve_hospital_day as day', 'reserve_hospital_hour as hour')
            ->where('hospitals.hospital_id', '=', $id)
            ->where('hospital_description.language_id', '=', language())
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_hospital_id', 'desc')
            ->get();
            
        $hospital = DB::table('hospitals')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
            ->select('hospital_name')
            ->where('hospital_description.language_id', '=', language())
            ->where('hospitals.hospital_id', '=', $id)
            ->first();

        return view('superAdmin.reservations.hospital', compact('reservations', 'hospital'));
    }
    
    public function hospitalAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $reservations = DB::table('hospitals')
            ->join('reserve_hospital', 'reserve_hospital.hospital_id', '=', 'hospitals.hospital_id')
            // ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
            ->select('reserve_hospital_id as id', 'user_name as name', 'status_name',
                'reserve_hospital_day as day', 'reserve_hospital_hour as hour')
            ->where('hospitals.hospital_id', '=', $type_id)
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_hospital_id', 'desc')
            ->get();
                
        return view('superAdmin.reservations.hospital', compact('reservations'));
    }

    public function clinic($id){
        $reservations = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->join('reserve_clinic', 'reserve_clinic.clinic_id', '=', 'clinics.clinic_id')
            // ->join('users', 'users.id', '=', 'reserve_clinic.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
            ->select('reserve_clinic_id as id', 'user_name as name', 'status_name', 'clinic_description.clinic_name',
                'reserve_clinic_day as day', 'reserve_clinic_time as hour')
            ->where('clinics.clinic_id', '=', $id)
            ->where('clinic_description.language_id', '=', language())
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_clinic_id', 'desc')
            ->get();
            
        $clinic = DB::table('clinics')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
            ->select('clinic_name')
            ->where('clinic_description.language_id', '=', language())
            ->where('clinics.clinic_id', '=', $id)
            ->first();

        return view('superAdmin.reservations.clinic', compact('reservations', 'clinic'));
    }
    
    public function clinicAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $reservations = DB::table('clinics')
            ->join('reserve_clinic', 'reserve_clinic.clinic_id', '=', 'clinics.clinic_id')
            // ->join('users', 'users.id', '=', 'reserve_clinic.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
            ->select('reserve_clinic_id as id', 'user_name as name', 'status_name',
                'reserve_clinic_day as day', 'reserve_clinic_time as hour')
            ->where('clinics.clinic_id', '=', $type_id)
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_clinic_id', 'desc')
            ->get();

        return view('superAdmin.reservations.clinic', compact('reservations'));
    }

    public function restaurant($id){
        $reservations = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->join('reserve_restaurant', 'reserve_restaurant.restaurant_id', '=', 'restaurants.restaurant_id')
            // ->join('users', 'users.id', '=', 'reserve_restaurant.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
            ->select('reserve_restaurant_id as id', 'user_name as name', 'status_name', 'restaurant_description.restaurant_name',
                'reserve_restaurant_day as day', 'reserve_restaurant_time as hour',
                'reserve_restaurant_num_person as num_person')
            ->where('restaurants.restaurant_id', '=', $id)
            ->where('restaurant_description.language_id', '=', language())
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_restaurant_id', 'desc')
            ->get();
            
        $restaurant = DB::table('restaurants')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
            ->select('restaurant_name')
            ->where('restaurant_description.language_id', '=', language())
            ->where('restaurants.restaurant_id', '=', $id)
            ->first();

        return view('superAdmin.reservations.restaurant', compact('reservations', 'restaurant'));
    }
    
    public function restaurantAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $reservations = DB::table('restaurants')
            ->join('reserve_restaurant', 'reserve_restaurant.restaurant_id', '=', 'restaurants.restaurant_id')
            // ->join('users', 'users.id', '=', 'reserve_restaurant.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
            ->select('reserve_restaurant_id as id', 'user_name as name', 'status_name',
                'reserve_restaurant_day as day', 'reserve_restaurant_time as hour',
                'reserve_restaurant_num_person as num_person')
            ->where('restaurants.restaurant_id', '=', $type_id)
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_restaurant_id', 'desc')
            ->get();

        return view('superAdmin.reservations.restaurant', compact('reservations'));
    }

    public function catering($id){
        $reservations = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->join('reserve_catering', 'reserve_catering.catering_id', '=', 'catering.catering_id')
            // ->join('users', 'users.id', '=', 'reserve_catering.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
            ->select('reserve_catering_id as id', 'user_name as name', 'status_name', 'catering_description.catering_name',
                'reserve_catering_day as day', 'reserve_catering_time as hour', 'reserve_catering_num_of_person as num_person')
            ->where('catering.catering_id', '=', $id)
            ->where('catering_description.language_id', '=', language())
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_catering_id', 'desc')
            ->get();
            
        $catering = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->select('catering_name')
            ->where('catering_description.language_id', '=', language())
            ->where('catering.catering_id', '=', $id)
            ->first();

        return view('superAdmin.reservations.catering', compact('reservations', 'catering'));
    }
    
    public function cateringAdmin(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $reservations = DB::table('catering')
            ->join('reserve_catering', 'reserve_catering.catering_id', '=', 'catering.catering_id')
            // ->join('users', 'users.id', '=', 'reserve_catering.user_id')
            ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
            ->select('reserve_catering_id as id', 'user_name as name', 'status_name',
                'reserve_catering_day as day', 'reserve_catering_time as hour',
                'reserve_catering_num_of_person as num_person')
            ->where('catering.catering_id', '=', $type_id)
            ->where('status_description.language_id', '=', language())
            ->orderBy('reserve_catering_id', 'desc')
            ->get();

        return view('superAdmin.reservations.catering', compact('reservations'));
    }

    public function showReserveHospital($id){
        $checkFromReserve = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $id)->select('user_id', 'hospital_id', 'clinic_id', 'doctor_id')->first();
        $checkUserFromUsers = DB::table('users')->where('id', '=', $checkFromReserve->user_id)->count();
        $checkHospital = DB::table('hospitals')->where('hospital_id', '=', $checkFromReserve->hospital_id)->count();
        $checkClinic = DB::table('clinics')->where('clinic_id', '=', $checkFromReserve->clinic_id)->count();
        $checkDoctor = DB::table('doctors')->where('doctor_id', '=', $checkFromReserve->doctor_id)->count();

        if($checkHospital > 0 && $checkClinic > 0 && $checkDoctor > 0) {
            $reservation = DB::table('reserve_hospital')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_hospital.clinic_id')
                ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'reserve_hospital.doctor_id')
                ->join('doctors', 'doctors.doctor_id', '=', 'reserve_hospital.doctor_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_hospital.reserve_hospital_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                ->where([
                    ['reserve_hospital_id', '=', $id],
                    ['hospital_description.language_id', '=', language()],
                    ['clinic_description.language_id', '=', language()],
                    ['payment_description.language_id', '=', language()],
                    ['doctor_detail.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_hospital_id as id', 'hospital_description.hospital_name', 'clinic_description.clinic_name', 'payment_name as payment', 'doctor_detail.doctor_detail_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_hospital_day as day', 'status_name',
                    'reserve_hospital_hour as hour', 'reserve_hospital_is_insurance as insurance', 'reserve_hospital_has_file as file',
                    'reserve_hospital_notice as notice', 'reserve_hospital.status_id', 'doctors.doctor_price as price', 'user_phone_code as phone_code')
                ->get();
        } elseif($checkHospital > 0 && $checkClinic > 0 && $checkDoctor == 0) { 
            $reservation = DB::table('reserve_hospital')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_hospital.clinic_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_hospital.reserve_hospital_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                ->where([
                    ['reserve_hospital_id', '=', $id],
                    ['hospital_description.language_id', '=', language()],
                    ['clinic_description.language_id', '=', language()],
                    ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_hospital_id as id', 'hospital_description.hospital_name', 'clinic_description.clinic_name', 'payment_name as payment', 'doctor_name as doctor_detail_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_hospital_day as day', 'status_name',
                    'reserve_hospital_hour as hour', 'reserve_hospital_is_insurance as insurance', 'reserve_hospital_has_file as file',
                    'reserve_hospital_notice as notice', 'reserve_hospital.status_id', 'doctor_price as price', 'user_phone_code as phone_code')
                ->get();
        } elseif($checkHospital > 0 && $checkClinic == 0 && $checkDoctor == 0) { 
            $reservation = DB::table('reserve_hospital')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                ->join('users', 'users.id', '=', 'reserve_hospital.user_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_hospital.reserve_hospital_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                ->where([
                    ['reserve_hospital_id', '=', $id],
                    ['hospital_description.language_id', '=', language()],
                    ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_hospital_id as id', 'hospital_description.hospital_name', 'clinic_name', 'payment_name as payment', 'doctor_name as doctor_detail_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_hospital_day as day', 'status_name',
                    'reserve_hospital_hour as hour', 'reserve_hospital_is_insurance as insurance', 'reserve_hospital_has_file as file',
                    'reserve_hospital_notice as notice', 'reserve_hospital.status_id', 'doctor_price as price', 'user_phone_code as phone_code')
                ->get();
        } else {
            $reservation = DB::table('reserve_hospital')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_hospital.reserve_hospital_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                ->where([
                    ['reserve_hospital_id', '=', $id],
                    ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_hospital_id as id', 'hospital_name', 'clinic_name', 'payment_name as payment', 'doctor_name as doctor_detail_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_hospital_day as day', 'status_name',
                    'reserve_hospital_hour as hour', 'reserve_hospital_is_insurance as insurance', 'reserve_hospital_has_file as file',
                    'reserve_hospital_notice as notice', 'reserve_hospital.status_id', 'doctor_price as price', 'user_phone_code as phone_code')
                ->get();
        }
            
            
        $histories = DB::table('history_status')
            ->join('status_description', 'status_description.status_id', '=', 'history_status.status_id')
            ->where('type', '=', 1)
            ->where('reserve_id', '=', $id)
            ->where('language_id', '=', language())
            ->orderBy('history_status_id', 'desc')
            ->select('history_status.status_id', 'history_status.created_at', 'status_name', 'comment')
            ->get();
            
        if($reservation[0]->status_id == 1) {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [2, 3])
                ->get();
        } else {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [3, 4])
                ->get();
        }

        return view('superAdmin.reservations.showHospital', compact('reservation', 'histories', 'status'));
    }

    public function showReserveClinic($id){
        $checkFromReserve = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $id)->select('user_id', 'clinic_id', 'doctor_id')->first();
        $checkUserFromUsers = DB::table('users')->where('id', '=', $checkFromReserve->user_id)->count();
        $checkClinic = DB::table('clinics')->where('clinic_id', '=', $checkFromReserve->clinic_id)->count();
        $checkDoctor = DB::table('doctors')->where('doctor_id', '=', $checkFromReserve->doctor_id)->count();
        
        if($checkClinic > 0 && $checkDoctor > 0) {
            $reservation = DB::table('reserve_clinic')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                ->join('users', 'users.id', '=', 'reserve_clinic.user_id')
                ->join('doctor_detail', 'doctor_detail.doctor_id', '=', 'reserve_clinic.doctor_id')
                ->join('doctors', 'doctors.doctor_id', '=', 'reserve_clinic.doctor_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_clinic.reserve_clinic_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
                ->where([
                    ['reserve_clinic_id', '=', $id],
                    ['clinic_description.language_id', '=', language()],
                    ['payment_description.language_id', '=', language()],
                    ['doctor_detail.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_clinic_id as id', 'clinic_description.clinic_name', 'doctor_detail_name', 'status_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_clinic_day as day',
                    'reserve_clinic_time as hour', 'reserve_clinic_is_insurance as insurance',
                    'payment_name as payment', 'reserve_clinic_has_file as file', 'doctors.doctor_price as price',
                    'reserve_clinic_notice as notice', 'reserve_clinic.status_id', 'user_phone_code as phone_code')
                ->get();
        } elseif($checkClinic > 0 && $checkDoctor == 0) {
            $reservation = DB::table('reserve_clinic')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                ->join('users', 'users.id', '=', 'reserve_clinic.user_id')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_clinic.reserve_clinic_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
                ->where([
                    ['reserve_clinic_id', '=', $id],
                    ['clinic_description.language_id', '=', language()],
                    ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_clinic_id as id', 'clinic_description.clinic_name', 'doctor_name as doctor_detail_name', 'status_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_clinic_day as day',
                    'reserve_clinic_time as hour', 'reserve_clinic_is_insurance as insurance',
                    'payment_name as payment', 'reserve_clinic_has_file as file', 'doctor_price as price',
                    'reserve_clinic_notice as notice', 'reserve_clinic.status_id', 'user_phone_code as phone_code')
                ->get();
        } else {
            $reservation = DB::table('reserve_clinic')
                ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_clinic.reserve_clinic_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
                ->where([
                    ['reserve_clinic_id', '=', $id],
                    ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_clinic_id as id', 'clinic_name', 'doctor_name as doctor_detail_name', 'status_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'reserve_clinic_day as day',
                    'reserve_clinic_time as hour', 'reserve_clinic_is_insurance as insurance',
                    'payment_name as payment', 'reserve_clinic_has_file as file', 'doctor_price as price',
                    'reserve_clinic_notice as notice', 'reserve_clinic.status_id', 'user_phone_code as phone_code')
                ->get();
        }
        
        $histories = DB::table('history_status')
            ->join('status_description', 'status_description.status_id', '=', 'history_status.status_id')
            ->where('type', '=', 2)
            ->where('reserve_id', '=', $id)
            ->where('language_id', '=', language())
            ->orderBy('history_status_id', 'desc')
            ->select('history_status.status_id', 'history_status.created_at', 'status_name', 'comment')
            ->get();
            
       if($reservation[0]->status_id == 1) {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [2, 3])
                ->get();
        } else {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [3, 4])
                ->get();
        }

        // dd($reservation);

        return view('superAdmin.reservations.showClinic', compact('reservation', 'histories', 'status'));
    }

    public function showReserveRestaurant($id){
        $checkFromReserve = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $id)->select('user_id', 'restaurant_id')->first();
        $checkUserFromUsers = DB::table('users')->where('id', '=', $checkFromReserve->user_id)->count();
        $checkRestaurant = DB::table('restaurants')->where('restaurant_id', '=', $checkFromReserve->restaurant_id)->count();

        if($checkRestaurant > 0) {
            $reservation = DB::table('reserve_restaurant')
                ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                ->join('users', 'users.id', '=', 'reserve_restaurant.user_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
                ->where([
                    ['reserve_restaurant_id', '=', $id],
                    ['restaurant_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_restaurant_id as id', 'restaurant_description.restaurant_name', 'user_name as name', 'user_phone as phone', 'user_email as email',
                    'reserve_restaurant_day as day', 'reserve_restaurant_time as hour', 'status_name',
                    'reserve_restaurant_num_person as numPerson', 'reserve_restaurant_notice as notice', 'reserve_restaurant.status_id', 'user_phone_code as phone_code')
                ->get();
        } else {
            $reservation = DB::table('reserve_restaurant')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
                ->where([
                    ['reserve_restaurant_id', '=', $id],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_restaurant_id as id', 'restaurant_name', 'user_name as name', 'user_phone as phone', 'user_email as email',
                    'reserve_restaurant_day as day', 'reserve_restaurant_time as hour', 'status_name',
                    'reserve_restaurant_num_person as numPerson', 'reserve_restaurant_notice as notice', 'reserve_restaurant.status_id', 'user_phone_code as phone_code')
                ->get();
        }

        $histories = DB::table('history_status')
            ->join('status_description', 'status_description.status_id', '=', 'history_status.status_id')
            ->where('type', '=', 3)
            ->where('reserve_id', '=', $id)
            ->where('language_id', '=', language())
            ->orderBy('history_status_id', 'desc')
            ->select('history_status.status_id', 'history_status.created_at', 'status_name', 'comment')
            ->get();
            
        if($reservation[0]->status_id == 1) {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [2, 3])
                ->get();
        } else {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [3, 4])
                ->get();
        }

        return view('superAdmin.reservations.showRestaurant', compact('reservation', 'histories', 'status'));
    }

    public function showReserveCatering($id){
        $checkFromReserve = DB::table('reserve_catering')->where('reserve_catering_id', '=', $id)->select('user_id', 'catering_id', 'price_plan_id')->first();
        $checkUserFromUsers = DB::table('users')->where('id', '=', $checkFromReserve->user_id)->count();
        $checkCatering = DB::table('catering')->where('catering_id', '=', $checkFromReserve->catering_id)->count();
        $checkPricePlan = DB::table('price_plan')->where('price_plan_id', '=', $checkFromReserve->price_plan_id)->count();
        
        if($checkCatering > 0 && $checkPricePlan > 0) {
            $reservation = DB::table('reserve_catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                ->join('users', 'users.id', '=', 'reserve_catering.user_id')
                ->join('price_plan_description','price_plan_description.price_plan_id', '=', 'reserve_catering.price_plan_id')
                // ->join('payment_description', 'payment_description.payment_method_id', '=', 'reserve_catering.reserve_catering_payment_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
                ->where([
                    ['reserve_catering_id', '=', $id],
                    ['catering_description.language_id', '=', language()],
                    ['price_plan_description.language_id', '=', language()],
                //     ['payment_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_catering_id as id', 'catering_description.catering_name', 'price_plan_description_name as price_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'status_name',
                    'reserve_catering_day as day', 'reserve_catering_time as hour', /*'payment_name as payment',*/
                    'reserve_catering_num_of_person as numPerson', 'reserve_catering_notice as notice', 'reserve_latitude as latitude', 'reserve_longitude as longitude',
                    'reserve_catering_sub_price as subPrice', 'reserve_catering_coupon_code as coupon_code',
                    'reserve_catering_coupon_discount as discount', 'reserve_catering_final_price as finalPrice', 'reserve_catering.status_id', 'user_phone_code as phone_code')
                ->get();
        } elseif($checkCatering > 0 && $checkPricePlan == 0) {
            $reservation = DB::table('reserve_catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                ->join('users', 'users.id', '=', 'reserve_catering.user_id')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
                ->where([
                    ['reserve_catering_id', '=', $id],
                    ['catering_description.language_id', '=', language()],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_catering_id as id', 'catering_description.catering_name', 'price_plan_name as price_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'status_name',
                    'reserve_catering_day as day', 'reserve_catering_time as hour', 
                    'reserve_catering_num_of_person as numPerson', 'reserve_catering_notice as notice', 'reserve_latitude as latitude', 'reserve_longitude as longitude',
                    'reserve_catering_sub_price as subPrice', 'reserve_catering_coupon_code as coupon_code',
                    'reserve_catering_coupon_discount as discount', 'reserve_catering_final_price as finalPrice', 'reserve_catering.status_id', 'user_phone_code as phone_code')
                ->get();
        } else {
            $reservation = DB::table('reserve_catering')
                ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
                ->where([
                    ['reserve_catering_id', '=', $id],
                    ['status_description.language_id', '=', language()]
                ])
                ->select('reserve_catering_id as id', 'catering_name', 'price_plan_name as price_name',
                    'user_name as name', 'user_phone as phone', 'user_email as email', 'status_name',
                    'reserve_catering_day as day', 'reserve_catering_time as hour', 
                    'reserve_catering_num_of_person as numPerson', 'reserve_catering_notice as notice', 'reserve_latitude as latitude', 'reserve_longitude as longitude',
                    'reserve_catering_sub_price as subPrice', 'reserve_catering_coupon_code as coupon_code',
                    'reserve_catering_coupon_discount as discount', 'reserve_catering_final_price as finalPrice', 'reserve_catering.status_id', 'user_phone_code as phone_code')
                ->get();
        }

        $histories = DB::table('history_status')
            ->join('status_description', 'status_description.status_id', '=', 'history_status.status_id')
            ->where('type', '=', 4)
            ->where('reserve_id', '=', $id)
            ->where('language_id', '=', language())
            ->orderBy('history_status_id', 'desc')
            ->select('history_status.status_id', 'history_status.created_at', 'status_name', 'comment')
            ->get();
            
        if($reservation[0]->status_id == 1) {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [2, 3])
                ->get();
        } else {
            $status = DB::table('status')
                ->join('status_description', 'status_description.status_id', '=', 'status.status_id')
                ->select('status.status_id as id', 'status_name as name')
                ->where('language_id', '=', language())
                ->whereIn('status.status_id', [3, 4])
                ->get();
        }

        return view('superAdmin.reservations.showCatering', compact('reservation', 'histories', 'status'));
    }
    
    public function updateState(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'status_name' => 'required',
            'comment' => 'nullable'
        ]);
        
        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        $type = auth()->guard('admin')->user()->type;
        $CustomersPush = new CustomersPush();
        $please[0] = 'Please make a new request';
        $please[1] = 'يرجى عمل طلب جديد';
        
        if(auth()->guard('admin')->user()->type == 1) {
            $checkStatusHospital = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $id)->select('status_id')->first();
            if((($request->status_name == $checkStatusHospital->status_id) == 2) || (($request->status_name == $checkStatusHospital->status_id) == 3) || (($request->status_name == $checkStatusHospital->status_id) == 4)) {
                if($checkStatusHospital->status_id == 2){
                    $error = trans('admin.the reservation was accepted before');
                } elseif($checkStatusHospital->status_id == 3) {
                    $error = trans('admin.the reservation was canceled before');
                } else {
                    $error = trans('admin.the reservation was finished before');
                }
                return Redirect::back()->withInput($request->all())->with('error', $error);
            } else {
                $update = DB::table('reserve_hospital')
                    ->where('reserve_hospital_id', '=', $id)
                    ->update(['status_id' => $request->status_name]);
                $getId = DB::table('reserve_hospital')->where('reserve_hospital_id', '=', $id)
                    ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
                    // ->join('status_description', 'status_description.status_id', '=', 'reserve_hospital.status_id')
                    ->select('reserve_hospital.hospital_id', 'user_id', 'hospital_description.hospital_name', 'reserve_hospital.status_id')
                    // ->where('hospital_description.language_id', '=', language())
                    // ->where('status_description.language_id', '=', language())
                    ->get();
                foreach($getId as $status){
                    $title = DB::table('status_description')->where('status_id', '=', $status->status_id)->get();
                    $status->titles = $title;
                }
                // return response()->json($getId);
                // dd($please[1]);
                    
                if($request->status_name == 3) {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->hospital_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',
                        'notification_image' => 'images/hospital/avatar_hospital.png',
                        'user_id' => $getId[0]->user_id,
                        'type' => 1,
                        'type_id' => $getId[0]->hospital_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->hospital_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                }else{
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->hospital_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment,
                        'notification_image' => 'images/hospital/avatar_hospital.png',
                        'user_id' => $getId[0]->user_id,
                        'type' => 1,
                        'type_id' => $getId[0]->hospital_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->hospital_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                }
                $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId[0]->user_id)->get();
                foreach($customersToken as $customer){
                    $customersTokenArr[]=$customer->token;
                }
                $getUserLanguage = DB::table('users')->select('default_language')->where('id', '=', $getId[0]->user_id)->first();
                $not = DB::table('notification_description')
                    ->select('notification_name', 'notification_content')
                    ->where('language_id', '=', $getUserLanguage->default_language)
                    ->where('notification_id', '=', $notify)
                    ->first();
                if($request->status_name == 3) {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                } else {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                }
            }
        } elseif(auth()->guard('admin')->user()->type == 2) {
            $checkStatusClinic = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $id)->select('status_id')->first();
            if((($request->status_name == $checkStatusClinic->status_id) == 2) || (($request->status_name == $checkStatusClinic->status_id) == 3) || (($request->status_name == $checkStatusClinic->status_id) == 4)) {
                if($checkStatusClinic->status_id == 2){
                    $error = trans('admin.the reservation was accepted before');
                } elseif($checkStatusClinic->status_id == 3) {
                    $error = trans('admin.the reservation was canceled before');
                } else {
                    $error = trans('admin.the reservation was finished before');
                }
                return Redirect::back()->withInput($request->all())->with('error', $error);
            } else {
                $update = DB::table('reserve_clinic')
                    ->where('reserve_clinic_id', '=', $id)
                    ->update(['status_id' => $request->status_name]);
                
                // $getId = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $id)
                //     ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                //     ->join('status_description', 'status_description.status_id', '=', 'reserve_clinic.status_id')
                //     ->select('reserve_clinic.clinic_id', 'user_id', 'clinic_name', 'status_name','status_title')
                //     ->where('clinic_description.language_id', '=', language())
                //     ->where('status_description.language_id', '=', language())
                //     ->first();
                
                $getId = DB::table('reserve_clinic')->where('reserve_clinic_id', '=', $id)
                    ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
                    ->select('reserve_clinic.clinic_id', 'user_id', 'clinic_description.clinic_name', 'reserve_clinic.status_id')
                    ->get();
                foreach($getId as $status){
                    $title = DB::table('status_description')->where('status_id', '=', $status->status_id)->get();
                    $status->titles = $title;
                }
                    
                if($request->status_name == 3) {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->clinic_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',
                        'notification_image' => 'images/clinic/avatar_clinic.jpg',
                        'user_id' => $getId[0]->user_id,
                        'type' => 2,
                        'type_id' => $getId[0]->clinic_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->clinic_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                } else {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->clinic_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment,
                        'notification_image' => 'images/clinic/avatar_clinic.jpg',
                        'user_id' => $getId[0]->user_id,
                        'type' => 2,
                        'type_id' => $getId[0]->clinic_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->clinic_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                }
                
                // $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId->user_id)->get();
                // foreach($customersToken as $customer){
                //     $customersTokenArr[]=$customer->token;
                // }
                // if($request->status_name == 3) {
                //     $CustomersPush->send($getId->clinic_name,$getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',$customersTokenArr,'','1');
                // } else {
                //     $CustomersPush->send($getId->clinic_name,$getId->status_title.' , '.$request->comment,$customersTokenArr,'','1');
                // }
                $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId[0]->user_id)->get();
                foreach($customersToken as $customer){
                    $customersTokenArr[]=$customer->token;
                }
                $getUserLanguage = DB::table('users')->select('default_language')->where('id', '=', $getId[0]->user_id)->first();
                $not = DB::table('notification_description')
                    ->select('notification_name', 'notification_content')
                    ->where('language_id', '=', $getUserLanguage->default_language)
                    ->where('notification_id', '=', $notify)
                    ->first();
                if($request->status_name == 3) {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                } else {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                }
            }
        } elseif(auth()->guard('admin')->user()->type == 3) {
            $checkStatusRestaurant = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $id)->select('status_id')->first();
            if((($request->status_name == $checkStatusRestaurant->status_id) == 2) || (($request->status_name == $checkStatusRestaurant->status_id) == 3) || (($request->status_name == $checkStatusRestaurant->status_id) == 4)) {
                if( $checkStatusRestaurant->status_id == 2){
                    $error = trans('admin.the reservation was accepted before');
                } elseif($checkStatusRestaurant->status_id == 3) {
                    $error = trans('admin.the reservation was canceled before');
                } else {
                    $error = trans('admin.the reservation was finished before');
                }
                return Redirect::back()->withInput($request->all())->with('error', $error);
            } else {
                $update = DB::table('reserve_restaurant')
                    ->where('reserve_restaurant_id', '=', $id)
                    ->update(['status_id' => $request->status_name]);
                
                // $getId = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $id)
                //     ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                //     ->join('status_description', 'status_description.status_id', '=', 'reserve_restaurant.status_id')
                //     ->select('reserve_restaurant.restaurant_id', 'user_id', 'restaurant_name', 'status_name','status_title')
                //     ->where('restaurant_description.language_id', '=', language())
                //     ->where('status_description.language_id', '=', language())
                //     ->first();
                
                $getId = DB::table('reserve_restaurant')->where('reserve_restaurant_id', '=', $id)
                    ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
                    ->select('reserve_restaurant.restaurant_id', 'user_id', 'restaurant_description.restaurant_name', 'reserve_restaurant.status_id')
                    ->get();
                foreach($getId as $status){
                    $title = DB::table('status_description')->where('status_id', '=', $status->status_id)->get();
                    $status->titles = $title;
                }
    
                if($request->status_name == 3) {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->restaurant_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',
                        'notification_image' => 'images/restaurant/avatar_restaurant.png',
                        'user_id' => $getId[0]->user_id,
                        'type' => 3,
                        'type_id' => $getId[0]->restaurant_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->restaurant_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                } else {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->restaurant_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment,
                        'notification_image' => 'images/restaurant/avatar_restaurant.png',
                        'user_id' => $getId[0]->user_id,
                        'type' => 3,
                        'type_id' => $getId[0]->restaurant_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->restaurant_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                }
                    
                // $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId->user_id)->get();
                // foreach($customersToken as $customer){
                //     $customersTokenArr[]=$customer->token;
                // }
                // if($request->status_name == 3) {
                //     $CustomersPush->send($getId->restaurant_name,$getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',$customersTokenArr,'','1');
                // } else {
                //     $CustomersPush->send($getId->restaurant_name,$getId->status_title.' , '.$request->comment,$customersTokenArr,'','1');
                // }
                $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId[0]->user_id)->get();
                foreach($customersToken as $customer){
                    $customersTokenArr[]=$customer->token;
                }
                $getUserLanguage = DB::table('users')->select('default_language')->where('id', '=', $getId[0]->user_id)->first();
                $not = DB::table('notification_description')
                    ->select('notification_name', 'notification_content')
                    ->where('language_id', '=', $getUserLanguage->default_language)
                    ->where('notification_id', '=', $notify)
                    ->first();
                if($request->status_name == 3) {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                } else {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                }
            }
        } else {
            $checkStatusCatering = DB::table('reserve_catering')->where('reserve_catering_id', '=', $id)->select('status_id')->first();
            if((($request->status_name == $checkStatusCatering->status_id) == 2) || (($request->status_name == $checkStatusCatering->status_id) == 3) || (($request->status_name == $checkStatusCatering->status_id) == 4)) {
                if($checkStatusCatering->status_id == 2){
                    $error = trans('admin.the reservation was accepted before');
                } elseif($checkStatusCatering->status_id == 3) {
                    $error = trans('admin.the reservation was canceled before');
                } else {
                    $error = trans('admin.the reservation was finished before');
                }
                return Redirect::back()->withInput($request->all())->with('error', $error);
            } else {
                $update = DB::table('reserve_catering')
                    ->where('reserve_catering_id', '=', $id)
                    ->update(['status_id' => $request->status_name]);
                
                // $getId = DB::table('reserve_catering')->where('reserve_catering_id', '=', $id)
                //     ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                //     ->join('status_description', 'status_description.status_id', '=', 'reserve_catering.status_id')
                //     ->select('reserve_catering.catering_id', 'user_id', 'catering_name', 'status_name','status_title')
                //     ->where('catering_description.language_id', '=', language())
                //     ->where('status_description.language_id', '=', language())
                //     ->first();
                
                $getId = DB::table('reserve_catering')->where('reserve_catering_id', '=', $id)
                    ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
                    ->select('reserve_catering.catering_id', 'user_id', 'catering_description.catering_name', 'reserve_catering.status_id')
                    ->get();
                foreach($getId as $status){
                    $title = DB::table('status_description')->where('status_id', '=', $status->status_id)->get();
                    $status->titles = $title;
                }
    
                if($request->status_name == 3) {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->catering_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',
                        'notification_image' => 'images/catering/avatar_catering.jpg',
                        'user_id' => $getId[0]->user_id,
                        'type' => 4,
                        'type_id' => $getId[0]->catering_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->catering_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                } else {
                    $notify = DB::table('notifications')->insertGetId([
                        // 'notification_name' => $getId->catering_name,
                        // 'notification_content' => $getId->status_title.' , '.$request->comment,
                        'notification_image' => 'images/catering/avatar_catering.jpg',
                        'user_id' => $getId[0]->user_id,
                        'type' => 4,
                        'type_id' => $getId[0]->catering_id,
                        'created_at' => get_local_time($request->getClientIp())
                    ]);
                    for ($i = 0; $i <= 1; $i++){
                        // dd($getId[1]->hospital_name);
                        $description = DB::table('notification_description')
                            ->insert([
                                'notification_name' => $getId[$i]->catering_name,
                                'notification_content' => $getId[$i]->titles[$i]->status_title . ' , ' . $request->comment . $please[$i],
                                'language_id' => $i+1,
                                'notification_id' => $notify
                            ]);
                    }
                }
                    
                // $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId->user_id)->get();
                // foreach($customersToken as $customer){
                //     $customersTokenArr[]=$customer->token;
                // }
                // if($request->status_name == 3) {
                //     $CustomersPush->send($getId->catering_name,$getId->status_title.' , '.$request->comment.' , يرجى عمل طلب جديد',$customersTokenArr,'','1');
                // } else {
                //     $CustomersPush->send($getId->catering_name,$getId->status_title.' , '.$request->comment,$customersTokenArr,'','1');
                // }
                $customersToken = DB::table('users')->select('token')->where('active','1')->where('id',$getId[0]->user_id)->get();
                foreach($customersToken as $customer){
                    $customersTokenArr[]=$customer->token;
                }
                $getUserLanguage = DB::table('users')->select('default_language')->where('id', '=', $getId[0]->user_id)->first();
                $not = DB::table('notification_description')
                    ->select('notification_name', 'notification_content')
                    ->where('language_id', '=', $getUserLanguage->default_language)
                    ->where('notification_id', '=', $notify)
                    ->first();
                if($request->status_name == 3) {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                } else {
                    $CustomersPush->send($not->notification_name, $not->notification_content,$customersTokenArr,'','1');
                }
            }
        }
        
        if($request->comment){
            $insert = DB::table('history_status')->insert([
                'reserve_id' => $id,
                'status_id' => $request->status_name,
                'type' => $type,
                'comment' => $request->comment,
                'created_at' => get_local_time($request->getClientIp())
            ]);
        } else {
            $insert = DB::table('history_status')->insert([
                'reserve_id' => $id,
                'status_id' => $request->status_name,
                'type' => $type,
                'created_at' => get_local_time($request->getClientIp())
            ]);
        }
        
        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
        
    }
    
    public function reserve_count(){
        $type_id = auth()->guard('admin')->user()->type_id;
        if(auth()->guard('admin')->user()->type == 1) {
            $allReservations = DB::table('reserve_hospital')->where('hospital_id', '=', $type_id)->where('status_id', '=', 1)->count();
            return response()->json($allReservations);
        } elseif(auth()->guard('admin')->user()->type == 2) {
            $allReservations = DB::table('reserve_clinic')->where('clinic_id', '=', $type_id)->where('status_id', '=', 1)->count();
            return response()->json($allReservations);
        } elseif(auth()->guard('admin')->user()->type == 3) {
            $allReservations = DB::table('reserve_restaurant')->where('restaurant_id', '=', $type_id)->where('status_id', '=', 1)->count();
            return response()->json($allReservations);
        } else {
            $allReservations = DB::table('reserve_catering')->where('catering_id', '=', $type_id)->where('status_id', '=', 1)->count();
            return response()->json($allReservations);
        }
    }
    
    public function reserve_notify(){
        $type_id = auth()->guard('admin')->user()->type_id;
        if(auth()->guard('admin')->user()->type == 1) {
            $allReservations = DB::table('reserve_hospital')->where('hospital_id', '=', $type_id)->where('notify_count', '=', 0)->count();
            $update = DB::table('reserve_hospital')->where('hospital_id', '=', $type_id)->where('notify_count', '=', 0)->update(['notify_count' => 1]);
            return response()->json($allReservations);
        } elseif(auth()->guard('admin')->user()->type == 2) {
            $allReservations = DB::table('reserve_clinic')->where('clinic_id', '=', $type_id)->where('notify_count', '=', 0)->count();
            $update = DB::table('reserve_clinic')->where('clinic_id', '=', $type_id)->where('notify_count', '=', 0)->update(['notify_count' => 1]);
            return response()->json($allReservations);
        } elseif(auth()->guard('admin')->user()->type == 3) {
            $allReservations = DB::table('reserve_restaurant')->where('restaurant_id', '=', $type_id)->where('notify_count', '=', 0)->count();
            $update = DB::table('reserve_restaurant')->where('restaurant_id', '=', $type_id)->where('notify_count', '=', 0)->update(['notify_count' => 1]);
            return response()->json($allReservations);
        } else {
            $allReservations = DB::table('reserve_catering')->where('catering_id', '=', $type_id)->where('notify_count', '=', 0)->count();
            $update = DB::table('reserve_catering')->where('catering_id', '=', $type_id)->where('notify_count', '=', 0)->update(['notify_count' => 1]);
            return response()->json($allReservations);
        }
    }
}

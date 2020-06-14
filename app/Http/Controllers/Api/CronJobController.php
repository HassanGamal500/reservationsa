<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Carbon\Carbon;

class CronJobController extends Controller
{
    public function cron(){
        date_default_timezone_set('Asia/Riyadh');
        
        $date = date('H')+1;
        $dateHMS = date('H:i', strtotime('1 hour')).':00';
        $CustomersPush = new CustomersPush();
        $customersTokenArr = array();
        
        $hospitals = DB::table('reserve_hospital')
            ->join('hospital_description', 'hospital_description.hospital_id', '=', 'reserve_hospital.hospital_id')
            ->select('reserve_hospital.hospital_id', 'user_id', 'hospital_name')
            ->where('hospital_description.language_id', '=', language())
            ->where('reserve_hospital_hour', '=', $date)
            ->where('reserve_hospital_day', '=', date('Y-m-d'))
            ->where('cron_notify', '=', 0)
            ->get();
            
        foreach($hospitals as $hospital){
                $customersToken = DB::table('users')
                ->where('id', '=', $hospital->user_id)
                ->select('token')
                ->where('active','1')
                ->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
        }
        
        //------------------------------------------------------------------
        
        $clinics = DB::table('reserve_clinic')
            ->join('clinic_description', 'clinic_description.clinic_id', '=', 'reserve_clinic.clinic_id')
            ->select('reserve_clinic.clinic_id', 'user_id', 'clinic_name')
            ->where('clinic_description.language_id', '=', language())
            ->where('reserve_clinic_time', '=', $date)
            ->where('reserve_clinic_day', '=', date('Y-m-d'))
            ->where('cron_notify', '=', 0)
            ->get();
            
        foreach($clinics as $clinic){
                $customersToken = DB::table('users')
                ->where('id', '=', $clinic->user_id)
                ->select('token')
                ->where('active','1')
                ->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
        }
        
        //------------------------------------------------------------------
        
        $restaurants = DB::table('reserve_restaurant')
            ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'reserve_restaurant.restaurant_id')
            ->select('reserve_restaurant.restaurant_id', 'user_id', 'restaurant_name')
            ->where('restaurant_description.language_id', '=', language())
            ->where('reserve_restaurant_time', '=', $dateHMS)
            ->where('reserve_restaurant_day', '=', date('Y-m-d'))
            ->where('cron_notify', '=', 0)
            ->get();
            
        foreach($restaurants as $restaurant){
                $customersToken = DB::table('users')
                ->where('id', '=', $restaurant->user_id)
                ->select('token')
                ->where('active','1')
                ->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
        }
        
        //------------------------------------------------------------------
        
        $caterings = DB::table('reserve_catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'reserve_catering.catering_id')
            ->select('reserve_catering.catering_id', 'user_id', 'catering_name')
            ->where('catering_description.language_id', '=', language())
            ->where('reserve_catering_time', '=', $dateHMS)
            ->where('reserve_catering_day', '=', date('Y-m-d'))
            ->where('cron_notify', '=', 0)
            ->get();
            
        foreach($caterings as $catering){
                $customersToken = DB::table('users')
                ->where('id', '=', $catering->user_id)
                ->select('token')
                ->where('active','1')
                ->get();
            foreach($customersToken as $customer){
                $customersTokenArr[]=$customer->token;
            }
        }
        
        //------------------------------------------------------------------
        
        $CustomersPush->send('تذكير بالحجز الخاص بك', 'نذكرك بموعد الحجز الخاص بك و انه سوف يكون فى غضون ساعة', $customersTokenArr, '', '1');
        
        //------------------------------------------------------------------
        
        $updateCron = DB::table('reserve_hospital')->where('cron_notify', '=', 0)->where('reserve_hospital_hour', '=', $date)->update(['cron_notify' => 1]);
        $updateCron = DB::table('reserve_clinic')->where('cron_notify', '=', 0)->where('reserve_clinic_time', '=', $date)->update(['cron_notify' => 1]);
        $updateCron = DB::table('reserve_restaurant')->where('cron_notify', '=', 0)->where('reserve_restaurant_time', '=', $dateHMS)->update(['cron_notify' => 1]);
        $updateCron = DB::table('reserve_catering')->where('cron_notify', '=', 0)->where('reserve_catering_time', '=', $dateHMS)->update(['cron_notify' => 1]);
        
        // return $dateHMS;
    
    }
    
    // public function clinic(){
    
    //     date_default_timezone_set('Asia/Riyadh');
        
    //     $cron = DB::table('reserve_clinic')
    //     ->where('reserve_clinic_time', '=', date('H')+1)
    //     ->count();
        
    //     return response()->json($cron);
    // }
    
    // public function restaurant(){
    
    //     date_default_timezone_set('Asia/Riyadh');
        
    //     $cron = DB::table('reserve_restaurant')
    //     ->where('reserve_restaurant_time', '=', date('H:i:s', strtotime('1 hour')))
    //     ->count();
        
    //     return response()->json($cron);
    // }
    
    // public function catering(){
    
    //     date_default_timezone_set('Asia/Riyadh');
        
    //     $cron = DB::table('reserve_catering')
    //     ->where('reserve_catering_time', '=', date('H:i:s', strtotime('1 hour')))
    //     ->count();
        
    //     return response()->json($cron);
    // }
}

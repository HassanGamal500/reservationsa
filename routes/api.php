<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('sendNotification', 'SuperAdmin\AdminsPush@send');

//------------------------------
Route::group(['namespace' => 'Api'], function() {
    //Auth
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@register');
    Route::post('userLogOut', 'AuthController@userLogOut');
    Route::post('reset_password', 'AuthController@resetPassword');
    Route::post('pin_code', 'AuthController@pinCode');
    Route::post('new_password', 'AuthController@newPassword');
    Route::post('profile', 'AuthController@profile');
    Route::post('update_profile', 'AuthController@updateProfile');
    Route::post('check', 'AuthController@getUserDetail');
    //Setting
    Route::get('languages', 'SettingController@languages');
    Route::post('page', 'SettingController@page');
    Route::post('get_city', 'SettingController@getCity');
    Route::post('contact_us', 'SettingController@contactUs');
    Route::post('country_code', 'SettingController@country_code');
    Route::get('insertCity', 'SettingController@city');
    Route::post('setLangUser', 'SettingController@setLangUser');
    //App
    Route::post('advertisements', 'AppController@advertisements');
    Route::post('histories', 'AppController@Histories');
    Route::post('notifications', 'AppController@notifications');
    Route::post('images', 'AppController@images');
    Route::post('interests', 'AppController@interests');
    Route::post('add_interests', 'AppController@add_interest');
    Route::post('rates', 'AppController@rates');
    Route::post('all_rates', 'AppController@allRates');
    Route::post('insurances', 'AppController@insurances');
    Route::post('reserveDetails', 'AppController@reserveDetails');
    Route::post('cancel_order', 'AppController@cancelOrder');
    //Hospital
    Route::post('all_hospitals', 'HospitalController@allHospitals');
    Route::post('hospital', 'HospitalController@hospital');
    Route::post('hospital_clinic', 'HospitalController@hospital_clinic');
    Route::post('clinic_doctor', 'HospitalController@clinic_doctor');
    Route::post('available_hospital', 'HospitalController@available_work');
    Route::post('reserve_hospital', 'HospitalController@reserveHospital');
    //Clinic
    Route::post('all_clinics', 'ClinicController@allClinics');
    Route::post('clinic', 'ClinicController@clinic');
    Route::post('available_clinic', 'ClinicController@available_work');
    Route::post('reserve_clinic', 'ClinicController@reserveClinic');
    //Restaurant
    Route::post('all_restaurants', 'RestaurantController@allRestaurants');
    Route::post('restaurant', 'RestaurantController@restaurant');
    Route::post('reserve_restaurant', 'RestaurantController@reserveRestaurant');
    //Catering
    Route::post('all_caterings', 'CateringController@allCatering');
    Route::post('all_packages', 'CateringController@allPackages');
    Route::post('catering', 'CateringController@catering');
    Route::post('coupon', 'CateringController@coupon');
    Route::post('reserve_catering', 'CateringController@reserveCatering');
    // Cron Job
    Route::get('/crons', 'CronJobController@cron')->name('cron_job');
    // Test 
    Route::get('ip_address', function(){
        $ip = "5.244.224.85"; // request()->ip();

        $url = 'http://ip-api.com/json/'.$ip;
    
        $tz = file_get_contents($url);
        
        // return $data = json_decode($tz, true);
        
        // $timezone = json_decode($tz,true)['timezone']; echo '<br>'. $timezone;
        // $city = json_decode($tz,true)['city']; echo '<br>'. $city;
        // $region = json_decode($tz,true)['region']; echo '<br>'. $region;
        // $regionName = json_decode($tz,true)['regionName']; echo '<br>'. $regionName;
        // $country = json_decode($tz,true)['country']; echo '<br>'. $country;
        // $countryCode = json_decode($tz,true)['countryCode']; echo '<br>'. $countryCode;
        // $latitude = json_decode($tz,true)['lat']; echo '<br>'. $latitude;
        // $longitude = json_decode($tz,true)['lon']; echo '<br>'. $longitude;
       
        $tz = json_decode($tz,true)['timezone'];
        date_default_timezone_set($tz);
    
        // return date_default_timezone_get();
        return date('Y/m/d H:i:s');
    });
    
    // Notification 
    // Route::get('sendNotification', 'AdminsPush@send');
    
    
    
});



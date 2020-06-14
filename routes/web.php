<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Super Admin

use Illuminate\Support\Facades\App;

Route::get('/lang/{locale}', function ($locale){
    App::setLocale($locale);
    session()->put('locale', $locale);
    return redirect()->back();
});


//--------------------------------------------

// Test For Database 
Route::get('/insert', 'Api\SettingController@city');
//---------------------

//Clear Cache facade value:
Route::get('/clear-cache', function() {
    $exitCode = Artisan::call('cache:clear');
    return '<h1>Cache facade value cleared</h1>';
});

//Route cache:
Route::get('/route-cache', function() {
    $exitCode = Artisan::call('route:cache');
    return '<h1>Routes cached</h1>';
});

//Clear Route cache:
Route::get('/route-clear', function() {
    $exitCode = Artisan::call('route:clear');
    return '<h1>Route cache cleared</h1>';
});

//Cache Config cache:
Route::get('/config-cache', function() {
    $exitCode = Artisan::call('config:cache');
    return '<h1>Clear Config cleared</h1>';
});

//Clear Config cache:
Route::get('/config-clear', function() {
    $exitCode = Artisan::call('config:clear');
    return '<h1>Clear Config cleared</h1>';
});

//---------------------------------------


Route::get('/', function (){
    return view('welcome');
});

Route::get('/permission', function(){
    return view('superAdmin.access');
});

Route::get('/admin/login', 'SuperAdmin\AdminLoginController@showLoginForm')->name('admin.login');
Route::post('/admin/login', 'SuperAdmin\AdminLoginController@login')->name('admin.login.post');
Route::post('/admin/logout', 'SuperAdmin\AdminLoginController@logout')->name('admin.logout');

Route::group(['prefix' => 'admin','namespace' => 'SuperAdmin', 'middleware' => 'admin'], function (){
    // AJAX 
    Route::post('/changeStatus', 'UserController@changeStatus');
    Route::post('/addCoupon', 'CouponController@addCoupon');
    Route::post('/getCoupon', 'CouponController@getCoupon');
    Route::post('/updateCoupon', 'CouponController@updateCoupon');
    Route::post('/addInterest', 'InterestController@addInterest');
    Route::post('/getInterest', 'InterestController@getInterest');
    Route::post('/updateInterest', 'InterestController@updateInterest');
    Route::post('/get_services', 'AdvertisementController@service');
    Route::post('/getToken', 'AdministrationController@getToken')->name('getToken');
    Route::get('/getType', 'AdministrationController@type')->name('getType');
    Route::post('/get_city', 'CityController@getCity');
    // Users
    Route::get('/', 'DashboardController@index')->name('dashboard');
    Route::get('/users', 'UserController@index')->name('all_users');
    Route::get('/add_user', 'UserController@create');
    Route::post('/add_user', 'UserController@store')->name('store_user');
    Route::get('/edit_user/{id}', 'UserController@edit')->name('edit_user');
    Route::post('/edit_user/{id}', 'UserController@update')->name('update_user');
    Route::delete('/delete_user/{id}', 'UserController@destroy')->name('delete_user');
    // Hospitals
    Route::get('hospitals', 'HospitalController@index');
    Route::get('/add_hospital', 'HospitalController@create');
    Route::post('/add_hospital', 'HospitalController@store')->name('store_hospital');
    Route::get('/edit_hospital/{id}', 'HospitalController@edit')->name('edit_hospital');
    Route::post('/edit_hospital/{id}', 'HospitalController@update')->name('update_hospital');
    Route::delete('/delete_hospital/{id}', 'HospitalController@destroy')->name('delete_hospital');
    // Hospital Clinic
    Route::get('clinic_hospital', 'HospitalClinicController@index');
    Route::get('clinic_hospital/{id}', 'HospitalClinicController@show')->name('show_clinic');
    Route::get('/add_clinic_hospital', 'HospitalClinicController@create');
    Route::post('/add_clinic_hospital', 'HospitalClinicController@store')->name('store_clinic_hospital');
    Route::get('/edit_clinic_hospital/{id}', 'HospitalClinicController@edit')->name('edit_clinic_hospital');
    Route::post('/edit_clinic_hospital/{id}', 'HospitalClinicController@update')->name('update_clinic_hospital');
    Route::delete('/delete_clinic_hospital/{id}', 'HospitalClinicController@destroy')->name('delete_clinic_hospital');
    // Hospital Clinic Doctor
    Route::get('clinic_doctor', 'ClinicDoctorController@index');
    Route::get('clinic_doctor/{id}', 'ClinicDoctorController@show')->name('show_doctor');
    Route::get('clinic_doctor_two/{id}', 'ClinicDoctorController@showTwo')->name('show_doctor_two');
    Route::get('/add_doctor', 'ClinicDoctorController@create');
    Route::post('/add_doctor', 'ClinicDoctorController@store')->name('store_doctor');
    Route::get('/edit_doctor/{id}', 'ClinicDoctorController@edit')->name('edit_doctor');
    Route::post('/edit_doctor/{id}', 'ClinicDoctorController@update')->name('update_doctor');
    Route::delete('/delete_doctor/{id}', 'ClinicDoctorController@destroy')->name('delete_doctor');
    // Clinics
    Route::get('clinics', 'ClinicController@index');
    Route::get('clinics/{id}', 'ClinicController@show')->name('show_doctor_c');
    Route::get('/add_clinic', 'ClinicController@create');
    Route::post('/add_clinic', 'ClinicController@store')->name('store_clinic');
    Route::get('/edit_clinic/{id}', 'ClinicController@edit')->name('edit_clinic');
    Route::post('/edit_clinic/{id}', 'ClinicController@update')->name('update_clinic');
    Route::delete('/delete_clinic/{id}', 'ClinicController@destroy')->name('delete_clinic');
    // Clinic Doctor
    Route::get('all_doctor', 'ClinicDoctorController@index');
    Route::get('/add_doctor_clinic', 'ClinicDoctorController@create');
    Route::post('/add_doctor_clinic', 'ClinicDoctorController@store')->name('store_doctor');
    Route::get('/edit_doctor_clinic/{id}', 'ClinicDoctorController@edit')->name('edit_doctor');
    Route::post('/edit_doctor_clinic/{id}', 'ClinicDoctorController@update')->name('update_doctor');
    Route::delete('/delete_doctor_clinic/{id}', 'ClinicDoctorController@destroy')->name('delete_doctor');
    // Restaurants
    Route::get('restaurants', 'RestaurantController@index');
    Route::get('/add_restaurant', 'RestaurantController@create');
    Route::post('/add_restaurant', 'RestaurantController@store')->name('store_restaurant');
    Route::get('/edit_restaurant/{id}', 'RestaurantController@edit')->name('edit_restaurant');
    Route::post('/edit_restaurant/{id}', 'RestaurantController@update')->name('update_restaurant');
    Route::delete('/delete_restaurant/{id}', 'RestaurantController@destroy')->name('delete_restaurant');
    // Caterings
    Route::get('caterings', 'CateringController@index');
    Route::get('/add_catering', 'CateringController@create');
    Route::post('/add_catering', 'CateringController@store')->name('store_catering');
    Route::get('/edit_catering/{id}', 'CateringController@edit')->name('edit_catering');
    Route::post('/edit_catering/{id}', 'CateringController@update')->name('update_catering');
    Route::delete('/delete_catering/{id}', 'CateringController@destroy')->name('delete_catering');
    // Catering Prince Plan
    Route::get('prices', 'PricePlanController@index');
    Route::get('prices/{id}', 'PricePlanController@show')->name('show_price');
    Route::get('/add_price', 'PricePlanController@create');
    Route::post('/add_price', 'PricePlanController@store')->name('store_price');
    Route::get('/edit_price/{id}', 'PricePlanController@edit')->name('edit_price');
    Route::post('/edit_price/{id}', 'PricePlanController@update')->name('update_price');
    Route::delete('/delete_price/{id}', 'PricePlanController@destroy')->name('delete_price');
    // Advertisements
    Route::get('advertisements', 'AdvertisementController@index');
    Route::get('/add_advertisement', 'AdvertisementController@create');
    Route::post('/add_advertisement', 'AdvertisementController@store')->name('store_advertisement');
    Route::get('/edit_advertisement/{id}', 'AdvertisementController@edit')->name('edit_advertisement');
    Route::post('/edit_advertisement/{id}', 'AdvertisementController@update')->name('update_advertisement');
    Route::delete('/delete_advertisement/{id}', 'AdvertisementController@destroy')->name('delete_advertisement');
    // Pages
    Route::get('pages', 'PageController@index');
    // Route::get('/add_page', 'PageController@create');
    // Route::post('/add_page', 'PageController@store')->name('store_page');
    Route::get('/edit_page/{id}', 'PageController@edit')->name('edit_page');
    Route::post('/edit_page/{id}', 'PageController@update')->name('update_page');
    Route::delete('/delete_page/{id}', 'PageController@destroy')->name('delete_page');
    // Coupons
    Route::get('coupons', 'CouponController@index');
    Route::get('/add_coupon', 'CouponController@create');
    Route::post('/add_coupon', 'CouponController@store')->name('store_coupon');
    Route::get('/edit_coupon/{id}', 'CouponController@edit')->name('edit_coupon');
    Route::post('/edit_coupon/{id}', 'CouponController@update')->name('update_coupon');
    Route::delete('/delete_coupon/{id}', 'CouponController@destroy')->name('delete_coupon');
    // Notification
    Route::get('notifications', 'NotificationController@index');
    Route::get('/add_notification', 'NotificationController@create');
    Route::post('/add_notification', 'NotificationController@store')->name('store_notification');
    Route::delete('/delete_notification/{id}', 'NotificationController@destroy')->name('delete_notification');
    // Images
    Route::get('images', 'ImageController@index');
    Route::get('/add_image', 'ImageController@create');
    Route::post('/add_image', 'ImageController@store')->name('store_image');
    Route::get('/edit_image/{id}', 'ImageController@edit')->name('edit_image');
    Route::post('/edit_image/{id}', 'ImageController@update')->name('update_image');
    Route::delete('/delete_image/{id}', 'ImageController@destroy')->name('delete_image');
    // Interests
    Route::get('interests', 'InterestController@index');
    Route::get('/add_interest', 'InterestController@create');
    Route::post('/add_interest', 'InterestController@store')->name('store_interest');
    Route::get('/edit_interest/{id}', 'InterestController@edit')->name('edit_interest');
    Route::post('/edit_interest/{id}', 'InterestController@update')->name('update_interest');
    Route::delete('/delete_interest/{id}', 'InterestController@destroy')->name('delete_interest');
    // Reservations
    Route::get('reserve_hospital/{id}', 'ReservationController@hospital')->name('hospital_reserve');
    Route::get('reserve_clinic/{id}', 'ReservationController@clinic')->name('clinic_reserve');
    Route::get('reserve_restaurant/{id}', 'ReservationController@restaurant')->name('restaurant_reserve');
    Route::get('reserve_catering/{id}', 'ReservationController@catering')->name('catering_reserve');
    Route::get('show_reserve_hospital/{id}', 'ReservationController@showReserveHospital')->name('hospital_show');
    Route::get('show_reserve_clinic/{id}', 'ReservationController@showReserveClinic')->name('clinic_show');
    Route::get('show_reserve_restaurant/{id}', 'ReservationController@showReserveRestaurant')->name('restaurant_show');
    Route::get('show_reserve_catering/{id}', 'ReservationController@showReserveCatering')->name('catering_show');
    Route::post('reserve_notify', 'ReservationController@reserve_notify')->name('reserve_notify');
    Route::get('reserve_count', 'ReservationController@reserve_count')->name('reserve_count');
    // Admin Controll
    Route::get('/edit_profile/{id}', 'AdminLoginController@editProfile')->name('edit_profile');
    Route::post('/edit_profile/{id}', 'AdminLoginController@updateProfile')->name('update_profile');
    Route::get('/edit_hospital_admin', 'HospitalController@editAdmin')->name('edit_hospital_admin');
    Route::get('/edit_clinic_admin', 'ClinicController@editAdmin')->name('edit_clinic_admin');
    Route::get('/edit_restaurant_admin', 'RestaurantController@editAdmin')->name('edit_restaurant_admin');
    Route::get('/edit_catering_admin', 'CateringController@editAdmin')->name('edit_catering_admin');
    Route::get('reserve_hospital_admin', 'ReservationController@hospitalAdmin')->name('hospital_reserve_admin');
    Route::get('reserve_clinic_admin', 'ReservationController@clinicAdmin')->name('clinic_reserve_admin');
    Route::get('reserve_restaurant_admin', 'ReservationController@restaurantAdmin')->name('restaurant_reserve_admin');
    Route::get('reserve_catering_admin', 'ReservationController@cateringAdmin')->name('catering_reserve_admin');
    Route::post('status/{id}', 'ReservationController@updateState')->name('status');
    // contact us 
    Route::get('contact', 'ContactController@index');
    Route::post('contact', 'ContactController@store')->name('store_contact');
    Route::get('contacts', 'ContactController@showAll')->name('contacts');
    Route::post('contact_notify', 'ContactController@contact_notify')->name('contact_notify');
    Route::get('get_contact', 'ContactController@getContacts')->name('contact_count');
    Route::delete('contact_delete/{id}', 'ContactController@destroy')->name('contact_delete');
    // rates
    Route::get('rates', 'RateController@index');
    Route::delete('rate_delete/{id}', 'RateController@destroy')->name('rate_delete');
    // Insurance
    Route::get('insurances', 'InsuranceController@index');
    Route::get('/add_insurance', 'InsuranceController@create');
    Route::post('/add_insurance', 'InsuranceController@store')->name('store_insurance');
    Route::get('/edit_insurance/{id}', 'InsuranceController@edit')->name('edit_insurance');
    Route::post('/edit_insurance/{id}', 'InsuranceController@update')->name('update_insurance');
    Route::delete('/delete_insurance/{id}', 'InsuranceController@destroy')->name('delete_insurance');
    // Countries
    Route::get('countries', 'CountryController@index');
    Route::get('/add_country', 'CountryController@create')->name('create_country');
    Route::post('/add_country', 'CountryController@store')->name('store_country');
    Route::get('/edit_country/{id}', 'CountryController@edit')->name('edit_country');
    Route::post('/edit_country/{id}', 'CountryController@update')->name('update_country');
    Route::delete('/delete_country/{id}', 'CountryController@destroy')->name('delete_country');
    // Cities
    Route::get('cities', 'CityController@index');
    Route::get('/add_city', 'CityController@create')->name('create_city');
    Route::post('/add_city', 'CityController@store')->name('store_city');
    Route::get('/edit_city/{id}', 'CityController@edit')->name('edit_city');
    Route::post('/edit_city/{id}', 'CityController@update')->name('update_city');
    Route::delete('/delete_city/{id}', 'CityController@destroy')->name('delete_city');
    // Admin User
    // Route::get('/administrations', 'AdministrationController@index');
    // // Route::get('/administration_create/{id}', 'AdministrationController@create');
    // // Route::post('/administration', 'AdministrationController@store')->name('store_administration');
    // Route::get('/administration/{id}', 'AdministrationController@edit')->name('edit_administration');
    // Route::post('/administration/{id}', 'AdministrationController@update')->name('update_administration');
    // Route::delete('/administration_delete/{id}', 'AdministrationController@destroy')->name('delete_administration');
    
    // Cron Job 
    // Route::get('/crons', 'CronJobController@cron')->name('cron_job');
});

// Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class CouponController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $coupons = DB::table('coupons')
            ->select('coupon_id as id', 'coupon_name as name', 'coupon_discount as discount')
            ->orderBy('coupon_id', 'desc')
            ->get();
            
        foreach($coupons as $coupon){
            $uses = DB::table('reserve_catering')->where('reserve_catering_coupon_code', '=', $coupon->name)->count();
            $coupon->uses = $uses;
        }
        
        return view('superAdmin.coupons.index', compact('coupons'));
    }

    public function create(){
        return view('superAdmin.coupons.create');
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        $check = DB::table('coupons')->where('coupon_name', '=', $request->coupon_name)->count();
        
        if($check > 0) {
            $error = 'This Coupon is Exist';
            return Redirect::back()->with('error', $error);
        } else {
            $coupon = DB::table('coupons')
            ->insert([
                'coupon_name' => $request->coupon_name,
                'coupon_discount' => $request->coupon_discount
            ]);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $coupons = DB::table('coupons')
            ->select('coupon_id as id', 'coupon_name as name', 'coupon_discount as discount')
            ->where('coupon_id', '=', $id)
            ->first();

        return view('superAdmin.coupons.edit', compact('coupons'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        $check = DB::table('coupons')->where('coupon_name', '=', $request->coupon_name)->where('coupon_id', '!=', $id)->count();
        
        if($check > 0) {
            $error = 'This Coupon is Exist';
            return Redirect::back()->with('error', $error);
        } else {
            $coupons = DB::table('coupons')
            ->where('coupon_id', '=', $id)
            ->update([
                'coupon_name' => $request->coupon_name,
                'coupon_discount' => $request->coupon_discount
            ]);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $coupon = DB::table('coupons')
            ->where('coupon_id', '=', $id)
            ->delete();
        
        $allCoupon = DB::table('coupons')
            ->select('coupon_id as id', 'coupon_name as name', 'coupon_discount as discount')
            ->orderBy('coupon_id', 'desc')
            ->get();
            
        foreach($allCoupon as $coupon){
            $uses = DB::table('reserve_catering')->where('reserve_catering_coupon_code', '=', $coupon->name)->count();
            $coupon->uses = $uses;
        }
        
        return response()->json($allCoupon);
    }
    
    public function addCoupon(Request $request) {
        $validator = validator()->make($request->all(), [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            $arr=array('status' => '0', 'data' => [], 'message' => $error);
            return response()->json($arr);
        }
        
        $check = DB::table('coupons')->where('coupon_name', '=', $request->coupon_name)->count();
        
        if($check > 0) {
            $error = trans('admin.This Coupon is Exist');
            $arr=array('status'=>'0','data'=>[], 'message' => $error);
        } else {
            $coupon = DB::table('coupons')
                ->insert([
                    'coupon_name' => $request->coupon_name,
                    'coupon_discount' => $request->coupon_discount
                ]);
                $allCoupon = DB::table('coupons')
                ->select('coupon_id as id', 'coupon_name as name', 'coupon_discount as discount')
                ->orderBy('coupon_id', 'desc')
                ->get();
                
            foreach($allCoupon as $coupon){
                $uses = DB::table('reserve_catering')->where('reserve_catering_coupon_code', '=', $coupon->name)->count();
                $coupon->uses = $uses;
            }
            $arr=array('status'=>'1','data'=>$allCoupon);
        }
        return response()->json($arr);
    }
    
    public function getCoupon(Request $request) {
        $coupon = DB::table('coupons')->where('coupon_id', '=', $request->id)->first();
        return response()->json($coupon);
    }
    
    public function updateCoupon(Request $request) {
        $validator = validator()->make($request->all(), [
            'coupon_name' => 'required',
            'coupon_discount' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            $arr=array('status' => '0', 'data' => [], 'message' => $error);
            return response()->json($arr);
        }
        
        $check = DB::table('coupons')->where('coupon_name', '=', $request->coupon_name)->where('coupon_id', '!=', $request->id)->count();
        
        if($check > 0) {
            $error = trans('admin.This Coupon is Exist');
            $arr=array('status'=>'0','data'=>[], 'message' => $error);
        } else {
            $updateCoupon = DB::table('coupons')->where('coupon_id', '=', $request->id)->update([
                'coupon_name' => $request->coupon_name,
                'coupon_discount' => $request->coupon_discount
            ]);
            
            $allCoupon = DB::table('coupons')
                ->select('coupon_id as id', 'coupon_name as name', 'coupon_discount as discount')
                ->orderBy('coupon_id', 'desc')
                ->get();
                
            foreach($allCoupon as $coupon){
                $uses = DB::table('reserve_catering')->where('reserve_catering_coupon_code', '=', $coupon->name)->count();
                $coupon->uses = $uses;
            }
            
            $arr=array('status'=>'1','data'=>$allCoupon);
        }
        
        return response()->json($arr);
    }
}

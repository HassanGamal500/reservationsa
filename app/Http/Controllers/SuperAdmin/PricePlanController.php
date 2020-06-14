<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class PricePlanController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5 && auth()->guard('admin')->user()->type != 4){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $type_id = auth()->guard('admin')->user()->type_id;
        $prices = DB::table('catering')
            ->join('price_plan', 'price_plan.catering_id', '=', 'catering.catering_id')
            ->join('price_plan_description', 'price_plan_description.price_plan_id', '=', 'price_plan.price_plan_id')
            ->select('price_plan.price_plan_id as id', 'price', 'price_plan_description_name as name', 'price_plan.active',
                'price_plan_description_part as description_part')
            ->where('language_id', '=', language())
            ->where('catering.catering_id', '=', $type_id)
            ->orderBy('price_plan.price_plan_id', 'desc')
            ->get();
        return view('superAdmin.prices.index', compact('prices'));
    }

    public function show($id){
        $prices = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->join('price_plan', 'price_plan.catering_id', '=', 'catering.catering_id')
            ->join('price_plan_description', 'price_plan_description.price_plan_id', '=', 'price_plan.price_plan_id')
            ->select('price_plan.price_plan_id as id', 'price', 'price_plan_description_name as name', 'catering_name', 'price_plan.active',
                'price_plan_description_part as description_part')
            ->where('catering_description.language_id', '=', language())
            ->where('price_plan_description.language_id', '=', language())
            ->where('catering.catering_id', '=', $id)
            ->orderBy('price_plan.price_plan_id', 'desc')
            ->get();
            
        $catering_name = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->where('catering.catering_id', '=', $id)
            ->where('language_id', '=', language())
            ->first();
            
        return view('superAdmin.prices.index', compact('prices', 'catering_name'));
    }

    public function create(){
        $caterings = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->select('catering.catering_id as id', 'catering_name as name')
            ->where('language_id', '=', language())
            ->get();
        return view('superAdmin.prices.create', compact('caterings'));
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'price_plan_description_name' => 'required',
            'price' => 'required',
            'price_plan_description_part' => 'required',
            'catering_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->price_plan_description_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->price_plan_description_part[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_part[2])) {
            $prices = DB::table('price_plan')
                ->insertGetId([
                    'price' => $request->price,
                    'catering_id' => $request->catering_id
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('price_plan_description')
                    ->insert([
                        'price_plan_description_name' => $request->price_plan_description_name[$i],
                        'price_plan_description_part' => $request->price_plan_description_part[$i],
                        'language_id' => $i,
                        'price_plan_id' => $prices
                    ]);
            }
        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_part[1])) {
                $error = trans('admin.name or description part must be contain only english characters');
            } else {
                $error = trans('admin.name or description part must be contain only arabic characters');
            } 
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $caterings = DB::table('catering')
            ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
            ->select('catering.catering_id as id', 'catering_name as name')
            ->where('language_id', '=', language())
            ->get();

        $prices = DB::table('price_plan')
            ->join('price_plan_description','price_plan_description.price_plan_id', '=', 'price_plan.price_plan_id')
            ->select('price_plan.price_plan_id as id', 'price', 'catering_id', 'active',
                'price_plan_description_name as name', 'price_plan_description_part as description_part')
            ->where('price_plan.price_plan_id', '=', $id)
            ->get();

        return view('superAdmin.prices.edit', compact('prices','caterings'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'price_plan_description_name' => 'required',
            'price' => 'required',
            'price_plan_description_part' => 'required',
            'catering_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        if(preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->price_plan_description_name[1])
        && preg_match("/^[A-Za-z0-9_.,{}@#!~%()-<>\s].*[A-Za-z0-9_.,{}@#!~%()-<>\s]+$/", $request->price_plan_description_part[1])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_name[2])
        && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_part[2])) {
            $prices = DB::table('price_plan')
                ->where('price_plan_id', '=', $id)
                ->update([
                    'price' => $request->price,
                    'catering_id' => $request->catering_id
                ]);
    
            for ($i = 1; $i <= 2; $i++){
                $description = DB::table('price_plan_description')
                    ->where('price_plan_id', '=', $id)
                    ->where('language_id', '=', $i)
                    ->update([
                        'price_plan_description_name' => $request->price_plan_description_name[$i],
                        'price_plan_description_part' => $request->price_plan_description_part[$i],
                    ]);
            }
            
            if ($request->active == 1) {
                $prices = DB::table('price_plan')
                    ->where('price_plan_id', '=', $id)
                    ->update(['active' => $request->active]);
            } else {
                $prices = DB::table('price_plan')
                    ->where('price_plan_id', '=', $id)
                    ->update(['active' => $request->active]);
            }
        } else {
            if(!preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_name[1]) && !preg_match("/^[A-Za-z].*[A-Za-z]+$/", $request->price_plan_description_part[1])) {
                $error = trans('admin.name or description part must be contain only english characters');
            } else {
                $error = trans('admin.name or description part must be contain only arabic characters');
            } 
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $hospitals = DB::table('price_plan')
            ->where('price_plan_id', '=', $id)
            ->delete();
        return 1;
    }
}

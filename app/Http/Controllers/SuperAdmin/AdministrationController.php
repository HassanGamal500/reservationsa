<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class AdministrationController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 5){
                return redirect('/permission');
            }
            return $next($request);
        })->except('getToken', 'type');
    }
    
    public function index(){
        $users = DB::table('administration')
            ->select('id', 'name', 'phone', 'email', 'image')
            // ->where('type', '=', $id)
            ->orderBy('id', 'desc')
            ->get();
            
        // $type = $id;
        return view('superAdmin.administration.index', compact('users'));
    }

    public function create($id){
        if($id == 1){
            $select = DB::table('hospitals')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
                ->select('hospitals.hospital_id as id', 'hospital_name as name')
                ->where('language_id', '=', language())
                ->get();
            $type = $id;
        } elseif($id == 2) {
            $select = DB::table('clinics')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                ->select('clinics.clinic_id as id', 'clinic_name as name')
                ->where('language_id', '=', language())
                ->get();
            $type = $id;
        } elseif($id == 3) {
            $select = DB::table('restaurants')
                ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
                ->select('restaurants.restaurant_id as id', 'restaurant_name as name')
                ->where('language_id', '=', language())
                ->get();
            $type = $id;
        } else {
            $select = DB::table('catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
                ->select('catering.catering_id as id', 'catering_name as name')
                ->where('language_id', '=', language())
                ->get();
            $type = $id;
        }
        // dd($select);
        return view('superAdmin.administration.create', compact('select', 'type'));
    }

    public function store(Request $request){

        $validator = validator()->make($request->all(), [
            'name' => 'required',
            'phone' => 'required|unique:users',
            'email' => 'required|unique:users|email',
            'password' => 'required|min:8',
            'image' => 'required|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'type_id' => 'required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }

        if ($request->hasFile('image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/admin', $request->file('image'));
        } else {
            $imageName = 'images/user/avatar_user.png';
        }

        $users = DB::table('administration')
            ->insert([
                'name' => $request->name,
                'phone' => $request->phone,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'image' => $imageName,
                'type' => $request->type,
                'type_id' => $request->type_id
            ]);

        $message = session()->get('locale') == 'ar' ? 'تم التسجيل بنجاح' : 'Inserted Successfully';

        return Redirect::back()->with('message', $message);

    }

    public function edit($id){
        $users = DB::table('administration')
            ->select('id', 'name', 'phone', 'email', 'image', 'type', 'type_id')
            ->where('id', '=', $id)
            ->first();
        
        if($users->type == 1){
            $select = DB::table('hospitals')
                ->join('hospital_description', 'hospital_description.hospital_id', '=', 'hospitals.hospital_id')
                ->select('hospitals.hospital_id as id', 'hospital_name as name')
                ->where('language_id', '=', language())
                ->get();
        } elseif($users->type == 2) {
            $select = DB::table('clinics')
                ->join('clinic_description', 'clinic_description.clinic_id', '=', 'clinics.clinic_id')
                ->select('clinics.clinic_id as id', 'clinic_name as name')
                ->where('language_id', '=', language())
                ->get();
        } elseif($users->type == 3) {
            $select = DB::table('restaurants')
                ->join('restaurant_description', 'restaurant_description.restaurant_id', '=', 'restaurants.restaurant_id')
                ->select('restaurants.restaurant_id as id', 'restaurant_name as name')
                ->where('language_id', '=', language())
                ->get();
        } else {
            $select = DB::table('catering')
                ->join('catering_description', 'catering_description.catering_id', '=', 'catering.catering_id')
                ->select('catering.catering_id as id', 'catering_name as name')
                ->where('language_id', '=', language())
                ->get();
        }
        
        return view('superAdmin.administration.edit', compact('users', 'select'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'phone' => 'required',
            'email' => 'required|email',
            'password' => 'nullable',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
            'type_id' => 'nullable'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }

        // $getUser=User::find($id);
        // $allPhone = User::where('phone', $request->phone)->where('id', '!=', $id)->first();
        // $allEmail = User::where('email', $request->email)->where('id', '!=', $id)->first();
        
        $getUser = DB::table('administration')->where('id', '=', $id)->first();
        $allPhone = DB::table('administration')->where('phone', '=', '$request->phone')->where('id', '!=', $id)->first();
        $allEmail = DB::table('administration')->where('email', '=', $request->email)->where('id', '!=', $id)->first();

        $users = DB::table('administration')
            ->where('id', '=', $id)
            ->update([
                'name' => $request->name,
                'type_id' => $request->type_id
                ]);

        if ($allPhone) {
            $error = 'This phone has been taken before';
            return Redirect::back()->with('error', $error);
        } else {
            $users = DB::table('administration')
                ->where('id', '=', $id)
                ->update(['phone' => $request->phone]);
        }

        if ($allEmail) {
            $error = 'This Email has been taken before';
            return Redirect::back()->with('error', $error);
        } else {
            $users = DB::table('administration')
                ->where('id', '=', $id)
                ->update(['email' => $request->email]);
        }

        if ($request->password) {
            $users = DB::table('administration')
                ->where('id', '=', $id)
                ->update(['password' => bcrypt($request->password),]);
        }

        if ($request->hasFile('image')) {
            $imageName = Storage::disk('edit_path')->putFile('images/admin', $request->file('image'));

            $users = DB::table('administration')
                ->where('id', '=', $id)
                ->update(['image' => $imageName]);
        }

        $message = session()->get('locale') == 'ar' ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy(Request $request, $id){
        $users = DB::table('administration')
            ->where('id', '=', $id)
            ->delete();
//        return redirect(route('all_users'));
    }
    
    public function getToken(Request $request){
        $auth = auth()->guard('admin')->user()->id;
        $insertToken = DB::table('administration')->where('id', '=', $auth)->update(['token' => $request->token]);
        return response()->json($insertToken);
    }
    
    public function type(Request $request){
        $auth = auth()->guard('admin')->user()->type;
        if($auth == 5) { $type = 1; } else { $type = 2; };
        return response()->json($type);
    }

}

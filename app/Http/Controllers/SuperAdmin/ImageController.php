<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;


class ImageController extends Controller
{
    protected $user;
    
    public function __construct(){
        $this->middleware(function ($request, $next) {
            $this->user = auth()->guard('admin')->user()->type;
            if(auth()->guard('admin')->user()->type != 1 && auth()->guard('admin')->user()->type != 2 && auth()->guard('admin')->user()->type != 3 && auth()->guard('admin')->user()->type != 4){
                return redirect('/permission');
            }
            return $next($request);
        });
    }
    
    public function index(){
        $images = DB::table('images')
            ->select('image_id as id', 'image')
            ->where('type', '=', auth()->guard('admin')->user()->type)
            ->where('type_id', '=', auth()->guard('admin')->user()->type_id)
            ->orderBy('image_id', 'desc')
            ->get();
        
        return view('superAdmin.images.index', compact('images'));
    }

    public function create(){
        return view('superAdmin.images.create');
    }

    public function store(Request $request){
        $validator = validator()->make($request->all(), [
            'image' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->withInput($request->all())->with('error', $error);
        }
        // dd($request->image);
        $type_id = auth()->guard('admin')->user()->type_id;
        if(auth()->guard('admin')->user()->type == 1){
            if ($request->hasFile('image')) {
                foreach($request->image as $image) {
                    $imageName = Storage::disk('edit_path')->putFile('images/hospital', $image);
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 1, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            } else {
                foreach($request->image as $image) {
                    $imageName = 'images/hospital/avatar_hospital.png';
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 1, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            }
        } elseif (auth()->guard('admin')->user()->type == 2){
            if ($request->hasFile('image')) {
                foreach($request->image as $image) {
                    $imageName = Storage::disk('edit_path')->putFile('images/clinic', $image);
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 2, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            } else {
                foreach($request->image as $image) {
                    $imageName = 'images/clinic/avatar_clinic.jpg';
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 2, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            }
        } elseif (auth()->guard('admin')->user()->type == 3) {
            if ($request->hasFile('image')) {
                foreach($request->image as $image) {
                    $imageName = Storage::disk('edit_path')->putFile('images/restaurant', $image);
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 3, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            } else {
                foreach($request->image as $image) {
                    $imageName = 'images/restaurant/avatar_restaurant.png';
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 3, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            }
        } else {
            if ($request->hasFile('image')) {
                foreach($request->image as $image) {
                    $imageName = Storage::disk('edit_path')->putFile('images/catering', $image);
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 4, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            } else {
                foreach($request->image as $image) {
                    $imageName = 'images/catering/avatar_catering.jpg';
                    $img = DB::table('images')->insert(['image' => $imageName, 'type' => 4, 'type_id' => auth()->guard('admin')->user()->type_id]);
                }
            }
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function edit($id){
        $image = DB::table('images')
            ->select('image_id as id', 'image')
            ->where('image_id', '=', $id)
            ->first();

        return view('superAdmin.images.edit', compact('image'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'image' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }
        
        $getImage = DB::table('images')->where('image_id', '=', $id)->select('image')->first();
        $image = $request->image;
        if(auth()->guard('admin')->user()->type == 1){
            if ($request->hasFile('image')) {
                if($getImage->image != 'images/hospital/avatar_hospital.png'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/hospital', $image);
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            }
        } elseif (auth()->guard('admin')->user()->type == 2){
            if ($request->hasFile('image')) {
                if($getImage->image != 'images/clinic/avatar_clinic.jpg'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/clinic', $image);
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            }
        } elseif (auth()->guard('admin')->user()->type == 3) {
            if ($request->hasFile('image')) {
                if($getImage->image != 'images/restaurant/avatar_restaurant.png'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/restaurant', $image);
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            }
        } else {
            if ($request->hasFile('image')) {
                if($getImage->image != 'images/catering/avatar_catering.png'){
                    $myFile = base_path($getImage->image);
                    File::delete($myFile);
                }
                $imageName = Storage::disk('edit_path')->putFile('images/catering', $image);
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            } else {
                $imageName = $request->old_image;
                $img = DB::table('images')->where('image_id', '=', $id)->update(['image' => $imageName]);
            }
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $getImage = DB::table('images')->where('image_id', '=', $id)->select('image')->first();
        if($getImage->image != 'images/user/avatar_hospital.png' || 'images/user/avatar_clinic.jpg' || 'images/user/avatar_restaurant.png' || 'images/user/avatar_catering.jpg'){
            $myFile = base_path($getImage->image);
            File::delete($myFile);
        }
        $image = DB::table('images')
            ->where('image_id', '=', $id)
            ->delete();
    }
}

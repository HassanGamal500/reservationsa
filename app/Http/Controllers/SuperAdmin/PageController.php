<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class PageController extends Controller
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
        $pages = DB::table('pages')
            ->join('page_description', 'page_description.page_id', '=', 'pages.page_id')
            ->select('pages.page_id as id', 'page_description_name as name', 'page_description_content as content')
            ->where('language_id', '=', language())
            ->orderBy('pages.page_id', 'desc')
            ->get();
        return view('superAdmin.pages.index', compact('pages'));
    }

    // public function create(){
    //     return view('superAdmin.pages.create');
    // }

    // public function store(Request $request){
    //     $validator = validator()->make($request->all(), [
    //         'page_description_name' => 'required',
    //         'page_description_content' => 'required',
    //     ]);

    //     if ($validator->fails()) {
    //         $error = $validator->errors()->first();
    //         return Redirect::back()->withInput($request->all())->with('error', $error);
    //     }

    //     $page = DB::table('pages')->insertGetId(['page_id' => null]);

    //     for ($i = 1; $i <= 2; $i++){
    //         $description = DB::table('page_description')
    //             ->insert([
    //                 'page_description_name' => $request->page_description_name[$i],
    //                 'page_description_content' => $request->page_description_content[$i],
    //                 'language_id' => $i,
    //                 'page_id' => $page
    //             ]);
    //     }

    //     $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

    //     return Redirect::back()->with('message', $message);
    // }

    public function edit($id){
        $pages = DB::table('pages')
            ->join('page_description', 'page_description.page_id', '=', 'pages.page_id')
            ->select('pages.page_id as id', 'page_description_name as name', 'page_description_content as content')
            ->where('pages.page_id', '=', $id)
            ->get();

        return view('superAdmin.pages.edit', compact('pages'));
    }

    public function update(Request $request, $id){
        $validator = validator()->make($request->all(), [
            'page_description_name' => 'required',
            'page_description_content' => 'required',
        ]);

        if ($validator->fails()) {
            $error = $validator->errors()->first();
            return Redirect::back()->with('error', $error);
        }

        for ($i = 1; $i <= 2; $i++){
            $description = DB::table('page_description')
                ->where('page_id', '=', $id)
                ->where('language_id', '=', $i)
                ->update([
                    'page_description_name' => $request->page_description_name[$i],
                    'page_description_content' => $request->page_description_content[$i],
                ]);
        }

        $message = \App::isLocale('ar') ? 'تم التعديل بنجاح' : 'Updated Successfully';

        return Redirect::back()->with('message', $message);
    }

    public function destroy($id){
        $caterings = DB::table('pages')
            ->where('page_id', '=', $id)
            ->delete();
        return 1;
    }
}

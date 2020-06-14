<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class RateController extends Controller
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
        $type_id = auth()->guard('admin')->user()->type_id;
        if (auth()->guard('admin')->user()->type == 1) {
            $rates = DB::table('rates')
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id as id', 'name', 'rate_content as content', 'rate_star as star')
                ->where('type', '=', 1)
                ->where('type_id', '=', $type_id)
                ->orderBy('rate_id', 'desc')
                ->get();
        } elseif (auth()->guard('admin')->user()->type == 2) {
            $rates = DB::table('rates')
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id as id', 'name', 'rate_content as content', 'rate_star as star')
                ->where('type', '=', 2)
                ->where('type_id', '=', $type_id)
                ->orderBy('rate_id', 'desc')
                ->get();
        } elseif (auth()->guard('admin')->user()->type == 3) {
            $rates = DB::table('rates')
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id as id', 'name', 'rate_content as content', 'rate_star as star')
                ->where('type', '=', 3)
                ->where('type_id', '=', $type_id)
                ->orderBy('rate_id', 'desc')
                ->get();
        } else {
            $rates = DB::table('rates')
                ->join('users', 'users.id', '=', 'rates.user_id')
                ->select('rate_id as id', 'name', 'rate_content as content', 'rate_star as star')
                ->where('type', '=', 4)
                ->where('type_id', '=', $type_id)
                ->orderBy('rate_id', 'desc')
                ->get();
        }
        return view('superAdmin.rates.index', compact('rates'));
    }

    public function destroy(Request $request, $id){
        $users = DB::table('rates')
            ->where('rate_id', '=', $id)
            ->delete();
    }

}

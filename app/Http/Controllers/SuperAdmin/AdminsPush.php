<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminsPush extends Controller {
    public function send($tokens, $title, $body, $icon, $image, $action, $type='2'){
        $server_key = 'AAAAUGOL-GU:APA91bFnR4k9nqcVyfDzq6HG7A6q_u7n0G018cl-DGo3qmfNuPkZ5O67sEWexlnGg-obEfXOWFpG6T-BTWvDKzDBjsP9sY7LGRoNNzJ43oqeBm8bO4z2je49DKkZ-61L4KWZ3VjTANvZ';
        // $auth = auth()->guard('admin')->user()->id;
        // $getToken = DB::table('administration')->where('id', '=', 1)->select('token')->first();
        $token = $tokens;
        $header =[
            'Authorization: key=' .$server_key,
            'Content-Type: application/json'
        ];
        
        $msg=[
            'title'=> $title,
            'body' => $body,
            'icon' => $icon,
            'image' => 'https://reservationsa.com/beta/' . $image,
            'click_action' => 'https://reservationsa.com/beta/admin/' . $action
        ];
        
        // Example 
        // $msg=[
        //     'title'=>'Testing Notification',
        //     'body' =>'Notification from Reservation',
        //     'icon' =>'images/user/avatar_user.png',
        //     'image' =>'https://reservationsa.com/beta/images/user/avatar_user.png',
        //     'click_action' =>'https://reservationsa.com/beta/admin/',
        // ];
            
        $payload=[
            'registration_ids' => $token,
            'data'             => $msg
        ];
                
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://fcm.googleapis.com/fcm/send",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_HTTPHEADER =>$header
        ));
        
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        
        // if ($err) {
        //     echo "cURL Error #:" . $err;
        // } else {
        //     echo $response;
        // }
    }
}

?>
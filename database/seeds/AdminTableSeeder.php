<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('administration')->insert([
            'administration_name' => 'Hassan Gamal',
            'administration_email' => 'hassan.alex26@yahoo.com',
            'administration_phone' => '01272252219',
            'administration_image' => '/images/user/avatar_user.png',
            'administration_password' => bcrypt('123456789'),
            'administration_type' => 'SuperAdmin'
        ]);
    }
}

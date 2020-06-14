<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    //
    protected $table = 'languages';

    public function page_description()
    {
        return $this->hasMany('App\Model\PageDescription', 'language_id', 'language_id');
    }
}

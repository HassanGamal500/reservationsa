<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    protected $table = 'pages';

    public function page_description()
    {
        return $this->hasMany('App\Model\PageDescription', 'page_id', 'page_id');
    }

}

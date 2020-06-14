<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PageDescription extends Model
{
    protected $table = 'page_description';

    public function page()
    {
        return $this->belongsTo('App\Model\Page', 'page_id', 'page_id');
    }

    public function languages()
    {
        return $this->belongsToMany('App\Model\Language');
    }

}

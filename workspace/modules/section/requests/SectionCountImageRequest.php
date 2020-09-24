<?php


namespace workspace\modules\section\requests;


use core\Request;

class SectionCountImageRequest extends Request
{
    public $count_images;

    public function rules()
    {
        return [
            'count_images' => 'integer'
        ];
    }
}
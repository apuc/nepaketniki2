<?php


namespace workspace\modules\seo\requests;


use core\Request;

class SeoRequest extends Request
{
    public $title;
    public $keywords;
    public $description;
    public $page;

    public function rules()
    {
        return [
            'title' => 'max:255',
            'keywords' => 'max:255',
            'description' => 'max:255',
            'page' => 'max:255'
        ];
    }
}
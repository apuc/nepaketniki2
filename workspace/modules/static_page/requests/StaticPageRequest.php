<?php


namespace workspace\modules\static_page\requests;


use core\Request;

class StaticPageRequest extends Request
{
    public $name;
    public $slug;
    public $content;
    public $layout;
    public $view;
    public $status;
    public $title;
    public $keywords;
    public $description;


    public function rules()
    {
        return [
            'name' => 'required',
            'slug' => 'required',
            'layout' => 'max:255',
            'view' => 'max:255',
            'status' => 'required',
            'title' => 'max:255',
            'keywords' => 'max:255',
            'description' => 'max:255'
        ];
    }
}
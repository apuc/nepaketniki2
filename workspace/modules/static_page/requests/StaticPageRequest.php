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


    public function rules()
    {
        return [
            'name' => 'required',
            'slug' => 'required',
            'content' => 'max:255',
            'layout' => 'max:255',
            'view' => 'max:255',
            'status' => 'required'
        ];
    }
}
<?php


namespace workspace\modules\subscription\requests;


use core\Request;

class SubscriptionRequest extends Request
{
    public $name;
    public $phone;

    public function rules()
    {
        return [
            'name' => 'required|min:2|max:40',
            'phone' => 'required|max:16|min:3'
        ];
    }
}
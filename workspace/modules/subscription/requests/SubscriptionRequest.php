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
            'name' => 'required',
            'phone' => 'phone'
        ];
    }
}
<?php


namespace workspace\modules\reservation\requests;


use core\Request;

class ReservationRequests extends Request
{
    public $name;
    public $phone;
    public $email;

    public function rules()
    {
        return [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required'
        ];
    }
}
<?php


namespace workspace\modules\reservation\requests;


use core\Request;

class ReservationRequests extends Request
{
    public $tour_id;
    public $name;
    public $phone;
    public $email;
    public $updated_at;

    public function rules()
    {
        return [
            'tour_id' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'updated_at' => 'required'
        ];
    }
}
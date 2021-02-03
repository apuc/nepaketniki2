<?php

namespace workspace\modules\payments_tour\requests;

use core\Request;

class PaymentTourRequest extends Request
{
    public $tour_id;
    public $text;

    public function rules()
    {
        return [
            'tour_id' => 'required',
            'title' => 'required',
            'description' => 'required',
        ];
    }
}
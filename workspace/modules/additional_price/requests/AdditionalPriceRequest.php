<?php


namespace workspace\modules\additional_price\requests;


use core\Request;

class AdditionalPriceRequest extends Request
{
    public $tour_id;
    public $text;

    public function rules()
    {
        return [
            'tour_id' => 'required',
            'text' => 'required'
        ];
    }
}
<?php


namespace workspace\modules\date\requests;


use core\Request;

class DateRequest extends Request
{
    public $tour_id;
    public $tour_dates;
    public $remaining_places;

    public function rules()
    {
        return [
            'tour_id' => 'required',
            'tour_dates' => 'required',
            'remaining_places' => 'required',
        ];
    }
}
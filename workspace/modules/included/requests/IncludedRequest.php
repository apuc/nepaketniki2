<?php


namespace workspace\modules\included\requests;


use core\Request;

/**
 * Class RegistrationRequest
 * @package workspace\modules\included\requests
 * @property string $tour_id
 * @property string $text
 * @property string $column_side
== */
class IncludedRequest extends Request
{
    public $tour_id;
    public $column_side;
    public $text;

    public function rules()
    {
        return [
            'tour_id' => 'required',
            'column_side' => 'required',
            'text' => 'required',
        ];
    }
}
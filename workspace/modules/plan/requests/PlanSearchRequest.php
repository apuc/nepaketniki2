<?php

namespace workspace\modules\plan\requests;

use core\RequestSearch;


/**
 * Class RegistrationRequest
 * @package workspace\modules\order\requests
 * @property integer $tour_id
 * @property integer $day
 * @property string $date
 * @property string $info
 * @property string $description
 * @property string $images
 */
class PlanSearchRequest extends RequestSearch
{
    public $tour_id;
    public $day;
    public $date;
    public $info;
    public $description;
    public $images;


    public function rules()
    {
        return [
            'tour_id' => 'required',
            'day' => 'required|',
            'date' => 'required',
            'info' => 'required',
            'description' => 'required'
        ];
    }


}
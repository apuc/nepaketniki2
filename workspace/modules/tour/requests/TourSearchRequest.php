<?php


namespace workspace\modules\tour\requests;


use core\RequestSearch;

/**
 * Class TourSearchRequest
 * @package workspace\modules\tour\requests
 *
 * @property string $name
 * @property string $main_description
 * @property string $front_description
 * @property string $front_date
 * @property string $front_places_remaining
 * @property string $price
 * @property string $difficulties_and_weather
 * @property string $amount_of_places
 * @property string $reservation_title
 * @property string $visa
 * @property string $activities_title
 * @property string $image_id
 * @property string $img
 * @property string $title_image_id
 * @property string $title_img
 * @property string $bg_img
 */

class TourSearchRequest extends RequestSearch
{
    public $name;
    public $main_description;
    public $front_description;
    public $front_date;
    public $front_places_remaining;
    public $price;
    public $difficulties_and_weather;
    public $amount_of_places;
    public $reservation_title;
    public $visa;
    public $activities_title;
    public $image_id;
    public $img;
    public $title_image_id;
    public $title_img;
    public $bg_img;
    public $bg_image_id;
    public $amount_activities_items_1;
    public $amount_activities_items_2;


    public function rules()
    {
        return [
            'name' => 'required',
            'main_description' => 'required',
            'front_description' => 'required',
            'front_date' => 'required',
            'front_places_remaining' => 'required',
            'price' => 'required',
            'difficulties_and_weather' => 'required',
            'amount_of_places' => 'required',
            'reservation_title' => 'required',
            'visa' => 'required',
            'activities_title' => 'required',
            'image_id' => 'required',
            'title_image_id' => 'required',
            'bg_image_id' => 'required',
            'amount_activities_items_1' => 'required',
            'amount_activities_items_2' => 'required'
        ];
    }
}
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
 * @property string $image_id
 * @property string $img
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
    public $image_id;
    public $img;

    public function rules()
    {
        return [];
    }
}
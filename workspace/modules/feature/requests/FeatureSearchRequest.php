<?php


namespace workspace\modules\feature\requests;


use core\RequestSearch;

/**
 * Class FeatureSearchRequest
 * @package workspace\modules\feature\requests
 *
 * @property integer $tour_id
 * @property string $feature
 * @property string $type
 * @property string $_tour
 */
class FeatureSearchRequest extends RequestSearch
{
    public $tour_id;
    public $feature;
    public $type;
    public $_tour;

    public function rules()
    {
        return [];
    }
}
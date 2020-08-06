<?php


namespace workspace\modules\feature\requests;


use core\Request;

/**
 * Class FeatureSearchRequest
 * @package workspace\modules\feature\requests
 *
 * @property integer $tour_id
 * @property string $feature
 * @property string $type
 * @property string $_tour
 */
class FeatureRequest extends Request
{
    public $tour_id;
    public $feature;
    public $type;
    public $_tour;

    public function rules()
    {
        return [
            'feature' => 'required'
        ];
    }
}
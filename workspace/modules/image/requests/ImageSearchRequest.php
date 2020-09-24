<?php


namespace workspace\modules\image\requests;


use core\RequestSearch;

/**
 * Class ImageSearchRequest
 * @package workspace\modules\image\requests
 * @property string $image
 */
class ImageSearchRequest extends RequestSearch
{
    public $image;

    public function rules()
    {
        return [
            'image' => 'required'
        ];
    }
}
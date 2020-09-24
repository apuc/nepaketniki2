<?php


namespace workspace\modules\settings\requests;


use core\RequestSearch;

/**
 * Class SettingsSearchRequest
 * @package workspace\modules\settings\requests
 *
 * @property string $key
 * @property string $value
 * @property string $label
 */

class SettingsSearchRequest extends RequestSearch
{
    public $key;
    public $label;
    public $value;

    public function rules()
    {
        return [];
    }
}
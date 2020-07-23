<?php
namespace workspace\modules\admin_review_main_page\requests;

use core\Request;

/**
 * Class RegistrationRequest
 * @package workspace\modules\order\requests
 * @property string $name
 * @property string $instagramLinks
 * @property object $avatar
 * @property string $text
 */
class ReviewRequest extends Request
{
    public $name;
    public $instagramLinks;
    public $avatar;
    public $text;

    public function rules()
    {
        return [
            'name' => 'required',
            'instagramLinks' => 'required',
            'avatar' => 'required',
            'text' => 'required'
        ];
    }
}
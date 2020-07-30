<?php
namespace workspace\modules\admin_review_main_page\requests;

use core\Request;

/**
 * Class RegistrationRequest
 * @package workspace\modules\order\requests
 * @property string $name
 * @property string $instagram_link
 * @property object $avatar
 * @property string $text
 * @property integer $priority
 */

class ReviewRequest extends Request
{
    public $name;
    public $tour_id;
    public $avatar;
    public $text;
    public $instagram_link;
    public $priority;

    public function rules()
    {
        return [
            'name' => 'required',
            'tour_id' => 'required',
            'instagram_link' => 'required',
            'avatar' => 'required',
            'text' => 'required'
        ];
    }
}
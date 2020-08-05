<?php


namespace workspace\modules\business\requests;


use core\Request;

/**
 * Class BusinessRequest
 * @package workspace\modules\business\requests
 */
class BusinessRequest extends Request
{
    public $header;
    public $text_block_1;
    public $text_block_2;
    public $text_block_3;
    public $images = [];

    public function rules()
    {
        return [
            'header' => 'required|max:255',
            'text_block_1' => 'required',
            'text_block_2' => 'required',
            'text_block_3' => 'required',
        ];
    }
}
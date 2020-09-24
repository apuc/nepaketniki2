<?php


namespace workspace\modules\section\requests;


use core\Request;

class SectionRequest extends Request
{
    public $name;
    public $text;
    public $tour_id;
    public $images = [];
    public $priority;

    public function rules()
    {
        return [
            'name' => 'required|max:255',
            'text' => 'required',
            'tour_id' => 'required|integer',
            'priority' => 'integer',
        ];
    }
}
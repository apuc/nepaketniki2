<?php


namespace workspace\widgets\search_bar;


use core\Widget;

class SearchBarWidget extends Widget
{
    protected $value = '';
    public $viewPath = '/widgets/search_bar/views/';

    public function run()
    {
        return $this->view->getTpl('search_bar.tpl', ['value' => 'контактыNepaketniki']);
    }

    public function setValue($value)
    {
        $this->value = $value;
        return $this;
    }
}
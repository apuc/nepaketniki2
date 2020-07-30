<?php


namespace workspace\widgets\search_bar;


use core\Widget;

class SearchBarWidget extends Widget
{
    public $viewPath = '/widgets/search_bar/views/';

    public function run()
    {
        return $this->view->getTpl('search_bar.tpl');
    }

    public function setValue($value)
    {

    }
}
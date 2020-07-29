<?php


namespace workspace\modules\admin_review_main_page\widgets;


use core\Widget;

class Slider extends Widget
{
    public $viewPath = '/modules/admin_review_main_page/widgets/views/';

    public function run()
    {
        return $this->view->getTpl('slider.tpl');
    }
}
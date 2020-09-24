<?php


namespace workspace\modules\subscription\widgets;


use core\Widget;

class SubscriptionWidget extends Widget
{
    public $viewPath = '/modules/subscription/widgets/views/';

    public function run()
    {
        $this->regJs();
        return $this->view->getTpl('subscription.tpl');
    }

    protected function regJs()
    {
        $this->view->registerJs('/workspace/modules/subscription/src/js/handler_subscribe_form.js');
    }
}
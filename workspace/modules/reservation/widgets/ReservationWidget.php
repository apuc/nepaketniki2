<?php


namespace workspace\modules\reservation\widgets;


use core\Widget;

class ReservationWidget extends Widget
{
    public $viewPath = '/modules/reservation/widgets/views/';

    public function run()
    {
        //$this->regJs();
        return $this->view->getTpl('reservation.tpl');
    }

    protected function regJs()
    {
        $this->view->registerJs('/workspace/modules/reservation/src/js/handler_reserve_form.js', ['type' => 'text/javascript', 'charset' => 'utf-8'], true);
    }
}
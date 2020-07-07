<?php


namespace workspace\modules\reservation\controllers;


use core\App;
use core\Controller;

class ReservationController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Бронирование билетов');
        $this->viewPath = '/modules/reservation/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Reservation', 'url' => 'reservation']);
    }

    public function actionIndex()
    {
        return $this->render('reservation/index.tpl');
    }

    public function actionStore()
    {

    }

    public function actionView()
    {

    }

    public function actionEdit()
    {

    }
}
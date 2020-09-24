<?php


namespace workspace\modules\services\controllers;


use core\App;
use core\Controller;

class ServicesController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Услуги');
        $this->viewPath = '/modules/services/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Services', 'url' => 'services']);
    }

    public function actionIndex()
    {
        return $this->render('services/index.tpl');
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
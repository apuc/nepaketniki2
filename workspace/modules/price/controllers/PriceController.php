<?php


namespace workspace\modules\price\controllers;


use core\App;
use core\Controller;

class PriceController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Цены');
        $this->viewPath = '/modules/price/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Price', 'url' => 'price']);
    }

    public function actionIndex()
    {
        return $this->render('price/index.tpl');
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
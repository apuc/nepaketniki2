<?php


namespace workspace\modules\subscription\controllers;


use core\App;
use core\Controller;

class SubscriptionController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Подписки');
        $this->viewPath = '/modules/subscription/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Subscription', 'url' => 'subscription']);
    }

    public function actionIndex()
    {
        return $this->render('subscription/index.tpl');
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
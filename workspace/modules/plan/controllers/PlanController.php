<?php


namespace workspace\modules\plan\controllers;


use core\App;
use core\Controller;

class PlanController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Планы туров');
        $this->viewPath = '/modules/plan/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Plan', 'url' => 'plan']);
    }

    public function actionIndex()
    {
        return $this->render('plan/index.tpl');
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
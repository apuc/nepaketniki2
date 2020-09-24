<?php


namespace workspace\modules\review\controllers;


use core\App;
use core\Controller;

class ReviewController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Отзывы');
        $this->viewPath = '/modules/review/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Review', 'url' => 'review']);
    }

    public function actionIndex()
    {
        return $this->render('review/index.tpl');
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
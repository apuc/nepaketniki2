<?php


namespace workspace\modules\feature\controllers;


use core\App;
use core\Controller;

class FeatureController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Особенности тура');
        $this->viewPath = '/modules/feature/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Feature', 'url' => 'feature']);
    }

    public function actionIndex()
    {
        return $this->render('feature/index.tpl');
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
<?php


namespace workspace\modules\image\controllers;


use core\App;
use core\Controller;

class ImageController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Картинки');
        $this->viewPath = '/modules/image/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Image', 'url' => 'image']);
    }

    public function actionIndex()
    {
        return $this->render('image/index.tpl');
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
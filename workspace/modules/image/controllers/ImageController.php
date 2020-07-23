<?php


namespace workspace\modules\image\controllers;


use core\App;
use core\Controller;
use workspace\modules\image\models\Image;

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
        $model = Image::all();
        $options = [
            'serial' => '#',
            'fields' => [
                'img' => [
                    'label' => 'Картинка тура на главной странице',
                    'value' => function($model) {
                        return '<img src="../../../resources/images/' . $model->image . '" />';
                    }
                ],
            ],
            'baseUri' => 'image',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
        return $this->render('image/index.tpl', ['h1' => 'Картинки', 'models' => $model, 'options' => $options]);
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
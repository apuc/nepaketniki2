<?php


namespace workspace\modules\image\controllers;


use core\App;
use core\Controller;
use workspace\modules\image\models\Image;
use workspace\modules\image\requests\ImageSearchRequest;

class ImageController extends Controller
{
    public function actionIndex()
    {
        $model = Image::all();
        $options = [
            'serial' => '#',
            'fields' => [
                'img' => [
                    'label' => 'Картинка тура на главной странице',
                    'value' => function ($model) {
                        return '<img style="max-width:18em; max-height:18em" src="' . $model->image . '" />';
                    }
                ],
            ],
            'baseUri' => 'image',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
        return $this->render('image/index.tpl', ['h1' => 'Картинки', 'model' => $model, 'options' => $options]);
    }

    public function actionStore()
    {
        $request = new ImageSearchRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new Image();
            $model->image = '/resources/' . $request->image;
            $model->save();
            $this->redirect('admin/image');

        } else {
            return $this->render('image/store.tpl', ['h1' => 'Создать: ', 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionView($id)
    {
        $model = Image::where('id', $id)->first();
        return $this->render('image/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    private function getOptions()
    {
        return [
            'serial' => '#',
            'fields' => [
                'img' => [
                    'label' => 'Картинка тура на главной странице',
                    'value' => function ($model) {
                        return '<img style="max-width:18em; max-height:18em" src="' . $model->image . '" />';
                    }
                ],
            ],
            'baseUri' => 'image',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
    }

    public function actionEdit($id)
    {
        $request = new ImageSearchRequest();
        $model = Image::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->image = '/resources/' . $request->image;
            $model->save();
            $this->redirect('admin/image');

        } else {
            return $this->render('image/edit.tpl', ['h1' => 'Редактировать: ', 'errors' => $request->getMessagesArray(), 'model' => $model]);
        }
    }

    public function actionDelete()
    {
        Image::destroy($_POST['id']);
        $this->redirect('admin/image');
    }

    protected function init()
    {
        $this->view->setTitle('Картинки');
        $this->viewPath = '/modules/image/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Картинки', 'url' => 'image']);
    }
}
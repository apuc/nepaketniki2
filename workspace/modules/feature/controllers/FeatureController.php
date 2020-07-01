<?php


namespace workspace\modules\feature\controllers;


use core\App;
use core\Controller;
use core\Debug;
use workspace\modules\feature\models\Feature;
use workspace\modules\feature\requests\FeatureSearchRequest;
use workspace\modules\tour\models\Tour;

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
        $request = new FeatureSearchRequest();
        $model = Feature::search($request);

        $options = [
            'serial' => '#',
            'fields' => [
                '_tour' => [
                    'label' => 'Тур',
                    'value' => function($model) {
                        return $model->tour->name . ' ' . $model->tour->price;
                    }
                ],
                'feature' => 'Особенность',
                'type' => 'Тип',
            ],
            'baseUri' => 'feature',
            'pagination' => [
                'per_page' => 20,
            ],
        ];
        return $this->render('feature/index.tpl', ['h1' => 'Особенности', 'model' => $model, 'options' => $options]);
    }

    public function actionStore()
    {
        if(isset($_POST['feature'])) {
            $model = new Feature();

            $model->feature = $_POST['feature'];
            if(isset($_POST['tour_id']))
                $model->tour_id = $_POST['tour_id'];
            if(isset($_POST['type']))
                $model->type = $_POST['type'];

            $model->save();

            $this->redirect('admin/feature');
        } else {
            $tours = Tour::all();

            return $this->render('feature/store.tpl', ['tours' => $tours]);
        }
    }

    public function actionView()
    {

    }

    public function actionEdit($id)
    {
        $model = Feature::where('id', $id)->first();

        if(isset($_POST['feature'])) {
            $model->feature = $_POST['feature'];
            if(isset($_POST['tour_id']))
                $model->tour_id = $_POST['tour_id'];
            if(isset($_POST['type']))
                $model->type = $_POST['type'];

            $model->save();

            $this->redirect('admin/feature');
        } else {
            $tours = Tour::all();

            return $this->render('feature/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'tours' => $tours]);
        }
    }
}
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
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Особенности тура', 'url' => 'feature']);
    }

    public function actionIndex()
    {
        $request = new FeatureSearchRequest();
        $model = Feature::search($request);

        return $this->render('feature/index.tpl', ['h1' => 'Особенности', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        if(isset($_POST['feature'])) {
            $model = new Feature();
            $model->_save();

            $this->redirect('admin/feature');
        } else {
            $tours = Tour::all();

            return $this->render('feature/store.tpl', ['tours' => $tours]);
        }
    }

    public function actionView($id)
    {
        $model = Feature::where('id', $id)->first();

        return $this->render('feature/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $model = Feature::where('id', $id)->first();

        if(isset($_POST['feature'])) {
            $model->_save();

            $this->redirect('admin/feature');
        } else {
            $tours = Tour::all();

            return $this->render('feature/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'tours' => $tours]);
        }
    }

    public function actionDelete()
    {
        Feature::destroy($_POST['id']);
        $this->redirect('admin/feature');
    }

    public function getOptions()
    {
       return [
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
    }
}
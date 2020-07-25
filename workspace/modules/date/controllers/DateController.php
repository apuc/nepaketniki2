<?php


namespace workspace\modules\date\controllers;


use core\App;
use core\Controller;
use core\Debug;
use workspace\modules\date\models\Date;
use workspace\modules\tour\models\Tour;

class DateController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Даты');
        $this->viewPath = '/modules/date/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Date', 'url' => 'date']);
    }

    public function actionIndex()
    {
        $model = Date::all();

        return $this->render('date/index.tpl', ['h1' => 'Даты', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        if(isset($_POST['dates'])) {
            $model = new Date();
            $model->_save();

            $this->redirect('admin/date');
        } else {
            $tours = Tour::all();

            return $this->render('date/store.tpl', ['tours' => $tours]);
        }
    }

    public function actionView($id)
    {
        $model = Date::where('id', $id)->first();

        return $this->render('date/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $model = Date::where('id', $id)->first();

        if(isset($_POST['dates'])) {
            $model->_save();

            $this->redirect('admin/date');
        } else {
            $tours = Tour::all();

            return $this->render('date/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'tours' => $tours]);
        }
    }

    public function actionDelete()
    {
        Date::destroy($_POST['id']);
        $this->redirect('admin/date');
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
                'dates' => 'Даты',
                'remaining_places' => 'Оставшиеся места',
            ],
            'baseUri' => 'date',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
    }
}
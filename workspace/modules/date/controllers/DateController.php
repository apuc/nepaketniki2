<?php


namespace workspace\modules\date\controllers;


use core\App;
use core\Controller;
use workspace\modules\date\models\Date;
use workspace\modules\date\requests\DateRequest;
use workspace\modules\tour\models\Tour;

class DateController extends Controller
{
    public function actionIndex()
    {
        $model = Date::get();

        return $this->render('date/index.tpl', ['h1' => 'Даты', 'models' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'fields' => [
                '_tour' => [
                    'label' => 'Тур',
                    'value' => function ($model) {
                        return $model->tour->name . ' ' . $model->tour->price;
                    }
                ],
                'tour_dates' => 'Даты',
                'remaining_places' => 'Оставшиеся места',
            ],
            'baseUri' => '/admin/date',
            'pagination' => [
                'per_page' => 15,
            ],
            'filters' => false
        ];
    }

    public function actionStore()
    {
        $request = new DateRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new Date();
            $model->_save($request);

            $this->redirect('admin/date');
        } else {
            $tours = Tour::all();

            return $this->render('date/store.tpl', ['tours' => $tours, 'errors' => $request->getMessagesArray()]);
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
        $request = new DateRequest();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

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

    protected function init()
    {
        $this->view->setTitle('Даты');
        $this->viewPath = '/modules/date/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Даты', 'url' => 'admin/date']);
    }
}
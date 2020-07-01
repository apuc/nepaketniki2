<?php


namespace workspace\modules\date\controllers;


use core\App;
use core\Controller;
use workspace\modules\date\models\Date;

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
        $options = [
            'serial' => '#',
            'fields' => [
                'tour_id' => 'Тур',
                'dates' => 'Даты',
                'remaining_places' => 'Оставшиеся места',
            ],
            'baseUri' => 'date',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
        return $this->render('date/index.tpl', ['h1' => 'Даты', 'model' => $model, 'options' => $options]);
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
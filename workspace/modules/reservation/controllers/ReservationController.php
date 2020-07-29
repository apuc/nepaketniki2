<?php


namespace workspace\modules\reservation\controllers;


use core\App;
use core\Controller;
use workspace\modules\reservation\models\ReservationModel;
use workspace\modules\reservation\requests\ReservationRequests;
use workspace\modules\tour\models\Tour;

class ReservationController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Бронирование билетов');
        $this->viewPath = '/modules/reservation/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Бронирование', 'url' => 'admin/reservation']);
    }

    public function actionIndex()
    {
        return $this->render('reservation/index.tpl', ['h1' => 'Бронирование', 'options' => $this->getOptions(), 'model' => ReservationModel::get()]);
    }

    public function actionStore()
    {
        $request = new ReservationRequests();

        if ($request->isPost() AND $request->validate()) {
            $model = new ReservationModel();
            $model->_save($request);
            $this->redirect('admin/reservation');

        } else {
            return $this->render('reservation/store.tpl', ['h1' => 'Создать: ', 'errors' => $request->getMessagesArray(), 'tours' => Tour::all()]);
        }
    }

    public function actionView($id)
    {
        $model = ReservationModel::where('id', $id)->first();
        return $this->render('reservation/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $request = new ReservationRequests();
        $model = ReservationModel::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);
            $this->redirect('admin/reservation');

        } else {
            return $this->render('reservation/edit.tpl', ['h1' => 'Создать: ', 'model' => $model, 'tours' => Tour::all(), 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionDelete()
    {
        ReservationModel::destroy($_POST['id']);
        $this->redirect('admin/reservation');
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                '_tour' => [
                    'label' => 'Тур',
                    'value' => function($model) {
                        return $model->tour->name;
                    }
                ],
                'name' => 'Имя',
                'phone' => 'Номер телефона',
                'email' => 'Email',
                'updated_at' => 'Дата',
            ],
            'baseUri' => '/admin/reservation',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }
}
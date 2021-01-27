<?php

namespace workspace\modules\payments_tour\controllers;

use core\{App, Controller};
use workspace\modules\payments_tour\models\PaymentTour;
use workspace\modules\payments_tour\requests\PaymentTourRequest;
use workspace\modules\tour\models\Tour;


class PaymentsTourController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Описание оплаты тура');
        $this->viewPath = '/modules/payments_tour/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Описание оплаты тура', 'url' => 'admin/additional_price']);
    }

    public function actionStore()
    {
        $request = new PaymentTourRequest();
        if ($request->isPost() && $request->validate()) {
            $model = new PaymentTour();
            $model->_save();
            $this->redirect('admin/tour/update/' . $model->tour_id);
        } else {
            return $this->render('payments_tour/store.tpl', [
                'tours' => Tour::all(),
                'selectedTour' => (int)($_GET['tour'] ?? 0),
            ]);
        }
    }

    public function actionEdit($id)
    {
        $request = new PaymentTourRequest();
        $model = PaymentTour::where('id', $id)->first();
        if ($request->isPost() && $request->validate()) {
            $model->_save();
            $this->redirect('admin/tour/update/' . $model->tour_id);
        } else {
            return $this->render('payments_tour/edit.tpl', [
                'model' => $model,
                'tours' => Tour::all(),
                'h1' => 'Редактировать:',
            ]);
        }
    }

    public function actionDelete()
    {
        PaymentTour::destroy($_POST['id']);
        $this->redirect('admin/tour/update/'.$_POST['id']);
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
                'text' => 'Доп. оплачивается',
            ],
            'baseUri' => '/admin/additional_price',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }
}
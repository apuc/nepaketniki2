<?php


namespace workspace\modules\additional_price\controllers;


use core\App;
use core\Controller;
use workspace\modules\additional_price\models\AdditionalPrice;
use workspace\modules\additional_price\requests\AdditionalPriceRequest;
use workspace\modules\tour\models\Tour;

class AdditionalPriceController extends Controller
{
    public function actionIndex()
    {
        $model = AdditionalPrice::get();

        return $this->render('additional_price/index.tpl', ['h1' => 'Доп. оплата', 'models' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        $request = new AdditionalPriceRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new AdditionalPrice();
            $model->_save($request);

            $this->redirect('admin/additional_price');
        } else {
            return $this->render('additional_price/store.tpl', ['tours' => Tour::all()]);
        }
    }

    public function actionView($id)
    {
        $model = AdditionalPrice::where('id', $id)->first();

        return $this->render('additional_price/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $request = new AdditionalPriceRequest();
        $model = AdditionalPrice::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/additional_price');
        } else {
            return $this->render('additional_price/edit.tpl', ['model' => $model, 'tours' => Tour::all(), 'h1' => 'Редактировать:']);
        }
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

    protected function init()
    {
        $this->view->setTitle('Доп. оплачивается');
        $this->viewPath = '/modules/additional_price/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Доп. оплачивается', 'url' => 'admin/additional_price']);
    }
}
<?php


namespace workspace\modules\static_page\controllers;


use core\Controller;

class StaticPageController extends Controller
{
    public function actionIndex()
    {
        //$model = Plan::orderBy('tour_id', 'DESC')->orderBy('day', 'ASC')->get();

        //return $this->render('plan/index.tpl', ['h1' => 'Планы на дни', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
//            'serial' => '#',
//            'tr_class' => 'fixed-height',
//            'td_class' => 'fixed-height',
//            'fields' => [
//                '_tour' => [
//                    'label' => 'Тур',
//                    'value' => function($model) {
//                        return $model->tour->name;
//                    }
//                ],
//                'day' => 'День',
//                'info' => 'Информация',
//                'date' => 'Даты',
//                'description' => 'Описание',
//            ],
//            'baseUri' => '/admin/plan',
//            'pagination' => [
//                'per_page' => 10,
//            ],
//            'filters' => false
        ];
    }
}
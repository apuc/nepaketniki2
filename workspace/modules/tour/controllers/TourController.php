<?php
namespace workspace\modules\tour\controllers;

use core\App;
use core\Controller;
use core\Debug;
use workspace\modules\additional_price\models\AdditionalPrice;
use workspace\modules\date\models\Date;
use workspace\modules\feature\models\Feature;
use workspace\modules\image\models\Image;
use workspace\modules\included\models\Included;
use workspace\modules\plan\controllers\PlanController;
use workspace\modules\plan\models\Plan;
use workspace\modules\plan\requests\PlanSearchRequest;
use workspace\modules\section\models\Section;
use workspace\modules\tour\models\Tour;
use workspace\modules\tour\requests\TourSearchRequest;

class TourController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Туры');
        $this->viewPath = '/modules/tour/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Тур', 'url' => 'admin/tour']);
    }

    public function actionIndex()
    {
        $request = new TourSearchRequest();
        $model = Tour::search($request);

        return $this->render('tour/index.tpl',
            ['model' => $model, 'options' => $this->getOptions(), 'h1' => 'Туры']);
    }

    public function actionView($id)
    {
        $model = Tour::where('id', $id)->first();

        return $this->render('tour/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        $request = new TourSearchRequest();
        if ($request->isPost() AND $request->validate()) {
            $model = new Tour();
            $model->_save($request);

            $this->redirect('admin/tour');
        } else {
            $images = Image::all();

            return $this->render('tour/store.tpl', ['images' => $images, 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionEdit($id)
    {
        $model = Tour::where('id', $id)->first();
        $request = new TourSearchRequest();

        $common_options = [
            'serial' => '#',
            'thead_class' => '.thead-light',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'filters' => false,
        ];

        $plans = Plan::where('tour_id', $model->id)->get();
        $plans_opt = [
            'fields' => [
                'day' => 'День',
                'info' => 'Информация',
                'date' => 'Даты',
                'description' => 'Описание',
            ],
            'baseUri' => '/admin/plan',
        ];
        $plans_options = array_merge($common_options, $plans_opt);

        $features = Feature::where('tour_id', $model->id)->get();
        $features_opt = [
            'fields' => [
                'feature' => 'Особенность',
                'type' => 'Тип',
            ],
            'baseUri' => 'feature',
        ];
        $features_options = array_merge($common_options, $features_opt);

        $included = Included::where('tour_id', $model->id)->get();
        $included_opt = [
            'fields' => [
                '_column_side' => [
                    'label' => 'Сторона',
                    'value' => function($model) {
                        if ($model->column_side === 0) {
                            return 'Левая сторона';
                        } else {
                            return 'Правая сторона';
                        }
                    }
                ],
                'text' => 'Текст',
            ],
            'baseUri' => '/admin/included',
        ];
        $included_options = array_merge($common_options, $included_opt);

        $dates = Date::where('tour_id', $model->id)->get();
        $dates_opt = [
            'fields' => [
                'tour_dates' => 'Даты',
                'remaining_places' => 'Оставшиеся места',
            ],
            'baseUri' => '/admin/date',
        ];
        $dates_options = array_merge($common_options, $dates_opt);

        $additional_prices = AdditionalPrice::where('tour_id', $model->id)->get();
        $additional_prices_opt = [
            'fields' => [
                'text' => 'Доп. оплачивается',
            ],
            'baseUri' => '/admin/additional_price',
        ];
        $additional_prices_options = array_merge($common_options, $additional_prices_opt);

        $sections = Section::where('tour_id', $model->id)->get();
        $sections_opt = [
            'fields' => [
                'name' => 'Название',
                'text' => 'Текст',
                'priority' => 'Приоритет',
            ],
            'baseUri' => '/admin/section',
        ];
        $sections_options = array_merge($common_options, $sections_opt);

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/tour');
        } else {
            $images = Image::all();

            return $this->render('tour/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model,
                'tours' => Tour::select('id', 'name')->get(), 'images' => $images, 'errors' => $request->getMessagesArray(),
                'plans' => $plans, 'plans_options' => $plans_options, 'features' => $features, 'features_options' => $features_options,
                'included' => $included, 'included_options' => $included_options, 'dates' => $dates, 'dates_options' => $dates_options,
                'additional_prices' => $additional_prices, 'additional_prices_options' => $additional_prices_options,
                'sections' => $sections, 'sections_options' => $sections_options]);
        }
    }

    public function actionDelete()
    {
        Tour::destroy($_POST['id']);
        $this->redirect('admin/tour');
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'name' => 'Название',
                'front_date' => 'Даты тура на главной странице',
                'front_places_remaining' => 'Оставшиеся места в туре на главной странице',
                'price' => 'Цена тура на главной странице',
                'difficulties_and_weather' => 'Сложности и погода',
                'amount_of_places' => 'Количество мест',
                'activities_title' => 'Заголовок активностей',
            ],
            'baseUri' => '/admin/tour',
            'pagination' => [
                'per_page' => 20,
            ],
            'filters' => false
        ];
    }
}
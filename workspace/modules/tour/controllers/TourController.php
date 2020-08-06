<?php
namespace workspace\modules\tour\controllers;

use core\App;
use core\Controller;
use core\Debug;
use workspace\modules\image\models\Image;
use workspace\modules\tour\models\Tour;
use workspace\modules\tour\requests\TourSearchRequest;

class TourController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Туры');
        $this->viewPath = '/modules/tour/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
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

            return $this->render('tour/store.tpl', ['images' => $images]);
        }
    }

    public function actionEdit($id)
    {
        $model = Tour::where('id', $id)->first();

        $request = new TourSearchRequest();
        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/tour');
        } else {
            $images = Image::all();

            return $this->render('tour/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'tours' => Tour::select('id', 'name')->get(), 'images' => $images]);
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
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }
}
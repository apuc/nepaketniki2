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
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Tour', 'url' => 'tour']);
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
        if(isset($_POST['name'])) {
            $model = new Tour();
            $$model->_save();

            $this->redirect('admin/tour');
        } else {
            $images = Image::all();

            return $this->render('tour/store.tpl', ['images' => $images]);
        }
    }

    public function actionEdit($id)
    {
        $model = Tour::where('id', $id)->first();
        if(isset($_POST['name'])) {
            $model->_save();

            $this->redirect('admin/tour');
        }
        $images = Image::all();

        return $this->render('tour/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'images' => $images]);
    }

    public function actionDelete($id)
    {
//        Tour::where('id', $_POST['id'])->delete();
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'fields' => [
                'name' => 'Название',
                'front_date' => 'Даты тура на главной странице',
                'front_description' => 'Описание тура на главной странице',
                'front_places_remaining' => 'Отсавшиеся места в туре на главной странице',
                'price' => 'Цена тура на главной странице',
                'img' => [
                    'label' => 'Картинка тура на главной странице',
                    'value' => function($model) {
                        return '<img src="../../../resources/images/' . $model->image->image . '" />';
                    }
                ],
                'title_img' => [
                    'label' => 'Картинка тура на главной странице',
                    'value' => function($model) {
                        return $model->title_image->image;
                    }
                ],
                'main_description' => 'Описание на странице просмотра тура',
                'difficulties_and_weather' => 'Сложности и погода',
                'amount_of_places' => 'Количество мест',
                'visa' => 'Виза',
                'reservation_title' => 'Заголовок бронирования',
            ],
            'baseUri' => 'tour',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
    }
}
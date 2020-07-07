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

        $options = [
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
                'main_description' => 'Описание на странице просмотра тура',
                'difficulties_and_weather' => 'Сложности и погода',
                'amount_of_places' => 'Количество мест',
                'reservation_title' => 'Заголовок бронирования',
            ],
            'baseUri' => 'tour',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
        return $this->render('tour/index.tpl',
            ['model' => $model, 'options' => $options, 'h1' => 'Туры']);
    }

    public function actionView($id)
    {
//        $model = Tour::where('id', $id)->first();
//
//        $options = [
//            'fields' => [
//                'username' => 'Логин',
//                'email' => 'E-mail',
//                'role' => 'Роль'
//            ],
//        ];
//
//        return $this->render('users/view.tpl', ['model' => $model, 'options' => $options]);
    }

    public function actionStore()
    {
        if(isset($_POST['name'])) {
            $model = new Tour();

            $model->name = $_POST['name'];
            if(isset($_POST['main_description']))
                $model->main_description = $_POST['main_description'];
            if(isset($_POST['front_description']))
                $model->front_description = $_POST['front_description'];
            if(isset($_POST['front_date']))
                $model->front_date = $_POST['front_date'];
            if(isset($_POST['front_places_remaining']))
                $model->front_places_remaining = $_POST['front_places_remaining'];
            if(isset($_POST['price']))
                $model->price = $_POST['price'];
            if(isset($_POST['difficulties_and_weather']))
                $model->difficulties_and_weather = $_POST['difficulties_and_weather'];
            if(isset($_POST['amount_of_places']))
                $model->amount_of_places = $_POST['amount_of_places'];
            if(isset($_POST['reservation_title']))
                $model->reservation_title = $_POST['reservation_title'];
            if(isset($_POST['image_id']))
                $model->image_id = (int)$_POST['image_id'];

            $model->save();

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
            $model->name = $_POST['name'];
            if(isset($_POST['main_description']))
                $model->main_description = $_POST['main_description'];
            if(isset($_POST['front_description']))
                $model->front_description = $_POST['front_description'];
            if(isset($_POST['front_date']))
                $model->front_date = $_POST['front_date'];
            if(isset($_POST['front_places_remaining']))
                $model->front_places_remaining = $_POST['front_places_remaining'];
            if(isset($_POST['price']))
                $model->price = $_POST['price'];
            if(isset($_POST['difficulties_and_weather']))
                $model->difficulties_and_weather = $_POST['difficulties_and_weather'];
            if(isset($_POST['amount_of_places']))
                $model->amount_of_places = $_POST['amount_of_places'];
            if(isset($_POST['reservation_title']))
                $model->reservation_title = $_POST['reservation_title'];

            if(isset($_POST['image_id']))
                $model->image_id = (int)$_POST['image_id'];
            $model->save();

            $this->redirect('admin/tour');
        }

        $images = Image::all();

        return $this->render('tour/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'images' => $images]);
    }

    public function actionDelete($id)
    {
//        Tour::where('id', $_POST['id'])->delete();
    }
}
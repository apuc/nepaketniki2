<?php


namespace workspace\modules\business\controllers;


use core\App;
use core\Controller;
use workspace\modules\business\models\Business;
use workspace\modules\business\models\BusinessImages;
use workspace\modules\business\requests\BusinessRequest;
use workspace\modules\image\models\Image;

class BusinessController extends Controller
{
    public function actionIndex()
    {
        $model = Business::with('images')->get();

        return $this->render('business/index.tpl', ['h1' => 'Для бизнеса', 'models' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'header' => 'Заголовок',
                '_text_block_1' => [
                    'label' => 'Текст 1',
                    'value' => function ($model) {
                        return mb_substr($model->text_block_1, 0, 150, 'utf-8');
                    }
                ],
                '_text_block_2' => [
                    'label' => 'Текст 2',
                    'value' => function ($model) {
                        return mb_substr($model->text_block_2, 0, 150, 'utf-8');
                    }
                ],
                '_text_block_3' => [
                    'label' => 'Текст 3',
                    'value' => function ($model) {
                        return mb_substr($model->text_block_3, 0, 150, 'utf-8');
                    }
                ],
            ],
            'baseUri' => '/admin/business',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }

    public function actionDelete()
    {
        BusinessImages::truncate();
        Business::destroy($_POST['id']);
        $this->redirect('admin/business');
    }

    public function actionStore()
    {
        $model = Business::get();
        if ($model->count() >= 1) {
            return $this->render('business/index.tpl', ['h1' => 'Нельзя добавить больше одной страницы "Для бизнеса"', 'models' => $model, 'options' => $this->getOptions()]);
        }

        $request = new BusinessRequest();
        if (isset($request->data["submit_count_images"])) {
            if ($request->count_images >= 0) {
                $_SESSION['count_images'] = $request->count_images;
                return $this->render('business/store.tpl', ['h1' => 'Редактироние: ', 'new_count_images' => $request->count_images]);
            } else {
                return $this->render('business/store.tpl', ['h1' => 'Редактироние: ', 'errors' => 'Количество картинок не может быть отрицательным',
                    'model' => Business::get()->first()]);
            }
        }

        if ($request->isPost() AND $request->validate()) {

            $model = new Business();
            if ($_SESSION['count_images']) {
                $request->count_images = $_SESSION['count_images'];
                unset($_SESSION['count_images']);
            }
            $model->_save($request);
            foreach ($request->images as $image) {
                if (strlen($image) !== 0) {
                    $image_model = new Image();
                    $image_model->_save($image);

                    $business_image_model = new BusinessImages();
                    $business_image_model->_save($model->id, $image_model->id);
                }
            }
            $this->redirect('admin/business');

        } else {
            return $this->render('business/store.tpl', ['h1' => 'Создать: ', 'errors' => $request->getMessagesArray(), 'model' => Business::get()]);
        }
    }

    public function actionEdit($id)
    {
        $request = new BusinessRequest();

        if (isset($request->data["submit_count_images"])) {
            $model = Business::find($id);
            if ($model->count_images > $request->count_images) {
                $images = BusinessImages::orderBy('id', 'DESC')->get();
                for ($i = 0; $i < $images->count() - $request->count_images; ++$i) {
                    BusinessImages::destroy($images[$i]->id);
                }
                $model->count_images = $request->count_images;
                $model->save();
            } else if ($request->count_images >= 0) {
                $model->count_images = $request->count_images;
                $model->save();
                return $this->render('business/edit.tpl', ['h1' => 'Редактироние: ', 'errors' => $request->getMessagesArray(), 'model' => Business::find($id)]);
            } else if ($request->count_images < 0) {
                return $this->render('business/edit.tpl', ['h1' => 'Редактироние: ', 'errors' => 'Количество картинок не может быть отрицательным', 'model' => Business::find($id)]);
            }
        }

        if ($request->isPost() AND $request->validate()) {
            $model = Business::find($id);
            $model->_save($request);
            $this->clearBusinessImages();

            foreach ($request->images as $image) {
                if (strlen($image) !== 0) {
                    $image_model = new Image();
                    $image_model->_save($image);

                    $business_image_model = new BusinessImages();
                    $business_image_model->_save($model->id, $image_model->id);
                }
            }
            $this->redirect('admin/business');

        } else {
            return $this->render('business/edit.tpl', ['h1' => 'Редактироние: ', 'errors' => $request->getMessagesArray(), 'model' => Business::find($id)]);
        }
    }

    protected function clearBusinessImages()
    {
        $business_images = BusinessImages::get();
        foreach ($business_images as $business_image) {
            BusinessImages::destroy($business_image->id);
        }
    }

    public function actionView($id)
    {
        $model = Business::where('id', $id)->first();
        return $this->render('business/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    protected function init()
    {
        $this->view->setTitle('Для бизнеса');
        $this->viewPath = '/modules/business/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Для бизнеса', 'url' => 'admin/business']);
    }
}
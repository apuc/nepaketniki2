<?php


namespace workspace\modules\section\controllers;


use core\App;
use core\Controller;
use workspace\modules\image\models\Image;
use workspace\modules\section\models\Section;
use workspace\modules\section\models\SectionImages;
use workspace\modules\section\requests\SectionCountImageRequest;
use workspace\modules\section\requests\SectionRequest;
use workspace\modules\tour\models\Tour;

class SectionController extends Controller
{
    public function actionIndex()
    {
        $model = Section::get();

        return $this->render('section/index.tpl', ['h1' => 'Разделы', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'name' => 'Название',
                '_tour' => [
                    'label' => 'Тур',
                    'value' => function($model) {
                        return $model->tour->name;
                    }
                ],
                'text' => 'Текст',
                'priority' => 'Приоритет',
            ],
            'baseUri' => '/admin/section',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }


    public function actionStore()
    {
        $requestImage = new SectionCountImageRequest();
        if ($requestImage->isPost() AND $requestImage->validate() AND isset($requestImage->data["submit_count_images"])) {
            if ($requestImage->count_images >= 0) {
                $_SESSION['count_images'] = $requestImage->count_images;
                return $this->render('section/store.tpl', ['h1' => 'Создание: ', 'new_count_images' => $requestImage->count_images,
                    'tours' => Tour::all(), 'options' => $this->getOptions()]);
            } else {
                return $this->render('section/store.tpl', ['h1' => 'Создание: ',
                    'errors' => 'Количество картинок не может быть отрицательным', 'options' => $this->getOptions()]);
            }
        }

        $request = new SectionRequest();
        if ($request->isPost() AND $request->validate()) {
            $model = new Section();
            $model->_save($request);
            if ($_SESSION['count_images'] === null) $model->_save_image_count($_SESSION['count_images']);

            foreach ($request->images as $image) {
                if (strlen($image) !== 0) {
                    $image_model = new Image();
                    $image_model->_save($image);

                    $section_image_model = new SectionImages();
                    $section_image_model->_save($model->id, $image_model->id);
                }
            }
            $this->redirect('admin/section');

        } else {
            $tours = Tour::all();

            return $this->render('section/store.tpl', ['h1' => 'Создать:', 'options' => $this->getOptions(),
                'tours' => $tours, 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionView($id)
    {
        $model = Section::where('id', $id)->first();
        return $this->render('section/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionDelete()
    {
        $this->clearSection($_POST['id']);
        Section::destroy($_POST['id']);
        $this->redirect('admin/section');
    }

    public function actionEdit($id)
    {
        $requestImage = new SectionCountImageRequest();
        $model = Section::where('id', $id)->first();

        if ($requestImage->isPost() AND $requestImage->validate() AND isset($requestImage->data["submit_count_images"])) {
            if ($model->count_images > $requestImage->count_images) {
                $images = SectionImages::where('section_id', $id)->orderBy('id', 'DESC')->get();
                $num = $images->count() - $requestImage->count_images;
                for ($i = 0; $i < $num; ++$i) {
                    SectionImages::destroy($images[$i]->id);
                }
                $model->count_images = $requestImage->count_images;
                $model->save();
            }
            if ($requestImage->count_images >= 0) {
                $model->_save_image_count($requestImage->count_images);

                return $this->render('section/edit.tpl', ['h1' => 'Редактироние: ', 'tours' => Tour::all(),
                    'model' => $model, 'options' => $this->getOptions()]);
            } else {
                return $this->render('section/edit.tpl', ['h1' => 'Редактироние: ', 'errors' => 'Количество картинок не может быть отрицательным',
                    'model' => $model, 'tours' => Tour::all(), 'options' => $this->getOptions()]);
            }
        }

        $request = new SectionRequest();
        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);
            $this->clearSection($id);
            foreach ($request->images as $image) {
                if (strlen($image) !== 0) {
                    $image_model = new Image();
                    $image_model->_save($image);

                    $section_image_model = new SectionImages();
                    $section_image_model->_save($model->id, $image_model->id);
                }
            }

            $this->redirect('admin/section');
        } else {
            $tours = Tour::all();

            return $this->render('section/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'options' => $this->getOptions(),
                'tours' => $tours, 'errors' => $request->getMessagesArray()]);
        }
    }

    protected function init()
    {
        $this->view->setTitle('Разделы');
        $this->viewPath = '/modules/section/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Разделы', 'url' => 'admin/section']);
    }

    protected function clearSection(int $section_id)
    {
        $section_images = SectionImages::where('section_id', $section_id)->get();
        foreach ($section_images as $section_image) {
            SectionImages::destroy($section_image->id);
        }
    }
}
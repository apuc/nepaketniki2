<?php
namespace workspace\modules\included\controllers;

use core\App;
use core\Controller;
use core\Debug;
use workspace\modules\image\models\Image;
use workspace\modules\included\models\Included;
use workspace\modules\included\requests\IncludedRequest;
use workspace\modules\tour\models\Tour;
use workspace\modules\tour\requests\TourSearchRequest;

class IncludedController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Включено в тур');
        $this->viewPath = '/modules/included/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Включено в тур', 'url' => 'admin/included']);
    }

    public function actionIndex()
    {
        $model = Included::all();

        return $this->render('included/index.tpl',
            ['model' => $model, 'options' => $this->getOptions(), 'h1' => 'Включено в стоимость тура']);
    }

    public function actionView($id)
    {
        $model = Included::where('id', $id)->first();

        return $this->render('included/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        $request = new IncludedRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new Included();
            $model->_save($request);

            $this->redirect('admin/included');
        } else {
            return $this->render('included/store.tpl', ['tours' => Tour::all(), 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionEdit($id)
    {
        $request = new IncludedRequest();
        $model = Included::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/included');
        } else {
            return $this->render('included/edit.tpl', ['model' => $model, 'tours' => Tour::all(),
                'h1' => 'Редактировать:', 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionDelete()
    {
        Included::destroy($_POST['id']);
        $this->redirect('admin/included');
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
            'baseUri' => 'included',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
    }
}
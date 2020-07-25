<?php


namespace workspace\modules\plan\controllers;


use core\App;
use core\Controller;
use workspace\modules\image\models\Image;
use workspace\modules\plan\models\Plan;
use workspace\modules\plan\requests\PlanSearchRequest;
use workspace\modules\plan_images\models\PlanImages;
use workspace\modules\tour\models\Tour;

class PlanController extends Controller
{
    public function actionIndex()
    {
        $model = Plan::get();

        return $this->render('plan/index.tpl', ['h1' => 'Планы на дни', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'day' => 'День',
                'info' => 'Информация',
                'date' => 'Даты',
                'description' => 'Описание',
            ],
            'baseUri' => '/admin/plan',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }

    public function actionStore()
    {
        $request = new PlanSearchRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new Plan();
            $model->_save($request);
            $image = new Image();
            $image->image = $request->image;
            $image->save();
            $image_model = new PlanImages();
            $image_model->_save($model->id, $image->id);

            /*foreach ($request->images as $image) {
                $image_model = new PlanImages();
                $image_model->_save();
            }*/

            $this->redirect('admin/plan');
        } else {
            $tours = Tour::all();

            return $this->render('plan/store.tpl', ['h1' => 'Создать:', 'options' => $this->getOptions(), 'tours' => $tours]);
        }
    }

    public function actionView($id)
    {
        $model = Plan::where('id', $id)->first();
        return $this->render('plan/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $request = new PlanSearchRequest();
        $model = Plan::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {

            $model->_save($request);

            $this->redirect('admin/plan');
        } else {
            $tours = Tour::all();

            return $this->render('plan/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'options' => $this->getOptions(), 'tours' => $tours]);
        }
    }

    protected function init()
    {
        $this->view->setTitle('Планы туров');
        $this->viewPath = '/modules/plan/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Plan', 'url' => 'plan']);
    }
}
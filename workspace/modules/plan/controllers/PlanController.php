<?php


namespace workspace\modules\plan\controllers;


use core\App;
use core\Controller;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Contracts\Validation\Validator;
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
                '_tour' => [
                    'label' => 'Тур',
                    'value' => function($model) {
                        return $model->tour->name;
                    }
                ],
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

            /*$validator = Validator::make((array)$request->day, [
                'day' => [
                    'required',
                    Rule::notIn(Plan::select('day')->where('tour_id', 1)->get()->toArray()),
                ],
            ]);
            var_dump($validator->validate()); exit();*/
            if (!in_array((int)$request->day, Plan::select('day')->where('tour_id', $request->tour_id)->get()->toArray()[0])) {
                $model = new Plan();
                $model->_save($request);
                foreach ($request->image as $image) {
                    if (strlen($image) !== 0) {
                        $image_model = new Image();
                        $image_model->_save('/resources/' . $image);

                        $plan_image_model = new PlanImages();
                        $plan_image_model->_save($model->id, $image_model->id, $model->tour_id);
                    }
                }
                $this->redirect('admin/plan');
            } else {
                $tours = Tour::all();

                return $this->render('plan/store.tpl', ['errors' => ['day' => 'Этот день уже заполнен'], 'tours' => $tours]);
            }
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

    public function actionDelete()
    {
        Plan::destroy($_POST['id']);
        $this->redirect('admin/plan');
    }

    public function actionEdit($id)
    {
        $request = new PlanSearchRequest();
        $model = Plan::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);
            foreach ($request->image as $image) {
                if (strlen($image) !== 0) {
                    $image_model = new Image();
                    $image_model->_save('/resources/' . $image);

                    $plan_image_model = new PlanImages();
                    $plan_image_model->_save($model->id, $image_model->id, $model->tour_id);
                }
            }

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
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Планы на дни', 'url' => 'admin/plan']);
    }
}
<?php


namespace workspace\modules\admin_review_main_page\controllers;


use core\App;
use core\Controller;
use workspace\modules\admin_review_main_page\models\MainPageReview;
use workspace\modules\admin_review_main_page\requests\ReviewRequest;

class AdminReviewController extends Controller
{
    public function actionIndex()
    {
        $model = MainPageReview::get();

        return $this->render('reviews/index.tpl', ['h1' => 'Отзывы', 'models' => $model, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'name' => 'Название',
                'instagram_link' => 'Инстаграмм',
                'avatar' => 'Аватар',
                'text' => 'Отзыв',
                'priority' => 'Приоритет',
            ],
            'baseUri' => '/admin/reviews',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }

    public function actionDelete()
    {
        MainPageReview::destroy($_POST['id']);
        $this->redirect('admin/reviews');
    }

    public function actionStore()
    {
        $request = new ReviewRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new MainPageReview();
            $model->_save($request);
            $this->redirect('admin/reviews');

        } else {
            return $this->render('reviews/store.tpl', ['h1' => 'Создать: ', 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionEdit($id)
    {
        $model = MainPageReview::where('id', $id)->first();
        $request = new ReviewRequest();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/reviews');
        } else {
            return $this->render('reviews/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model, 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionView($id)
    {
        $model = MainPageReview::where('id', $id)->first();
        return $this->render('reviews/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    protected function init()
    {
        $this->view->setTitle('Отзывы');
        $this->viewPath = '/modules/admin_review_main_page/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панел администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Отзывы', 'url' => 'admin/reviews']);
    }
}
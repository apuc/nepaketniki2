<?php


namespace workspace\modules\admin_review_main_page\controllers;


use core\App;
use core\Controller;
use workspace\modules\admin_review_main_page\models\MainPageReview;
use workspace\modules\tour\models\Tour;
use workspace\modules\users\models\User;
use workspace\modules\users\requests\UsersSearchRequest;
use workspace\widgets\Main;

class AdminReviewController extends Controller
{
    private $text_fields = ['name', 'instagramLinks', 'text'];

    protected function init()
    {
        $this->view->setTitle('Отзывы');
        $this->viewPath = '/modules/admin_review_main_page/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Review', 'url' => 'review']);
    }

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
                'instagramLinks' => 'Инстаграмм',
                'avatar' => 'Аватар',
                'text' => 'Отзыв',
            ],
            'baseUri' => '/admin/reviews',
            'pagination' => [
                'per_page' => 10,
            ],
        ];
    }

    public function actionDelete($id)
    {
        MainPageReview::destroy($id);
        $this->redirect('admin/reviews');
    }

    public function actionStore()
    {
        if ($this->isPostExist()) {
            $model = new MainPageReview();
            $model->name = $_POST['name'];
            $model->instagramLinks = $_POST['instagramLinks'];
            $model->text = $_POST['text'];
            // change
            $model->avatar = '...';
            //
            $model->save();
            $this->redirect('admin/reviews');

        } else {
            return $this->render('reviews/store.tpl', ['h1' => 'Создать: ']);
        }
    }

    public function actionEdit($id)
    {
        $model = MainPageReview::where('id', $id)->first();
        if($this->isPostExist()) {
            $model->name = $_POST['name'];
            $model->instagramLinks = $_POST['instagramLinks'];
            $model->text = $_POST['text'];
            if (isset($_FILES['avatar'])) {

            }
            $model->save();

            $this->redirect('admin/reviews');
        } else {
            return $this->render('reviews/edit.tpl', ['h1' => 'Редактировать: ', 'model' => $model]);
        }
    }


    public function actionView($id)
    {
        $model = MainPageReview::where('id', $id)->first();
        return $this->render('reviews/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    private function isPostExist() {
        foreach ($this->text_fields as $post_var) {
            if (!isset($_POST[$post_var])) {
                return false;
            }
        }
        return true;
    }
}
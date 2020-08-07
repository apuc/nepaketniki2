<?php


namespace workspace\modules\static_page\controllers;


use core\App;
use core\Controller;
use workspace\modules\static_page\models\StaticPage;
use workspace\modules\static_page\requests\StaticPageRequest;

class StaticPageController extends Controller
{
    protected $static_page_layout_path = '/modules/static_page/views/static/layouts/';
    protected $default_static_layout = 'static_default_layout.tpl';

    protected $static_page_view_path = '/modules/static_page/views/static/views/';
    protected $default_static_views = 'static_default_view.tpl';


    public function actionStaticPage($slug)
    {
        $model = StaticPage::where('status', '<>', 0)->where('slug', $slug)->first();
        if ($model === null) {
            $this->redirect('404');
        } else {
            $this->layoutPath = $this->static_page_layout_path;
            /* check layout exists */

            if (file_exists(WORKSPACE_DIR . $this->static_page_layout_path . $model->layout) AND strlen($model->layout) > 0) {
                $this->setLayout($model->layout);
            } else {
                $this->setLayout($this->default_static_layout);
            }
            /* check view exists */
            if (file_exists(WORKSPACE_DIR . $this->static_page_view_path . $model->view)  AND strlen($model->view) > 0) {
                $view_name = $model->view;
            } else {
                $view_name = $this->default_static_views;
            }
            $this->view->setTitle(ucfirst(strtolower($model->name)));

            return strlen($model->content) > 0 ? $this->render("static/views/$view_name", ['content' => $model->content]) : $this->render("static/views/$view_name");
        }
        return $slug;
    }

    public function actionIndex()
    {
        $model = StaticPage::get();

        return $this->render('static_page/index.tpl', ['h1' => 'Страницы', 'model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionView($id)
    {
        $model = StaticPage::where('id', $id)->first();
        return $this->render('static_page/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionStore()
    {
        $request = new StaticPageRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new StaticPage();
            $model->_save($request);

            $this->redirect('admin/static_page');
        } else {
            $model = StaticPage::get();

            return $this->render('static_page/store.tpl', ['h1' => 'Создать:', 'options' => $this->getOptions(), 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionEdit($id)
    {
        $request = new StaticPageRequest();
        $model = StaticPage::find($id);

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);

            $this->redirect('admin/static_page');
        } else {
            return $this->render('static_page/edit.tpl', ['h1' => 'Редактировать:', 'options' => $this->getOptions(), 'model' => $model, 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionDelete()
    {
        StaticPage::destroy($_POST['id']);
        $this->redirect('admin/static_page');
    }

    protected function init()
    {
        $this->view->setTitle('Статические страницы');
        $this->viewPath = '/modules/static_page/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Страницы', 'url' => 'admin/static_page']);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'name' => 'Название',
                'slug' => 'Адрес',
                'layout' => 'Шаблон',
                'view' => 'Вид',
                '_status' => [
                    'label' => 'Статус',
                    'value' => function($model) {
                        return $model->status ? 'Активна' : 'Не активна';
                    },
                ]
            ],
            'baseUri' => '/admin/static_page',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }
}
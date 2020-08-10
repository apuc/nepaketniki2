<?php


namespace workspace\modules\seo\controllers;


use core\App;
use core\Controller;
use workspace\modules\seo\model\Meta;
use workspace\modules\seo\model\Seo;
use workspace\modules\seo\requests\SeoRequest;
use workspace\modules\settings\models\Settings;

class SeoController extends Controller
{
    public function actionIndex()
    {
        $tags = ['title', 'keywords', 'description'];
        $pages = ['index', 'tours'];

        $meta_tags = [];
        foreach ($pages as $page) {
            $meta = new Meta();
            $meta->page = $page;
            foreach ($tags as $tag) {
                $model = Settings::where('key', 'like', "meta_$tag" . '_' . "$page")->first();
                if ($tag === 'title' AND $model !== null) {
                    $meta->title = $model->value;
                }
                if ($tag === 'description' AND $model !== null) {
                    $meta->description = $model->value;
                }
                if ($tag === 'keywords' AND $model !== null) {
                    $meta->keywords = $model->value;
                }
            }
            $meta_tags[] = $meta;
        }
        return $this->render('seo/index.tpl', ['h1' => 'Seo', 'model' => $meta_tags, 'options' => $this->getOptions()]);
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                '_keywords' => [
                    'label' => 'Keywords',
                    'value' => function($model) {
                        if (isset($model->keywords)) {
                            return $model->keywords;
                        }
                    }
                ],
                '_description' => [
                    'label' => 'Description',
                    'value' => function($model) {
                        if (isset($model->description)) {
                            return $model->description;
                        }
                    }
                ],
                '_title' => [
                    'label' => 'Title',
                    'value' => function($model) {
                        if (isset($model->title)) {
                            return $model->title;
                        }
                    }
                ],
            ],
            'baseUri' => '/admin/seo',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false,
            'buttons' => false
        ];
    }


    public function actionStore()
    {
        $request = new SeoRequest();
        if ($request->isPost() AND $request->validate()) {
            $model = new Seo();
            $model->_save($request);
            $this->redirect('admin/seo');
        } else {
            return $this->render('seo/store.tpl', ['h1' => 'Создание meta-тегов:',
                'errors' => $request->getMessagesArray(), 'options' => $this->getOptions()]);
        }
    }

    public function actionView($id)
    {
        $model = Seo::where('id', $id)->first();
        return $this->render('seo/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionDelete()
    {
        Seo::destroy($_POST['id']);
        $this->redirect('admin/seo');
    }

    public function actionEdit($id)
    {
        $request = new SeoRequest();
        if ($request->isPost() AND $request->validate()) {
            $model = Seo::find($id);
            $model->_save($request);
            $this->redirect('admin/seo');
        } else {
            return $this->render('seo/edit.tpl', ['h1' => 'Редактирование meta-тегов:', 'model' => Seo::find($id),
                'errors' => $request->getMessagesArray(), 'options' => $this->getOptions()]);
        }
    }

    protected function init()
    {
        $this->view->setTitle('Seo');
        $this->viewPath = '/modules/seo/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Seo', 'url' => 'admin/seo']);
    }
}
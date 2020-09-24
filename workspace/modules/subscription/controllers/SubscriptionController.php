<?php


namespace workspace\modules\subscription\controllers;


use core\App;
use core\Controller;
use workspace\modules\subscription\models\SubscriptionModel;
use workspace\modules\subscription\requests\SubscriptionRequest;

class SubscriptionController extends Controller
{
    protected function init()
    {
        $this->view->setTitle('Подписки');
        $this->viewPath = '/modules/subscription/views/';
        $this->layoutPath = App::$config['adminLayoutPath'];
        App::$breadcrumbs->addItem(['text' => 'Панель администратора', 'url' => 'admin']);
        App::$breadcrumbs->addItem(['text' => 'Подписки', 'url' => 'admin/subscription']);
    }

    public function actionIndex()
    {
        $model = SubscriptionModel::all();

        return $this->render('subscription/index.tpl',
            ['model' => $model, 'options' => $this->getOptions(), 'h1' => 'Подписки']);
    }

    public function actionStore()
    {
        $request = new SubscriptionRequest();

        if ($request->isPost() AND $request->validate()) {
            $model = new SubscriptionModel();
            $model->_save($request);
            $this->redirect('admin/subscription');

        } else {
            return $this->render('subscription/store.tpl', ['h1' => 'Создать: ', 'errors' => $request->getMessagesArray()]);
        }
    }

    public function actionView($id)
    {
        $model = SubscriptionModel::where('id', $id)->first();
        return $this->render('subscription/view.tpl', ['model' => $model, 'options' => $this->getOptions()]);
    }

    public function actionEdit($id)
    {
        $request = new SubscriptionRequest();
        $model = SubscriptionModel::where('id', $id)->first();

        if ($request->isPost() AND $request->validate()) {
            $model->_save($request);
            $this->redirect('admin/subscription');

        } else {
            return $this->render('subscription/edit.tpl', ['h1' => 'Редактировать: ', 'errors' => $request->getMessagesArray(), 'model' => $model]);
        }
    }

    public function actionDelete()
    {
        SubscriptionModel::destroy($_POST['id']);
        $this->redirect('admin/subscription');
    }

    public function getOptions()
    {
        return [
            'serial' => '#',
            'tr_class' => 'fixed-height',
            'td_class' => 'fixed-height',
            'fields' => [
                'name' => 'Имя',
                'phone' => 'Номер телефона',
            ],
            'baseUri' => 'subscription',
            'pagination' => [
                'per_page' => 10,
            ],
            'filters' => false
        ];
    }
}
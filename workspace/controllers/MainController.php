<?php

namespace workspace\controllers;

use core\App;
use core\component_manager\lib\CM;
use core\component_manager\lib\Config;
use core\component_manager\lib\Mod;
use core\Controller;
use workspace\classes\Button;
use workspace\classes\Modules;
use workspace\classes\ModulesSearchRequest;
use workspace\models\User;
use workspace\modules\admin_review_main_page\models\MainPageReview;
use workspace\modules\feature\models\Feature;
use workspace\modules\image\models\Image;
use workspace\modules\plan\models\Plan;
use workspace\modules\plan_images\models\PlanImages;
use workspace\modules\reservation\models\ReservationModel;
use workspace\modules\reservation\requests\ReservationRequests;
use workspace\modules\subscription\models\SubscriptionModel;
use workspace\modules\subscription\requests\SubscriptionRequest;
use workspace\modules\tour\models\Tour;
use workspace\requests\LoginRequest;
use workspace\requests\RegistrationRequest;
use workspace\widgets\Language;


class MainController extends Controller
{

    public function actionIndex()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Nepaketniki');

        $model = Tour::all();
        return $this->render('nepaketniki/index.tpl', ['model' => $model]);
    }

    public function actionTour($id)
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Nepaketniki');
        $model = Tour::where('id', $id)->first();
        $activities = Feature::where('tour_id', $id)->where('type', 'Что сделаем')->get();
        $plan = Plan::where('tour_id', $id)->get();

        return $this->render('nepaketniki/tour.tpl', ['model' => $model, 'activities' => $activities, 'plan' => $plan]);
    }

    public function actionTours()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Nepaketniki');

        $model = Tour::all();
        return $this->render('nepaketniki/tours.tpl', ['model' => $model]);
    }

    public function actionReviews()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Nepaketniki');

        $model = MainPageReview::all();
        return $this->render('nepaketniki/reviews.tpl', ['model' => $model]);
    }

    public function actionLanguage()
    {
        Language::widget()->run();
    }

    public function actionSignUp()
    {
        $this->view->setTitle('Sign Up');
        $request = new RegistrationRequest();
        if ($request->isPost() && $request->validate()) {
            $model = new User();
            $model->username = $request->username;
            $model->email = $request->email;
            $model->role = 2;
            $model->password_hash = password_hash($request->password, PASSWORD_DEFAULT);
            $model->save();

            $_SESSION['role'] = $model->role;
            $_SESSION['username'] = $model->username;

            $this->redirect('admin/tour');
        }

        return $this->render('main/sign-up.tpl', ['errors' => $request->getMessagesArray()]);
    }

    public function actionSignIn()
    {
        $this->view->setTitle('Sign In');

        $mod = new Mod();
        if ($mod->getModInfo('users')['status'] != 'active') {
            $message = 'Чтобы сделать доступной регистрацию и авторизацию установите и активируйте модуль пользователей.';

            return $this->render('main/info.tpl', ['message' => $message]);
        } else {
            $request = new LoginRequest();
            if ($request->isPost() && $request->validate()) {
                $model = User::where('username', $request->username)->first();

                if (password_verify($request->password, $model->password_hash)) {
                    $_SESSION['role'] = $model->role;
                    $_SESSION['username'] = $model->username;

                    $url = !empty($request->ref) ? parse_url($request->ref, PHP_URL_PATH) : 'admin';
                    $this->redirect($url);
                }
            }

            return $this->render('main/sign-in.tpl', [
                'errors' => $request->getMessagesArray(),
                'ref' => $request->getHeader('Referer')
            ]);
        }
    }

    public function actionLogout()
    {
        session_destroy();
        $this->redirect('');
    }

    public function actionModules()
    {
        App::$header->add('Access-Control-Allow-Origin', '*');
        $content = file_get_contents('https://rep.craft-group.xyz/handler.php');
        $data = json_decode($content);

        $request = new ModulesSearchRequest();

        $mod = new Mod();
        $model = array();
        foreach ($data as $value)
            if ($value->type == 'module') {
                $module = new Modules();
                $module->init($value->name, $value->version, $value->description, $mod->getModInfo($value->name)['status']);
                array_push($model, $module);
            }

        $model = Modules::search($request, $model);

        $options = [
            'serial' => '#',
            'fields' => [
                'action' => [
                    'label' => '',
                    'value' => function ($model) {
                        //$mod = new Mod();
                        $button = new Button();

                        if ($model->status == 'active')
                            return $button->button('module-set-inactive', 'Отключить', $model->name, $model->name, 'toggle-on');
                        elseif ($model->status == 'inactive')
                            return $button->button('module-set-active', 'Включить', $model->name, $model->name, 'toggle-off');
                        else
                            return $button->button('module-download', 'Скачать', $model->name, $model->name, 'download');
                    },
                    'showFilter' => false,
                ],
                'delete' => [
                    'label' => '',
                    'value' => function ($model) {
                        $mod = new Mod();
                        $button = new Button();

                        if ($mod->getModInfo($model->name)['status'] == 'inactive')
                            return $button->button('fixed-width module-delete', 'Удалить', $model->name, $model->name, 'trash');
                        else
                            return '<div class="fixed-width"></div>';
                    },
                    'showFilter' => false,
                ],
                'status' => [
                    'label' => 'Статус',
                    'value' => function ($model) {
                        $mod = new Mod();
                        return '<div class="fixed-width">' . $model->status . '</div>';
                    }
                ],
                'name' => 'Название',
                'description' => 'Описание',
                'version' => 'Версия'
            ],
            'baseUri' => 'modules',
        ];

        App::$breadcrumbs->addItem(['text' => 'AdminPanel', 'url' => 'adminlte']);
        App::$breadcrumbs->addItem(['text' => 'Modules', 'url' => 'modules']);

        return $this->render('main/modules.tpl', ['model' => $model, 'options' => $options]);
    }

    public function actionModuleDownload()
    {
        try {
            $cm = new CM();
            $cm->download($_POST['slug']);
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function actionSetActive()
    {
        try {
            $cm = new CM();
            $cm->modChangeStatusToActive($_POST['slug']);
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function actionSetInactive()
    {
        try {
            $cm = new CM();
            $cm->modChangeStatusToInactive($_POST['slug']);
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function actionModuleDelete()
    {
        try {
            $cm = new CM();
            $mod = new Mod();
            $mod->deleteDirectory(ROOT_DIR . Config::get()->byKey($mod->getModInfo($_POST['slug'])['type'] . 'Path') . $_POST['slug']);
            $cm->modDeleteFromJson($_POST['slug']);
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function reviewsDownload()
    {
        try {
            $review_model = MainPageReview::orderBy('priority', 'DESC')->select('priority', 'tour_id', 'instagram_link as instagramLinks', 'text', 'avatar', 'name', 'id')->get();
            echo json_encode($review_model);
            die();
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function planPhotosDownload($id)
    {
        try {
            $json = [];
            $model = PlanImages::where('tour_id', $id)->get();
            foreach ($model as $item)
            {
                $temp_arr = [];
                $temp_arr['image'] = str_replace('\\', '/', $item->image->image);
                $temp_arr['day'] = $item->plan->day;
                $json[] = $temp_arr;
            }
            echo json_encode($json);
            die();
        } catch (\Exception $e) {
            return $e;
        }
    }

    public function actionReserve($id)
    {
        $request = new ReservationRequests();
        if ($request->validate() AND $request->isPost()) {
            $model = new ReservationModel();
            $model->tour_id = $id;
            $model->_save($request);
        } else {
            echo json_encode($request->getMessagesArray());
            die();
        }
    }

    public function actionSubscribe()
    {
        $request = new SubscriptionRequest();
        if ($request->validate() AND $request->isPost()) {
            $model = new SubscriptionModel();
            $model->_save($request);
        } else {
            echo json_encode($request->getMessagesArray());
            die();
        }
    }
}
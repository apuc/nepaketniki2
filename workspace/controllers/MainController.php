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
use workspace\modules\business\models\Business;
use workspace\modules\feature\models\Feature;
use workspace\modules\mailer\ViewMailer;
use workspace\modules\plan\models\Plan;
use workspace\modules\plan_images\models\PlanImages;
use workspace\modules\reservation\models\ReservationModel;
use workspace\modules\reservation\requests\ReservationRequests;
use workspace\modules\section\models\Section;
use workspace\modules\seo\model\Seo;
use workspace\modules\seo\service\SeoService;
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
        SeoService::setMeta($this->view, 'index');

        return $this->render('nepaketniki/index.tpl', ['model' => $model]);
    }

    public function actionTour($id)
    {
        $this->setLayout('nepaketniki.tpl');
        $model = Tour::where('id', $id)->first();
        $this->view->setTitle($model->name);
        $activities = Feature::where('tour_id', $id)->where('type', 'Что сделаем')->get();
        $plan = Plan::where('tour_id', $id)->get();

        return $this->render('nepaketniki/tour.tpl', ['model' => $model, 'activities' => $activities, 'plan' => $plan]);
    }

    public function actionTours()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Туры');
        $model = Tour::all();
        SeoService::setMeta($this->view, 'tours');

        return $this->render('nepaketniki/tours.tpl', ['model' => $model]);
    }

    public function actionBusiness()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Для бизнеса');

        return $this->render('nepaketniki/business.tpl', ['model' => Business::get()->first()]);
    }

    public function actionPageNotfound()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Страница не найдена');

        return $this->render('errors/404.tpl');
    }

    public function actionReviews()
    {
        $this->setLayout('nepaketniki.tpl');
        $this->view->setTitle('Отзывы');
        $model = MainPageReview::all();

        return $this->render('nepaketniki/reviews.tpl', ['model' => $model]);
    }

    public function actionLanguage()
    {
        Language::widget()->run();
    }

    public function actionSignUp()
    {
        if (App::$config['is_allow_register_admin']) {
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
        } else {
            $this->setLayout('nepaketniki.tpl');
            $this->view->setTitle('Page not found');

            return $this->render('errors/404.tpl');
        }
    }

    public function actionSignIn()
    {
        $this->view->setTitle('Sign In');

        $mod = new Mod();
        if ($mod->getModInfo('users')['status'] != 'active') {
            $message = 'Чтобы сделать доступной регистрацию и авторизацию установите и активируйте модуль пользователей.';

            return $this->render('main/info.tpl', ['message' => $message, 'is_allow_register_admin' => App::$config['is_allow_register_admin']]);
        } else {
            $request = new LoginRequest();
            if ($request->isPost() && $request->validate()) {
                $model = User::where('username', $request->username)->first();
                if ($model === null) {
                    return $this->render('main/sign-in.tpl', ['errors' => ['Пользователя с таким логином нет'], 'is_allow_register_admin' => App::$config['is_allow_register_admin']]);
                }

                if (password_verify($request->password, $model->password_hash)) {
                    $_SESSION['role'] = $model->role;
                    $_SESSION['username'] = $model->username;

                    $url = !empty($request->ref) ? parse_url($request->ref, PHP_URL_PATH) : 'admin';
                    $this->redirect($url);
                } else {
                    return $this->render('main/sign-in.tpl', ['errors' => ['Пользователя с такими учетными данными нет'], 'is_allow_register_admin' => App::$config['is_allow_register_admin']]);
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
        $review_model = [];
        try {
            if (!isset($_GET['tour_id']) OR $_GET['tour_id'] === 0) {
                $review_model = MainPageReview::orderBy('priority', 'DESC')
                    ->orderBy('updated_at', 'DESC')
                    ->select('priority', 'tour_id', 'instagram_link as instagramLinks', 'text', 'avatar', 'name', 'id', 'updated_at')
                    ->get();
            } else if (isset($_GET['tour_id']) AND $_GET['tour_id'] !== 0) {
                $tour_id = $_GET['tour_id'];
                $review_model_by_tour = MainPageReview::where('tour_id', $tour_id)->orderBy('priority', 'DESC')->orderBy('updated_at', 'DESC')->select('priority', 'tour_id', 'instagram_link as instagramLinks', 'text', 'avatar', 'name', 'id', 'updated_at')->get()->toArray();
                $review_model_not_by_tour = MainPageReview::where('tour_id', '<>', $tour_id)->orderBy('priority', 'DESC')->orderBy('updated_at', 'DESC')->select('priority', 'tour_id', 'instagram_link as instagramLinks', 'text', 'avatar', 'name', 'id', 'updated_at')->get()->toArray();
                $review_model = array_merge((array)$review_model_by_tour, (array)$review_model_not_by_tour);
            }
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
            foreach ($model as $item) {
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

    public function sectionPhotosDownload($id)
    {
        try {
            $json = [];
            $model = Section::where('tour_id', $id)
                ->select('id', 'tour_id')
                ->orderBy('priority', 'DESC')
                ->get();
            foreach ($model as $section) {
                foreach ($section->images as $image) {
                    $temp_arr = [];
                    $temp_arr['section_id'] = $section->id;
                    $temp_arr['image'] = str_replace('\\', '/', $image->image->image);
                    $json[] = $temp_arr;
                }
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

            $mailer = new ViewMailer();
            $mailer->send('Бронирование тура', 'reservation.tpl', null, ['client' => $model, 'tour' => Tour::find($id)]);
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

            $mailer = new ViewMailer();
            $mailer->send('Подписка', 'subscribe.tpl', null, ['subscriber' => $model]);
        } else {
            echo json_encode($request->getMessagesArray());
            die();
        }
    }
}
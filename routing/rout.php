<?php

use core\App;

App::$collector->any('sign-up', ['workspace\controllers\MainController', 'actionSignUp']);
App::$collector->any('sign-in', ['workspace\controllers\MainController', 'actionSignIn']);
App::$collector->any('logout', ['workspace\controllers\MainController', 'actionLogout']);
App::$collector->any('modules', ['workspace\controllers\MainController', 'actionModules']);
App::$collector->any('module-download', ['workspace\controllers\MainController', 'actionModuleDownload']);
App::$collector->any('module-set-active', ['workspace\controllers\MainController', 'actionSetActive']);
App::$collector->any('module-set-inactive', ['workspace\controllers\MainController', 'actionSetInactive']);
App::$collector->any('module-delete', ['workspace\controllers\MainController', 'actionModuleDelete']);

App::$collector->any('review_download', ['workspace\controllers\MainController', 'reviewDownload']);


App::$collector->group(['after' => 'main_group', 'params' => ['AFTER']], function($router) {
    App::$collector->group(['before' => 'next'], function($router) {
        App::$collector->get('/', [workspace\controllers\MainController::class, 'actionIndex'], ['before' => 'some', 'params' => ['param to some, BEFORE']]);
        App::$collector->get('/tours', [workspace\controllers\MainController::class, 'actionTours'], ['before' => 'some', 'params' => ['param to some, BEFORE']]);
        App::$collector->get('/reviews', [workspace\controllers\MainController::class, 'actionReviews'], ['before' => 'some', 'params' => ['param to some, BEFORE']]);
    });
});

App::$collector->group(['after' => 'main_group', 'params' => ['AFTER']], function($router) {
    App::$collector->group(['before' => 'next'], function($router) {
        App::$collector->get('/tour/{id}', [workspace\controllers\MainController::class, 'actionTour'], ['before' => 'some', 'params' => ['param to some, BEFORE']]);
    });
});
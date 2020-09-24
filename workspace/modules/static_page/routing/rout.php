<?php

use core\App;

App::$collector->group(['before' => 'auth'], function ($router){
    App::$collector->group(['prefix' => 'admin'], function ($router){
        App::$collector->gridView('static_page', ['workspace\modules\static_page\controllers\StaticPageController']);
    });
});

App::$collector->get('page/{slug}', ['workspace\modules\static_page\controllers\StaticPageController', 'actionStaticPage']);

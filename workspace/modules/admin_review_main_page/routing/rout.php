<?php

use core\App;

App::$collector->group(['before' => 'auth'], function ($router){
    App::$collector->group(['prefix' => 'admin'], function ($router){
        App::$collector->gridView('reviews', ['workspace\modules\admin_review_main_page\controllers\AdminReviewController']);
    });
});
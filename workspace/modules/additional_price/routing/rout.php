<?php

use core\App;

App::$collector->group(['before' => 'auth'], function ($router){
    App::$collector->group(['prefix' => 'admin'], function ($router){
        App::$collector->gridView('additional_price', ['workspace\modules\additional_price\controllers\AdditionalPriceController']);
    });
});
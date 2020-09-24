<?php


namespace workspace\modules\date;


use core\App;

class Date
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Даты',
                'url' => '/admin/date/',
                'icon' => '<i class="nav-icon fa fa-calendar-day"></i>'
            ],
        ];

        App::mergeConfig($config);
    }
}
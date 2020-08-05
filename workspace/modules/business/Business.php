<?php


namespace workspace\modules\business;


use core\App;

class Business
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Для бизнеса',
                'url' => '/admin/business/',
                'icon' => '<i class="nav-icon fas fa-business-time" aria-hidden="true"></i>',
            ],
        ];

        App::mergeConfig($config);
    }
}
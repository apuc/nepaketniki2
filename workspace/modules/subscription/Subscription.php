<?php


namespace workspace\modules\subscription;


use core\App;

class Subscription
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Подписчики',
                'url' => '/admin/subscription',
                'icon' => '<i class="nav-icon fas fa-users"></i>',
            ],
        ];

        App::mergeConfig($config);
    }
}
<?php


namespace workspace\modules\tour;


use core\App;

class Tour
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Туры',
                'url' => '/admin/tour/',
                'icon' => '<i class="nav-icon fa fa-route"></i>',
            ],
        ];

        App::mergeConfig($config);
    }
}
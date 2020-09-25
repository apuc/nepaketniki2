<?php


namespace workspace\modules\plan;


use core\App;

class Plan
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
//            [
//                'title' => 'Планы',
//                'url' => '/admin/plan/',
//                'icon' => '<i class="nav-icon fas fa-cloud-sun" aria-hidden="true"></i>'
//            ],
        ];

        App::mergeConfig($config);
    }
}
<?php


namespace workspace\modules\feature;


use core\App;

class Feature
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
//            [
//                'title' => 'Особенности тура',
//                'url' => '/admin/feature',
//                'icon' => '<i class="nav-icon fa fa-bars"></i>',
//            ],
        ];

        App::mergeConfig($config);
    }
}
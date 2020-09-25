<?php


namespace workspace\modules\included;


use core\App;

class Included
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
//            [
//                'title' => 'Включено в тур',
//                'url' => '/admin/included',
//                'icon' => '<i class="nav-icon fas fa-plus"></i>',
//            ],
        ];

        App::mergeConfig($config);
    }
}
<?php


namespace workspace\modules\section;


use core\App;

class Section
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Разделы',
                'url' => '/admin/section/',
                'icon' => '<i class="nav-icon fas fa-puzzle-piece" aria-hidden="true"></i>'
            ],
        ];

        App::mergeConfig($config);
    }
}
<?php

namespace workspace\modules\static_page;


use core\App;

class StaticPage
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Страницы',
                'url' => '/admin/static_page',
                'icon' => '<i class="nav-icon far fa-file-alt"></i>'
            ],
        ];

        App::mergeConfig($config);
    }
}
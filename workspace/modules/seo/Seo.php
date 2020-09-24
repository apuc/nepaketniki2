<?php


namespace workspace\modules\seo;


use core\App;

class Seo
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Seo',
                'url' => '/admin/seo/',
                'icon' => '<i class="nav-icon fas fa-users-cog" aria-hidden="true"></i>'
            ],
        ];

        App::mergeConfig($config);
    }
}
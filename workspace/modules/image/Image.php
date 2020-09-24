<?php


namespace workspace\modules\image;


use core\App;

class Image
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Картинки',
                'url' => '/admin/image',
                'icon' => '<i class="nav-icon fa fa-images"></i>',
            ],
        ];

        App::mergeConfig($config);
    }
}
<?php


namespace workspace\modules\admin_review_main_page;


use core\App;

class AdminReview
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Отзывы',
                'url' => '/admin/reviews/',
                'icon' => '<i class="nav-icon fa fa-comment" aria-hidden="true"></i>',
            ],
        ];

        App::mergeConfig($config);
    }
}
<?php


namespace workspace\modules\additional_price;


use core\App;

class AdditionalPrice
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
//            [
//                'title' => 'Доп. оплата',
//                'url' => '/admin/additional_price/',
//                'icon' => '<i class="nav-icon fas fa-euro-sign"></i>'
//            ],
        ];

        App::mergeConfig($config);
    }
}
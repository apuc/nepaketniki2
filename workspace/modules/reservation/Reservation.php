<?php


namespace workspace\modules\reservation;


use core\App;

class Reservation
{
    public static function run()
    {
        $config['adminLeftMenu'] = [
            [
                'title' => 'Бронирование',
                'url' => '/admin/reservation/',
                'icon' => '<i class="nav-icon fas fa-ticket-alt"></i>'
            ],
        ];

        App::mergeConfig($config);
    }
}
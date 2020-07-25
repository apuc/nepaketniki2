<?php


namespace workspace\modules\settings\services;


class SettingService
{
    public static $instance;

    public function __construct()
    {
        self::$instance = $this;
    }

    public static function run() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

}
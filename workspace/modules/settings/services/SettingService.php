<?php


namespace workspace\modules\settings\services;


use workspace\modules\settings\models\Settings;

class SettingService
{
    public static $instance;

    /**
     * @var Settings
     */
    protected $model;

    public function __construct()
    {
        $this->model = new Settings();
        self::$instance = $this;
    }

    public static function run()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * @param $key
     * @param string $default
     * @return string
     */
    public function get($key, $default = '')
    {
        $res = $this->model->where('key', $key)->first();
        if ($res) {
            return $res->value;
        }

        return $default;
    }

    /**
     * @param $key
     * @return mixed
     */
    public function getFull($key)
    {
        return $this->model->where('key', $key)->first();
    }

    /**
     * @param $key
     * @param $value
     * @param string $label
     * @return mixed
     */
    public function set($key, $value, $label = '')
    {
        return $this->model->updateOrCreate(['key' => $key], ['value' => $value, 'label' => $label]);
    }
}
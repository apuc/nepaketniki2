<?php


namespace workspace\modules\seo\service;


use core\View;
use workspace\modules\settings\models\Settings;

class SeoService
{
    const DEFAULT_TITLE = 'Nepaketniki';
    static $tags = ['title', 'keywords', 'description'];


    public static function setMeta(View $view, string $page, array $params = null)
    {
        foreach (self::$tags as $tag) {
            $model = Settings::where('key', 'like', "meta_$tag" . '_' . "$page")->first();
            if ($tag === 'title' AND $model !== null) {
                $params === null ? $view->setTitle($model->value) : $view->setTitle(self::setParams($model->value, $params));
            }
            if ($tag === 'description' AND $model !== null) {
                if ($params === null) {
                    $view->addMeta('description', $model->value);
                } else {
                    $view->addMeta('description', self::setParams($model->value, $params));
                }
            }
            if ($tag === 'keywords' AND $model !== null) {
                if ($params === null) {
                    $view->addMeta('keywords', $model->value);
                } else {
                    $view->addMeta('keywords', self::setParams($model->value, $params));
                }
            }
        }
        if ($view->title === 'No title' OR strlen($view->title) === 0) {
            $view->setTitle(self::DEFAULT_TITLE);
        }
    }


    protected static function setParams(string $setting, array $params)
    {
        $changed_setting = $setting;
        foreach ($params as $key_params => $val_param) {
            $changed_setting = preg_replace("@{{$key_params}}@u", $val_param, $changed_setting);
        }
        return $changed_setting;
    }
}
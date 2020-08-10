<?php


namespace workspace\modules\seo\service;


use core\View;
use workspace\modules\settings\models\Settings;

class SeoService
{
    const DEFAULT_TITLE = 'Nepaketniki';
    static $tags = ['title', 'keywords', 'description'];


    public static function setMeta(View $view, string $page)
    {
        foreach (self::$tags as $tag) {
            $model = Settings::where('key', 'like', "meta_$tag" . '_' . "$page")->first();
            if ($tag === 'title' AND $model !== null) {
                $view->setTitle($model->value);
            }
            if ($tag === 'description' AND $model !== null) {
                $view->addMeta('description', $model->value);
            }
            if ($tag === 'keywords' AND $model !== null) {
                $view->addMeta('keywords', $model->value);
            }
        }
        if ($view->title === 'No title' OR strlen($view->title) === 0) {
            $view->setTitle(self::DEFAULT_TITLE);
        }
    }
}
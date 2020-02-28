<?php


namespace workspace\controllers;


use core\App;
use core\Controller;
use core\Debug;
use workspace\models\Article;
use workspace\models\Settings;
use Illuminate\Support\Facades\DB;

class ApiController extends Controller
{
    public function actionGetArticle()
    {
        $json = file_get_contents('php://input');
        $data = json_decode($json);

        if($data) {
            $a = new Article();
            $a->name = $data->title;
            $a->text = $data->article;
            $a->language_id = $data->language_id;
            $a->save();
        }
    }

    public function actionSetOptions()
    {
        App::$header->add('Access-Control-Allow-Origin', '*');
        //App::$header->add('Content-type', 'application/json');

        $json = file_get_contents('php://input');
        $data = json_decode($json);

        
        if($data)
            foreach ($data as $value)
                foreach ($value as $val) {
                    $current_settings = Settings::where('key', $val->key)->first();
                    if(!$current_settings) {
                        $settings = new Settings();
                        $settings->key = $val->key;
                        $settings->value = $val->value;
                        $settings->save();
                    } else {
                        $current_settings->key = $val->key;
                        $current_settings->value = $val->value;
                        $current_settings->save();
                    }
                }
    }

    public function actionGetOptions()
    {
        $current_settings = Settings::all();
        $current_settings = json_encode($current_settings);
        return $current_settings;
    }
}
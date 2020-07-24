<?php


namespace workspace\modules\admin_review_main_page\models;


use Illuminate\Database\Eloquent\Model;

class MainPageReview extends Model
{
    protected $table = "main_page_review";

    public $fillable = ['name', 'instagram_link', 'avatar', 'text'];

}
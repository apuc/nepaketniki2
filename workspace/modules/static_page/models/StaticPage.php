<?php


namespace workspace\modules\static_page\models;


use Illuminate\Database\Eloquent\Model;

class StaticPage extends Model
{
    protected $table = "static_page";

    public $fillable = ['name', 'slug', 'content', 'layout', 'status'];
}
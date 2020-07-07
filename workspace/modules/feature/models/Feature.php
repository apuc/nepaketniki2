<?php


namespace workspace\modules\feature\models;


use Illuminate\Database\Eloquent\Model;

class Feature extends Model
{
    protected $table = "feature";

    public $fillable = ['tour_id', 'feature', 'type'];
}
<?php


namespace workspace\modules\plan\models;


use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    protected $table = "plan";

    public $fillable = ['tour_id', 'day', 'info', 'dates', 'description'];

}
<?php


namespace workspace\modules\date\models;


use Illuminate\Database\Eloquent\Model;

class Date extends Model
{
    protected $table = "date";

    public $fillable = ['tour_id', 'dates', 'remaining_places'];
}
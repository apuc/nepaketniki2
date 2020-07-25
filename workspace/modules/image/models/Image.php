<?php


namespace workspace\modules\image\models;


use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $table = "image";

    public $fillable = ['image'];

    public function image()
    {
        return $this->hasMany('workspace\modules\plan_images\models\PlanImages');
    }
}
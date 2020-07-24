<?php


namespace workspace\modules\plan_images\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\plan\requests\PlanSearchRequest;

class PlanImages extends Model
{
    protected $table = "plan_images";

    public $fillable = ['plan_id', 'image_id'];

    public function _save(int $plan_id, int $image_id)
    {
        $this->plan_id = $plan_id;
        $this->image_id = $image_id;

        $this->save();
    }
}
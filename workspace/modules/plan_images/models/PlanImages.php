<?php


namespace workspace\modules\plan_images\models;


use Illuminate\Database\Eloquent\Model;

class PlanImages extends Model
{
    public $fillable = ['plan_id', 'image_id', '$tour_id'];
    protected $table = "plan_images";

    public function _save(int $plan_id, int $image_id, int $tour_id)
    {
        $this->plan_id = $plan_id;
        $this->image_id = $image_id;
        $this->tour_id = $tour_id;

        $this->save();
    }

    public function image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }
}
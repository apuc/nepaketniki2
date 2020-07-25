<?php


namespace workspace\modules\plan\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\plan\requests\PlanSearchRequest;

class Plan extends Model
{
    protected $table = "plan";

    public $fillable = ['tour_id', 'day', 'info', 'date', 'description'];

    public function _save(PlanSearchRequest $request)
    {
        $this->tour_id = $request->tour_id;
        $this->day = $request->day;
        $this->info = $request->info;
        $this->date = $request->date;
        $this->description = $request->description;

        $this->save();
    }

    public function images()
    {
        return $this->hasMany('workspace\modules\plan_images\models\PlanImages');
    }
}
<?php


namespace workspace\modules\date\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\date\requests\DateRequest;

class Date extends Model
{
    protected $table = "date";

    public $fillable = ['tour_id', 'tour_dates', 'remaining_places'];

    public function _save(DateRequest $request)
    {
        $this->tour_id = $request->tour_id;
        $this->remaining_places = $request->remaining_places;
        $this->tour_dates = $request->tour_dates;

        $this->save();
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tour()
    {
        return $this->belongsTo('workspace\modules\tour\models\Tour');
    }
}
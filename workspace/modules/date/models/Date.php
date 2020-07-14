<?php


namespace workspace\modules\date\models;


use core\Debug;
use Illuminate\Database\Eloquent\Model;

class Date extends Model
{
    protected $table = "date";

    public $fillable = ['tour_id', 'dates', 'remaining_places'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function tour()
    {
        return $this->belongsTo('workspace\modules\tour\models\Tour');
    }

    public function _save()
    {
        if(isset($_POST['dates']))
            $this->dates = $_POST['dates'];
        if(isset($_POST['tour_id']))
            $this->tour_id = $_POST['tour_id'];
        if(isset($_POST['remaining_places']))
            $this->remaining_places = $_POST['remaining_places'];

        $this->save();
    }
}
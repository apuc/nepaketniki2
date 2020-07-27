<?php


namespace workspace\modules\reservation\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\reservation\requests\ReservationRequests;

class ReservationModel extends Model
{
    protected $table = "reservation";

    public $fillable = ['tour_id', 'name', 'phone', 'email', 'text'];

    public function _save(ReservationRequests $requests)
    {
        $this->name = $requests->name;
        $this->email = $requests->email;
        $this->phone = $requests->phone;
        $this->save();
    }
}
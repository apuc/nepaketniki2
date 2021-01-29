<?php

namespace workspace\modules\payments_tour\models;

use Illuminate\Database\Eloquent\Model;

class PaymentTour extends Model
{
    public $table = 'payments_tour';

    public $timestamps = false;

    protected $fillable = ['tour_id', 'title', 'description'];

    public function _save()
    {
        $this->tour_id = $_POST['tour_id'];
        $this->title = $_POST['title'];
        $this->description = $_POST['description'];
        $this->save();
    }
}

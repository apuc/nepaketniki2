<?php


namespace workspace\modules\subscription\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\subscription\requests\SubscriptionRequest;

class SubscriptionModel extends Model
{
    protected $table = "subscription";

    public $fillable = ['name', 'phone'];

    public function _save(SubscriptionRequest $request)
    {
        $this->name = $request->name;
        $this->phone = $request->phone;

        $this->save();
    }
}
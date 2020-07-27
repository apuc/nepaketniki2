<?php


namespace workspace\modules\additional_price\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\additional_price\requests\AdditionalPriceRequest;

class AdditionalPrice extends Model
{
    protected $table = "additional_price";

    public $fillable = ['tour_id', 'text'];

    public function _save(AdditionalPriceRequest $request)
    {
        $this->tour_id = $request->tour_id;
        $this->text = $request->text;

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
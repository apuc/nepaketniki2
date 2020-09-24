<?php


namespace workspace\modules\included\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\included\requests\IncludedRequest;

class Included extends Model
{
    protected $table = "included";

    public $fillable = ['tour_id', 'column_side', 'text'];


    public function _save(IncludedRequest $request)
    {
        $this->tour_id = $request->tour_id;
        $this->text = $request->text;
        $this->column_side = $request->column_side;
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
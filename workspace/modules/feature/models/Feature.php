<?php


namespace workspace\modules\feature\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\feature\requests\FeatureSearchRequest;

class Feature extends Model
{
    protected $table = "feature";

    public $fillable = ['tour_id', 'feature', 'type'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function tour()
    {
        return $this->belongsTo('workspace\modules\tour\models\Tour');
    }

    /**
     * @param FeatureSearchRequest $request
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public static function search(FeatureSearchRequest $request)
    {
        $query = self::query();

        if ($request->feature)
            $query->where('feature', 'LIKE', "$request->feature");

        if ($request->type)
            $query->where('type', 'LIKE', "$request->type");

        if ($request->_tour) {
            $query->whereHas('tour', function ($q) use ($request) {
                $q->where('tour', 'LIKE', "%$request->_tour%");
            });
        }

        return $query->get();
    }
}
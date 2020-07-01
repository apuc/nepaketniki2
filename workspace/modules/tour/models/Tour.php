<?php


namespace workspace\modules\tour\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\tour\requests\TourSearchRequest;

class Tour extends Model
{
    protected $table = "tour";

    public $fillable = ['name', 'main_description', 'front_description', 'front_date', 'front_places_remaining',
        'price', 'difficulties_and_weather', 'amount_of_places', 'reservation_title', 'image_id'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }

    /**
     * @param TourSearchRequest $request
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public static function search(TourSearchRequest $request)
    {
        $query = self::query();

        if ($request->name)
            $query->where('name', 'LIKE', "%$request->name%");

        if ($request->main_description)
            $query->where('main_description', 'LIKE', "%$request->main_description%");

        if ($request->front_description)
            $query->where('front_description', 'LIKE', "$request->front_description");

        if ($request->front_date)
            $query->where('front_date', 'LIKE', "$request->front_date");

        if ($request->front_places_remaining)
            $query->where('front_places_remaining', 'LIKE', "$request->front_places_remaining");

        if ($request->price)
            $query->where('price', 'LIKE', "$request->price");

        if ($request->difficulties_and_weather)
            $query->where('difficulties_and_weather', 'LIKE', "$request->difficulties_and_weather");

        if ($request->amount_of_places)
            $query->where('amount_of_places', 'LIKE', "$request->amount_of_places");

        if ($request->reservation_title)
            $query->where('reservation_title', 'LIKE', "$request->reservation_title");

        if ($request->img) {
            $query->whereHas('image', function ($q) use ($request){
                $q->where('image', 'LIKE', "%$request->img%");
            });
        }
        if ($request->image_id)
            $query->where('image_id', 'LIKE', "$request->image_id");

        return $query->get();
    }
}
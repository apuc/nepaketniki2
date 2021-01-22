<?php


namespace workspace\modules\tour\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\image\models\Image;
use workspace\modules\tour\requests\TourSearchRequest;

class Tour extends Model
{
    protected $table = "tour";

    /**
     * @var string[]
     */
    protected $fillable = ['name', 'main_description', 'front_description', 'front_date', 'front_places_remaining',
        'price', 'difficulties_and_weather', 'amount_of_places', 'reservation_title', 'visa', 'image_id',
        'title_image_id', 'activities_title', 'amount_activities_items_1', 'amount_activities_items_2', 'bg_image_id', 'title_text'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }

    public function title_image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }

    public function bg_image()
    {
        return $this->belongsTo('workspace\modules\image\models\Image');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dates()
    {
        return $this->hasMany('workspace\modules\date\models\Date');
    }

    public function plans()
    {
        return $this->hasMany('workspace\modules\plan\models\Plan')->orderBy('day', 'asc');
    }

    public function included()
    {
        return $this->hasMany('workspace\modules\included\models\Included')->orderBy('id', 'asc');
    }

    public function sections()
    {
        return $this->hasMany('workspace\modules\section\models\Section')->orderBy('priority', 'desc');;
    }

    public function additional_price()
    {
        return $this->hasMany('workspace\modules\additional_price\models\AdditionalPrice');//->orderBy('id', 'asc');
    }

    public function reviews()
    {
        return $this->hasMany('workspace\modules\admin_review_main_page\models\MainPageReview');
    }

    public function payments_tour()
    {
        return $this->hasOne('workspace\modules\payments_tour\models\PaymentTour');
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

        if ($request->visa)
            $query->where('visa', 'LIKE', "$request->visa");

        /*if ($request->activities_title)
            $query->where('activities_title', 'LIKE', "$request->activities_title");*/

        if ($request->img) {
            $query->whereHas('image', function ($q) use ($request){
                $q->where('image', 'LIKE', "%$request->img%");
            });
        }

        if ($request->title_img) {
            $query->whereHas('title_image', function ($q) use ($request){
                $q->where('image', 'LIKE', "%$request->title_img%");
            });
        }

        if ($request->bg_img) {
            $query->whereHas('bg_img', function ($q) use ($request){
                $q->where('image', 'LIKE', "%$request->bg_img%");
            });
        }


        return $query->get();
    }

    public function _save(TourSearchRequest $request)
    {
        $this->name = $request->name;
        $this->main_description = $request->main_description;
        $this->price = $request->price;
        $this->front_description = $request->front_description;
        $this->front_date = $request->front_date;
        $this->front_places_remaining = $request->front_places_remaining;
        $this->difficulties_and_weather = $request->difficulties_and_weather;
        $this->amount_of_places = $request->amount_of_places;
        $this->visa = $request->visa;
        $this->activities_title = $request->activities_title;
        $this->reservation_title = $request->reservation_title;
        $this->image_id = $request->image_id;
        $this->title_text = $request->title_text;

        $image_id = new Image();
        $image_id->_save($request->image_id);
        $this->image_id = $image_id->id;

        $title_image_id = new Image();
        $title_image_id->_save($request->title_image_id);
        $this->title_image_id = $title_image_id->id;

        $bg_image_id = new Image();
        $bg_image_id->_save($request->bg_image_id);
        $this->bg_image_id = $bg_image_id->id;

        $this->amount_activities_items_1 = $request->amount_activities_items_1;
        $this->amount_activities_items_2 = $request->amount_activities_items_2;

        $this->save();
    }

    public static function isTourExist($id)
    {
        $tours_id = Tour::select('id')->get()->toArray();
        foreach ($tours_id as $tour_id) {
            if ($tour_id['id'] == $id) {
                return true;
            }
        }
        return false;
    }
}
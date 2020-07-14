<?php


namespace workspace\modules\tour\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\tour\requests\TourSearchRequest;

class Tour extends Model
{
    protected $table = "tour";

    public $fillable = ['name', 'main_description', 'front_description', 'front_date', 'front_places_remaining',
        'price', 'difficulties_and_weather', 'amount_of_places', 'reservation_title', 'visa', 'image_id',
        'title_image_id', 'activities_title', 'amount_activities_items_1', 'amount_activities_items_2', 'bg_image_id'];

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

        if ($request->activities_title)
            $query->where('activities_title', 'LIKE', "$request->activities_title");

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

    public function _save()
    {
        if(isset($_POST['name']))
            $this->name = $_POST['name'];
        if(isset($_POST['main_description']))
            $this->main_description = $_POST['main_description'];
        if(isset($_POST['front_description']))
            $this->front_description = $_POST['front_description'];
        if(isset($_POST['front_date']))
            $this->front_date = $_POST['front_date'];
        if(isset($_POST['front_places_remaining']))
            $this->front_places_remaining = $_POST['front_places_remaining'];
        if(isset($_POST['price']))
            $this->price = $_POST['price'];
        if(isset($_POST['difficulties_and_weather']))
            $this->difficulties_and_weather = $_POST['difficulties_and_weather'];
        if(isset($_POST['amount_of_places']))
            $this->amount_of_places = $_POST['amount_of_places'];
        if(isset($_POST['visa']))
            $this->visa = $_POST['visa'];
        if(isset($_POST['activities_title']))
            $this->activities_title = $_POST['activities_title'];
        if(isset($_POST['reservation_title']))
            $this->reservation_title = $_POST['reservation_title'];
        if(isset($_POST['image_id']))
            $this->image_id = (int)$_POST['image_id'];
        if(isset($_POST['title_image_id']))
            $this->title_image_id = (int)$_POST['title_image_id'];
        if(isset($_POST['bg_image_id']))
            $this->bg_image_id = (int)$_POST['bg_image_id'];
        if(isset($_POST['amount_activities_items_1']))
            $this->amount_activities_items_1 = (int)$_POST['amount_activities_items_1'];
        if(isset($_POST['amount_activities_items_2']))
            $this->amount_activities_items_2 = (int)$_POST['amount_activities_items_2'];

        $this->save();
    }
}
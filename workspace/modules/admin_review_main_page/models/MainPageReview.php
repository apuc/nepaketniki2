<?php


namespace workspace\modules\admin_review_main_page\models;


use core\Debug;
use Illuminate\Database\Eloquent\Model;
use workspace\modules\admin_review_main_page\requests\ReviewRequest;

class MainPageReview extends Model
{
    protected $table = "main_page_review";

    public $fillable = ['name', 'tour_id', 'instagram_link', 'avatar', 'text', 'priority'];

    public function _save(ReviewRequest $request)
    {
        $this->name = $request->name;
        $this->tour_id = $request->tour_id;
        $this->instagram_link = $request->instagram_link;
        if ($request->avatar !== $this->avatar) $this->avatar = $request->avatar;
        $this->text = $request->text;
        $this->priority = $request->priority;

        $this->save();
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tour()
    {
        return $this->belongsTo('workspace\modules\tour\models\Tour');
    }

    /**
     * @param ReviewRequest $request
     */
    public static function search(ReviewRequest $request)
    {
        $query = self::query();

        if (isset($request->prioritySearch) && $request->prioritySearch)
            $query->where('priority', 'LIKE', "%$request->prioritySearch%");

        if (isset($request->nameSearch) && $request->nameSearch)
            $query->where('name', 'LIKE', "%$request->nameSearch%");

        if (isset($request->instagram_linkSearch) && $request->instagram_linkSearch)
            $query->where('instagram_link', 'LIKE', "$request->instagram_linkSearch");

        if (isset($request->textSearch) && $request->textSearch)
            $query->where('tour.name', 'LIKE', "$request->textSearch");

        return $query->get();
    }
}
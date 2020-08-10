<?php


namespace workspace\modules\seo\model;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\seo\requests\SeoRequest;

class Seo extends Model
{
    public $fillable = ['title', 'keywords', 'description', 'page'];
    protected $table = "seo";

    public function _save(SeoRequest $request)
    {
        $this->title = $request->title;
        $this->keywords = $request->keywords;
        $this->description = $request->description;
        $this->page = $request->page;

        $this->save();
    }
}
<?php


namespace workspace\modules\static_page\models;


use Illuminate\Database\Eloquent\Model;
use workspace\modules\static_page\requests\StaticPageRequest;

class StaticPage extends Model
{
    protected $table = "static_page";

    public $fillable = ['name', 'slug', 'content', 'layout', 'view', 'status'];

    public function _save(StaticPageRequest $request)
    {
        $this->name = $request->name;
        $this->slug = $request->slug;
        $this->content = $request->content;
        $this->layout = $request->layout;
        $this->view = $request->view;
        $this->status = $request->status === 'true' ? true : false;

        $this->save();
    }
}
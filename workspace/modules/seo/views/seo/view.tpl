{assign var="url" value="{'seo/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->page, 'url' => $url])}
<div class="h1">{$model->page}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}
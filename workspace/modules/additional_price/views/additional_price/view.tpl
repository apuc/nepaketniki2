{assign var="url" value="{'admin/additional_price/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->tour->name, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}
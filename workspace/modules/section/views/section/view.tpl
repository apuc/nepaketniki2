{assign var="url" value="{'section/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->name, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}
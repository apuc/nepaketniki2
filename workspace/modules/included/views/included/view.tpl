{assign var="url" value="{'review/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}
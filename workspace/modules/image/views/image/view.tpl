{core\App::$breadcrumbs->addItem(['text' => 'Просмотр'])}
{assign var="url" value="{'image/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => $url])}
<div class="h1">{$model->name}</div>

{core\DetailView::widget()->setParams($model, $options)->run()}
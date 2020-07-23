{assign var="url" value="{'reviews/'}{$model->id}"}
{assign var="root" value="{$smarty.server.DOCUMENT_ROOT}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Edit'])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" enctype="multipart/form-data" name="edit_form" id="edit_form" method="post" action="/admin/reviews/update/{$model->id}">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" value="{$model->name}" />
        </div>
        <div class="form-group">
            <label for="instagramLinks">Инстаграм:</label>
            <input type="text" name="instagramLinks" id="instagramLinks" class="form-control" required="required" value="{$model->instagramLinks}" />
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'avatar'])->run()}
        <div class="form-group">
            <label for="text">Отзыв:</label>
            <input type="text" name="text" id="text" class="form-control" required="required" value="{$model->text}" />
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>
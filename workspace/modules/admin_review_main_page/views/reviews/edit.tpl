{assign var="url" value="{'reviews/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" enctype="multipart/form-data" name="edit_form" id="edit_form" method="post" action="/admin/reviews/update/{$model->id}">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" value="{$model->name}" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="instagram_link">Инстаграм:</label>
            <input type="text" name="instagram_link" id="instagram_link" class="form-control" required="required" value="{$model->instagram_link}" />
            <small id="instagram_linkMessage" class="form-text">{if isset($errors['instagram_link'])}{$errors['instagram_link']}{/if}</small>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'avatar', 'value' => {$model->avatar}, 'label' => 'Аватар:'])->run()}
        <div class="form-group">
            <label for="text">Отзыв:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text', 'id' => 'text_editor', 'text' => {$model->text}])->run()}
            <small id="text" class="form-text">{if isset($errors['text'])}{$errors['text']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="priority">Приоритет:</label>
            <input type="text" name="priority" id="priority" class="form-control" required="required" value="{$model->priority}" />
            <small id="priorityMessage" class="form-text">{if isset($errors['priority'])}{$errors['priority']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
{core\App::$breadcrumbs->addItem(['text' => $model->name])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/static_page/update/{$model->id}">
        <div class="form-group">
            <label for="name">Название:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" value="{$model->name}"/>
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Адрес:</label>
            <input type="text" name="slug" id="slug" class="form-control" required="required" value="{$model->slug}"/>
            <small id="slugMessage" class="form-text">{if isset($errors['slug'])}{$errors['slug']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text_editor_content">Контент:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'content', 'id' => 'text_editor_content', 'text' => {$model->content}])->run()}
            <small id="descriptionMessage" class="form-text">{if isset($errors['content'])}{$errors['content']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Шаблон:</label>
            <input type="text" name="layout" id="layout" class="form-control" value="{$model->layout}"/>
{*            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'layout', 'label' => 'Шаблон:', 'id' => 'layout', 'value' => {$model->layout}])->run()}*}
            <small id="layoutMessage" class="form-text">{if isset($errors['layout'])}{$errors['layout']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Вид:</label>
            <input type="text" name="view" id="view" class="form-control" value="{$model->view}"/>
{*            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'view', 'label' => 'Вид:', 'id' => 'view', 'value' => {$model->view}])->run()}*}
            <small id="viewMessage" class="form-text">{if isset($errors['view'])}{$errors['view']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" id="active" value="true" {if $model->status eq 1}checked{/if}>
                <label class="form-check-label" for="active">
                    Активна
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" id="inactive" value="false" {if $model->status eq 0}checked{/if}>
                <label class="form-check-label" for="inactive">
                    Не активна
                </label>
            </div>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
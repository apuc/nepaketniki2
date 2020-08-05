{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1}</div></br>
<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/business/update/{$model->id}">
        <div class="form-group">
            <label for="name">Заголовок:</label>
            <input type="text" name="header" id="header" class="form-control" required="required" value="{$model->header}"/>
            <small id="headerMessage" class="form-text">{if isset($errors['header'])}{$errors['header']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 1:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_1', 'id' => 'text_editor', 'text' => $model->text_block_1])->run()}
            <small id="text_block_1Message" class="form-text">{if isset($errors['text_block_1'])}{$errors['text_block_1']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 2:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_2', 'id' => 'text_editor', 'text' => $model->text_block_2])->run()}
            <small id="text_block_2Message" class="form-text">{if isset($errors['text_block_2'])}{$errors['text_block_2']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 3:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_3', 'id' => 'text_editor', 'text' => $model->text_block_3])->run()}
            <small id="text_block_3Message" class="form-text">{if isset($errors['text_block_3'])}{$errors['text_block_3']}{/if}</small>
        </div>
        {$i = 1}
        {for $i=1 to 6}
            {if isset($model->images[$i-1]->image->image)}
                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}", 'value' => $model->images[{$i}-1]->image->image])->run()}
            {else}
                {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}", 'value' => ''])->run()}{/if}
        {/for}
{*        <div class="btn btn-dark" id="add_image_field">Добавить картинку</div>*}
        <div class="form-group" id="insert-before">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>

{*        <script>*}
{*            $('#add_image_field').click(function () {*}
{*                $('{workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(["name" => "images[]", "label" => "Картинка 7:", "id" => "_image_7"])->run()}').insertBefore('#insert-before');*}
{*            });*}
{*        </script>*}

    </form>
</div>
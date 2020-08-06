{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
{assign var=count_images value=6}
{if isset($new_count_images)}
    {$count_images=$new_count_images}
{/if}

<div class="h1">{$h1}</div></br>

<div class="container">
    <form class="form-horizontal" name="image_change_form" id="create_form" method="post" action="/admin/business/create">
        <div class="form-group">
            <label for="count_imagesMessage">Количество картинок:</label>
            <input type="text" name="count_images" id="header" class="form-control"
                   required="required" value="{$count_images}"/>
            <small id="count_imagesMessage" class="form-text">{if isset($errors['count_images'])}{$errors['count_images']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit_count_images" id="submit_button_count_images" class="btn btn-dark" value="Изменить количество картинок">
        </div>
    </form>
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/business/create">
        <div class="form-group">
            <label for="name">Заголовок:</label>
            <input type="text" name="header" id="header" class="form-control" required="required" />
            <small id="headerMessage" class="form-text">{if isset($errors['header'])}{$errors['header']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 1:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_1', 'id' => 'text_editor'])->run()}
            <small id="text_block_1Message" class="form-text">{if isset($errors['text_block_1'])}{$errors['text_block_1']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 2:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_2', 'id' => 'text_editor'])->run()}
            <small id="text_block_2Message" class="form-text">{if isset($errors['text_block_2'])}{$errors['text_block_2']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="text">Текстовый блок 3:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'text_block_3', 'id' => 'text_editor'])->run()}
            <small id="text_block_3Message" class="form-text">{if isset($errors['text_block_3'])}{$errors['text_block_3']}{/if}</small>
        </div>
        {for $i=1 to $count_images}
            {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'images[]', 'label' => "Картинка {$i}:", 'id' => "_image_{$i}"])->run()}
        {/for}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
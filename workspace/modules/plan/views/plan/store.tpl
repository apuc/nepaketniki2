{core\App::$breadcrumbs->addItem(['text' => 'Создание плана'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/plan/create">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=tour}
                    <option value="{$tour->id}">{$tour->name} {$tour->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="name">День:</label>
            <input type="text" name="day" id="day" class="form-control" required="required" />
            <small id="dayMessage" class="form-text">{if isset($errors['day'])}{$errors['day']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Даты:</label>
            <input type="text" name="date" id="date" class="form-control"/>
            <small id="dateMessage" class="form-text">{if isset($errors['date'])}{$errors['date']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Описание:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'description', 'id' => 'text_editor_description'])->run()}
            <small id="descriptionMessage" class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Информация:</label>
            {workspace\modules\ckeditor\widgets\CkEditorWidget::widget(['name' => 'info', 'id' => 'text_editor_info'])->run()}
            <small id="infoMessage" class="form-text">{if isset($errors['info'])}{$errors['info']}{/if}</small>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 1:', 'id' => '_image_1'])->run()}
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 2:', 'id' => '_image_2'])->run()}
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 3:', 'id' => '_image_3'])->run()}
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 4:', 'id' => '_image_4'])->run()}
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 5:', 'id' => '_image_5'])->run()}
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 6:', 'id' => '_image_6'])->run()}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
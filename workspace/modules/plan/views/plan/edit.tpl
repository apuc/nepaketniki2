{assign var="url" value="{'plan/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Edit'])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/plan/update/{$model->id}">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    <option value="{$item->id}">{$item->name} {$item->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="name">День:</label>
            <input type="text" name="day" id="day" class="form-control" required="required" value="{$model->day}"/>
            <small id="dayMessage" class="form-text">{if isset($errors['day'])}{$errors['day']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="date">Даты:</label>
            <input type="text" name="date" id="date" class="form-control" required="required" value="{$model->date}"/>
            <small id="dateMessage" class="form-text">{if isset($errors['date'])}{$errors['date']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Описание:</label>
            <textarea rows="3" name="description" id="description" class="form-control" required="required">{$model->description}</textarea>
            <small id="descriptionMessage" class="form-text">{if isset($errors['description'])}{$errors['description']}{/if}</small>
        </div>
        <div class="form-group mt-3">
            <label for="text">Информация:</label>
            <textarea rows="9" name="info" id="info" class="form-control" required="required">{$model->info}</textarea>
            <small id="infoMessage" class="form-text">{if isset($errors['info'])}{$errors['info']}{/if}</small>
        </div>
        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image', 'label' => 'Картинка 1:', 'id' => 'picture_1'])->run()}
{*        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 2:', 'id' => 'picture_2'])->run()}*}
{*        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 3:', 'id' => 'picture_3'])->run()}*}
{*        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 4:', 'id' => 'picture_4'])->run()}*}
{*        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 5:', 'id' => 'picture_5'])->run()}*}
{*        {workspace\modules\elfinder\widgets\ElfinderBtnWidget::widget(['name' => 'image[]', 'label' => 'Картинка 6:', 'id' => 'picture_6'])->run()}*}
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
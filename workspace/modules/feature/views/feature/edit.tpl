{assign var="url" value="{'feature/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->name, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/feature/update/{$model->id}">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    {if $item->id == $model->tour_id}
                        <option selected value="{$item->id}">{$item->name} {$item->price}</option>
                    {else}
                        <option value="{$item->id}">{$item->name} {$item->price}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="feature">Особенность:</label>
            <input type="text" name="feature" id="feature" class="form-control" value="{$model->feature}" />
            <small id="featureMessage" class="form-text">{if isset($errors['feature'])}{$errors['feature']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="type">Тип:</label>
            <select class="form-control" name="type" id="type">
                {if $model->type == "Включено в стоимость"}
                    <option selected value="Включено в стоимость">Включено в стоимость</option>
                    <option value="Что сделаем">Что сделаем</option>
                {else}
                    <option value="Включено в стоимость">Включено в стоимость</option>
                    <option selected value="Что сделаем">Что сделаем</option>
                {/if}
            </select>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
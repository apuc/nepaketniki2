{assign var="url" value="{'date/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->name, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1} {$model->name}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/date/update/{$model->id}">
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
            <label for="tour_dates">Даты:</label>
            <input type="text" name="tour_dates" id="tour_dates" class="form-control" value="{$model->tour_dates}" />
            <small id="tour_datesMessage" class="form-text">{if isset($errors['tour_dates'])}{$errors['tour_dates']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="remaining_places">Оставшиеся места:</label>
            <input type="text" name="remaining_places" id="remaining_places" class="form-control" value="{$model->remaining_places}" />
            <small id="remaining_placesMessage" class="form-text">{if isset($errors['remaining_places'])}{$errors['remaining_places']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
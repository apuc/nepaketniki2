{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/date/create">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    <option value="{$item->id}">{$item->name} {$item->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="tour_dates">Даты:</label>
            <input type="text" name="tour_dates" id="tour_dates" class="form-control" />
            <small id="tour_datesMessage" class="form-text">{if isset($errors['tour_dates'])}{$errors['tour_dates']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="remaining_places">Оставшиеся места:</label>
            <input type="text" name="remaining_places" id="remaining_places" class="form-control" />
            <small id="remaining_placesMessage" class="form-text">{if isset($errors['remaining_places'])}{$errors['remaining_places']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
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
            <label for="dates">Даты:</label>
            <input type="text" name="dates" id="dates" class="form-control" />
        </div>
        <div class="form-group">
            <label for="remaining_places">Оставшиеся места:</label>
            <input type="text" name="remaining_places" id="remaining_places" class="form-control" />
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>
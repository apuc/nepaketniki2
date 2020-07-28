{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/feature/create">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id">
                {foreach from=$tours item=item}
                    <option value="{$item->id}">{$item->name} {$item->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="feature">Особенность:</label>
            <input type="text" name="feature" id="feature" class="form-control" />
        </div>
        <div class="form-group">
            <label for="type">Тип:</label>
            <select class="form-control" name="type" id="type">
                <option value="Включено в стоимость">Включено в стоимость</option>
                <option value="Что сделаем">Что сделаем</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Submit">
        </div>
    </form>
</div>
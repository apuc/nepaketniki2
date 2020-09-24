{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
<div class="h1">{$h1}</div>

<div class="container">
    <form class="form-horizontal" name="create_form" id="create_form" method="post" action="/admin/settings/create">
        <div class="form-group">
            <label for="firstname">Ключ:</label>
            <input type="text" name="key" id="key" class="form-control" required="required" />
        </div>
        <div class="form-group">
            <label for="firstname">Метка:</label>
            <input type="text" name="label" id="key" class="form-control" />
        </div>
        <div class="form-group">
            <label for="lastname">Значение:</label>
            <textarea rows="7" name="value" id="value" class="form-control" required="required"></textarea>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
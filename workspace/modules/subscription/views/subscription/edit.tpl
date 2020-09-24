{assign var="url" value="{'subscription/'}{$model->id}"}
{core\App::$breadcrumbs->addItem(['text' => $model->username, 'url' => {$url}])}
{core\App::$breadcrumbs->addItem(['text' => 'Редактирование'])}
<div class="h1">{$h1} {$model->name}</div></br>

<div class="container">
    <form class="form-horizontal" name="edit_form" id="edit_form" method="post" action="/admin/subscription/update/{$model->id}">
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" value="{$model->name}" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="phone">Номер телефона:</label>
            <input type="text" name="phone" id="phone" class="form-control" required="required" value="{$model->phone}" />
            <small id="phoneMessage" class="form-text">{if isset($errors['phone'])}{$errors['phone']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
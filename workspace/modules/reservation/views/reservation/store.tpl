{core\App::$breadcrumbs->addItem(['text' => 'Создание'])}
{*<div class="h1">{$h1}</div>*}

<div class="container">
    <form class="form-horizontal" name="edit_form" id="edit_form" method="post" action="/admin/reservation/create">
        <div class="form-group">
            <label for="tour_id">Тур:</label>
            <select class="form-control" name="tour_id" id="tour_id" >
                {foreach from=$tours item=item}
                    <option value="{$item->id}">{$item->name} {$item->price}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group">
            <label for="name">Имя:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" />
            <small id="nameMessage" class="form-text">{if isset($errors['name'])}{$errors['name']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="phone">Номер телефона:</label>
            <input type="number" name="phone" id="phone"  class="form-control" required="required" />
            <small id="phoneMessage" class="form-text">{if isset($errors['phone'])}{$errors['phone']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" class="form-control" required="required" />
            <small id="emailMessage" class="form-text">{if isset($errors['email'])}{$errors['email']}{/if}</small>
        </div>
        <div class="form-group">
            <label for="updated_at">Дата:</label>
            <input type="text" name="updated_at" id="updated_at" class="form-control" required="required" />
            <small id="updated_atMessage" class="form-text">{if isset($errors['updated_at'])}{$errors['updated_at']}{/if}</small>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" id="submit_button" class="btn btn-dark" value="Подтвердить">
        </div>
    </form>
</div>
<div class="-single-tour-form">
    <div class="-single-tour-form__column -single-tour-form__column--wide">
        <h3 class="-single-tour-form__title">{$model->reservation_title}</h3>
        <p class="-single-tour-form__proposition">
            Смело заполняйте форму и жмите кнопку
            “Забронировать место” или напишите нам
            в <strong>Instagram</strong> в Direct (@nepaketniki), или в
            <strong>Telegram/WhatsApp/Viber</strong> по номеру
        <p class="-single-tour-form__number">+38 099 490 24 54</p>
        </p>
    </div>
    <form name="request-form" id="request-form" method="post">
        <div class="-single-tour-form__column -single-tour-form__column--thin">
            <div class="-single-tour-form__inputs">
                <div class="-single-tour-form__input">
                    <input id="name" name="name" type="text" placeholder="Введите имя"/>
                </div>
                <div class="-single-tour-form__input">
                    <input id="phone" name='phone' type="text" placeholder="Введите телефон"/>
                </div>
                <div class="-single-tour-form__input">
                    <input id="email" name="email" type="email" placeholder="Введите емаил"/>
                </div>
                <input name="id" type="hidden" value=>
                <div class="-single-tour-form__button">
                    <button id="submit" name="submit" type="submit">Забронировать место</button>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="-tours-header">
  <div class="container">
    <div class="menu" id="menu">
      <div class="menu__icon" id="menuIcon">
        <div class="squares">
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
          <div class="square"></div>
        </div>
      </div>
      <div class="menu__list" id="menuList">
        <div class="menu__item"><a href="#travels">О нас</a></div>
        <div class="menu__item"><a href="#schedule">Расписание</a></div>
        <div class="menu__item"><a href="#comments">Отзывы</a></div>
        <div class="menu__item"><a href="/">Фотоотчёты</a></div>
        <div class="menu__item"><a href="/">Для бизнеса</a></div>
        <div class="menu__item"><a href="/">Контакты</a></div>
      </div>
    </div>
    <div class="header__nav-info" id="headerNavInfo">
        {include file='includes/nav_menu.tpl'}
        {include file='includes/contacts.tpl'}
    </div>
    <div class="schedule-heading">
      <h3 class="schedule-heading__title">Расписание авторских туров</h3>
      <p class="schedule-heading__proposition">
        Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего
        <a href='{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}' target="_blank">блога в Инстаграм</a>,
        а можете отправиться в незабываемое приключение вместе с нами.
      </p>
    </div>
  </div>
</div>
<div class="-tours-list">
  <div class="container">
    {foreach from=$model item=item}
    <div class="-tours-item">
      <div class="tour-logo">
        <div class="tour-logo__wrapper">
          <div class="circle small">
          </div>
          <div class="tour-logo__title">
            <h3>{$item->name}</h3>
          </div>
        </div><img class="tour-logo__image" src="{$item->image->image}" alt="Картинка тура"/>
      </div>
      <div class="-tours-info">
          <div class="-tours-info__dates">
{*              {foreach from=$model->dates item=item}*}
{*                  <p class="-tours-info__date">{$item->dates}</p>*}
{*              {/foreach}*}
          </div>

          <p class="-tours-info__price">{$item->price}</p>
          {*            <p class="-tours-info__price">850 евро + авиаперелёт</p>*}
{*            <p class="-tours-info__discount-price">825 евро - до 15 июля</p>*}
        <div class="button">
          <button onClick='location.href="/tour/{$item->id}"'>Программа тура</button>
        </div>
      </div>
      <div class="-tours-description">
        <p class="-tours-description__main">{$item->front_description}</p>
        <p class="-tours-description__weather"><strong>Сложность поездки и погода: </strong>{$item->difficulties_and_weather}</p>
        <p class="-tours-description__places">{$item->amount_of_places}</p>
        <div class="-tours-visa"><img class="-tours-visa__image" src="../resources/images/visa.png" alt=""/>
          <div class="-tours-visa__text">
            {$item->visa}
          </div>
        </div>
      </div>
    </div>
    {/foreach}
</div>
  {workspace\modules\admin_review_main_page\widgets\Slider::widget()->run()}
<div class="footer">
  <div class="footer__container">
    <div class="footer__text"><span class="traveling-text">travelling</span>
      <p class="travel-format-text">Открой для себя новый <br />формат путешествий</p>
    </div>
    <div class="footer__contact-info">
      {include file='../includes/contacts.tpl'}
      <div class="search-bar">
        <input type="text" value="Контакты Nepaketniki"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
        <div class="triangle"></div>
      </div>
    </div>
  </div>
</div>
<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nepaketniki Reviews</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
  </head>
  <body>
    <div class="-reviews-header">
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
        <div class="-reviews-header__main">
          <div class="search-bar">
            <input type="text" value="как правильно отдыхать"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
            <div class="triangle"></div>
          </div>
        </div>
      </div>
    </div>
    {workspace\modules\admin_review_main_page\widgets\Slider::widget()->run()}
    <div class="-reviews">
      <div class="-reviews__proposition">
        <p class="-reviews__proposition-text">
          Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего 
          <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">блога в Инстаграм</a>,
          а можете отправиться в незабываемое приключение вместе с нами.
        </p>
        <div class="button">
          <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">
            <button>Подписаться</button>
          </a>
        </div>
      </div>
      <div class="-reviews-instagram">
        <div class="-reviews-instagram__heading"><img class="-reviews-instagram__icon" src="../resources/images/reviews-icon.png" alt=""/>
          <h3>
            <span>Все отзывы вы можете также посмотреть на</span>
            <img src="../resources/images/reviews-insta-icon.png" />
            <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">nepaketniki</a>
          </h3>
        </div>
        <div class="-reviews-instagram__account">
          <div class="-reviews-instagram__account-heading"><img class="-reviews-instagram__avatar" src="../resources/images/reviews-insta-avatar.png" alt=""/>
            <div class="-reviews-instagram__main">
              <div class="-reviews-instagram__login">
                <h4>nepaketniki</h4>
                <div class="-reviews-button">
                  <button>Подписаться</button>
                </div>
                <div class="-reviews-button">
                  <button class="tablet-hidden">▼</button>
                </div>
                <div class="-reviews-instagram__points tablet-hidden"><img src="../resources/images/reviews-points.png" alt=""/></div>
              </div>
              <div class="-reviews-instagram__info"><span><strong>260</strong> публикаций</span><span><strong>28,6тыс.</strong> подписчиков</span><span><strong>430</strong> подписок</span></div>
            </div>
          </div>
          <div class="-reviews-instagram__description">
            <h5>NEPAKETNIKI▫️DIMA&amp;MASHA▫️BALI</h5>
            <ul>
              <li>▫️Карантиним в раю <img src="../resources/images/reviews-umbrella.png" /></li>
              <li>▫️Строим совместный бизнес в путешествиях</li>
              <li>▫️Делаем незабываемые туры за вас и для вас <a href="/">@nepaketniki.tours</a></li>
              <li>🍁Тур🇯🇵Япония 12.11-20.11</li>
              <li><a class="-reviews-instagram__site" href="/">www.nepaketniki.com/japan-november</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="footer short">
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
  </body>
</html>
<div class="header">
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
            <div class="menu__item"><a href="/#travels">О нас</a></div>
            <div class="menu__item"><a href="/#schedule">Расписание</a></div>
            <div class="menu__item"><a href="/#comments">Отзывы</a></div>
            <div class="menu__item"><a href="/">Фотоотчёты</a></div>
            <div class="menu__item"><a href="/">Для бизнеса</a></div>
            <div class="menu__item"><a href="/">Контакты</a></div>
        </div>
    </div>
    <div class="container">
        <div class="header__nav-info" id="headerNavInfo">
            {include file='includes/nav_menu.tpl'}
            {include file='includes/contacts.tpl'}
        </div>
        <div class="header__main">
            <div class="header__text">
                <p class="header__author-tours">{workspace\modules\settings\services\SettingService::run()->get('index_activities', '<strong>Мы создаём авторские туры</strong> в самые красивые места нашей планеты - <br />Бали, Японию, Эльзас, Каппадокию.')}</p>
                <h2 class="header__travel-format-text">{workspace\modules\settings\services\SettingService::run()->get('index_tagline', 'Открой для себя новый формат путешествий')}</h2>
                <p class="header__proposition-text">
                    Ты можешь путешествовать вместе с нами онлайн - в сториз и постах нашего
                    <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">блога в Инстаграм</a>,
                    а можешь отправиться в незабываемое приключение вместе с нами.
                </p>
                <div class="header__news-wrapper"><a href="/tours/">
                        <div class="button">
                            <button>Посмотреть туры</button>
                        </div></a>
                    <p class="header__news">Хочешь получить новости о наших турах первым? <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">Напиши нам в инстаграм</a></p>
                </div>
                <div class="hash-tag">
                    <h3 class="tag">#NePaketniki</h3>
                    <p class="secrets-text">Секреты путешествий</p>
                </div>
            </div>
            <div class="header__traveling"><span class="traveling-text">travelling</span>
                <div class="search-bar">
                    <input type="text" value="как правильно отдыхать?"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                    <div class="triangle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="schedule" id="schedule">
    <div class="schedule-heading">
        <h3 class="schedule-heading__title">Расписание авторских туров</h3>
        <p class="schedule-heading__proposition">
            Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего
            <a href="{workspace\modules\settings\services\SettingService::run()->get('contacts_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">блога в блога в Инстаграм</a>,
            а можете отправиться в незабываемое приключение вместе с нами.
        </p>
    </div>
    <div class="schedule__tours">
        {if isset($model)}
            {foreach from=$model item=item}
                <div class="schedule-tour">
                    <div class="schedule-tour__inside">
                        <div class="schedule-tour__heading">
                            <div class="tour-logo">
                                <div class="tour-logo__wrapper">
                                    <div class="circle small">
                                    </div>
                                    <div class="tour-logo__title">
                                        <h3>{$item->name}</h3>
                                    </div>
                                </div>
                                <a href="/tour/{$item->id}">
                                    <img class="tour-logo__image" src="{$item->image->image}" alt=""/>
                                </a>
                            </div>
                        </div>
                        <div class="schedule-tour__info">
                            <p class="schedule-tour__date">{$item->front_date}</p>
                            <p></p>
                        </div>
                        <p class="schedule-tour__description">{$item->front_description}</p>
                        <p class="schedule-tour__price">{$item->price}</p>
                        <div class="button">
                            <button onClick='location.href="/tour/{$item->id}"'>Программа тура</button>
                        </div>
                    </div>
                </div>
            {/foreach}
        {/if}
        <div class="schedule__form-wrapper">
            <div class="hash-tag">
                <h3 class="tag">#NePaketniki</h3>
                <p class="secrets-text">Секреты путешествий</p>
            </div>
            {workspace\modules\subscription\widgets\SubscriptionWidget::widget()->run()}
        </div>
    </div>
</div>
<div class="travels" id="travels">
    <div class="travels__heading">
        <h3 class="travels__title">Открой новый формат путешествий вместе с нами!</h3>
        <p class="travels__news">Подпишитесь и получите чек-лист топ непакетных направлений <span>бесплатно</span></p><img class="travels__balloon" src="../../../resources/images/balloon.png" alt=""/>
    </div>
    <div class="travels__logo"><img src="../../../resources/images/nepaketniki.png" alt=""/></div>
    <div class="advantages">
        <div class="advantage column-left">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-1.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Продуманность</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_thoughtfulness', 'Самой большой вашей проблемой в туре будет выбор блюда в ресторане, и даже с этим мы поможем:)')}
                    </p>
                </div>
            </div>
        </div>
        <div class="advantage column-right mobile-hidden">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-2.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Программа</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_program', 'Мы за идеальный микс активностей и релакса. У нас нет активностей нон-стоп, но и заскучать вам тоже не дадим.')}
                    </p>
                </div>
            </div>
        </div>
        <div class="advantage column-left">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-3.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Компания</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_company', 'Не знаем, как так получается, но с нами всегда ездят очень интересные, весёлые, успешные и перспективные ребята')}
                    </p>
                </div>
            </div>
        </div>
        <div class="advantage column-right mobile-hidden">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-4.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Фотографии</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_photos', 'Не беспокойтесь - мы сделаем вам ОЧЕНЬ классные фотографии!')}
                    </p>
                </div>
            </div>
        </div>
        <div class="advantage column-left">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-5.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Еда</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_food', 'В наших турах вкусно! Еда для нас важная эстетическая и культурная часть любой поездки. Мы тщательно выбираем кафе по нашему маршруту')}
                    </p>
                </div>
            </div>
        </div>
        <div class="advantage column-right mobile-hidden">
            <div class="advantage__inside">
                <div class="advantage__logo"><img src="../../../resources/images/item-6.png" alt=""/>
                    <div class="circle large">
                        <div class="border"></div>
                    </div>
                </div>
                <div class="advantage__text">
                    <h3>Нет скрытых затрат</h3>
                    <p>
                        {workspace\modules\settings\services\SettingService::run()->get('index_money', 'Мы всегда включаем в стоимость тура все активности, которые дают полное представление о месте, в которое мы едем')}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="travels__subscribe">
        <p>
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

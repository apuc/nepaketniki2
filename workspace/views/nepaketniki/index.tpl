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
            <div class="menu__item"><a href="#travels">О нас</a></div>
            <div class="menu__item"><a href="#schedule">Расписание</a></div>
            <div class="menu__item"><a href="#comments">Отзывы</a></div>
            <div class="menu__item"><a href="/">Фотоотчёты</a></div>
            <div class="menu__item"><a href="/">Для бизнеса</a></div>
            <div class="menu__item"><a href="/">Контакты</a></div>
        </div>
    </div>
    <div class="container">
        <div class="header__nav-info" id="headerNavInfo">
            <div class="header-nav"><a href="#travels">О нас</a><a href="#schedule">Расписание</a><a href="#comments">Отзывы</a><a href="/">Фотоотчёты</a><a href="/">Для бизнеса</a><a href="/">Контакты</a>
            </div>
            <div class="contacts">
                <div class="contacts-socials">
                    <div class="social"><img src="../../../resources/images/social-1.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                    <div class="social"><img src="../../../resources/images/social-2.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                    <div class="social"><img src="../../../resources/images/social-3.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                </div>
                <div class="contacts__phone"><i class="fa fa-phone"></i>
                    <div class="contacts__number"><strong>+38 099 490 24 54</strong>
                        <p>перезвоните мне!</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="header__main">
            <div class="header__text">
                <p class="header__author-tours"><strong>Мы создаём авторские туры</strong> в самые красивые места нашей планеты - <br />Бали, Японию, Эльзас, Каппадокию. </p>
                <h2 class="header__travel-format-text">Открой для себя новый формат путешествий</h2>
                <p class="header__proposition-text">
                    Ты можешь путешествовать вместе с нами онлайн - в сториз и постах нашего
                    <a href="/">блога в Инстаграм</a>,
                    а можешь отправиться в незабываемое приключение вместе с нами.
                </p>
                <div class="header__news-wrapper"><a href="#schedule">
                        <div class="button">
                            <button>Посмотреть туры</button>
                        </div></a>
                    <p class="header__news">Хочешь получить новости о наших турах первым? <a href='/'>Напиши нам</a></p>
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
            <a href='/'>блога в Инстаграм</a>,
            а можете отправиться в незабываемое приключение вместе с нами.
        </p>
    </div>
    <div class="schedule__tours">
        {foreach from=$model item=item}
            <div class="schedule-tour">
                <div class="schedule-tour__inside">
                    <div class="schedule-tour__heading">
                        <div class="schedule-tour__logo">
                            <div class="circle small">
                            </div>
                            <div class="schedule-tour__title">
                                <h3>{$item->name}</h3>
                            </div>
                        </div>
                        <img class="schedule-tour__image" src="../../../resources/images/{$item->image->image}" alt=""/>
                    </div>
                    <div class="schedule-tour__info">
                        <p class="schedule-tour__date">{$item->front_date}</p>
                        <p class="schedule-tour__free-places">{$item->front_places_remaining}</p>
                    </div>
                    <p class="schedule-tour__description">{$item->front_description}</p>
                    <p class="schedule-tour__price">{$item->price}</p>
                    <div class="button">
{*                        <a class="button_link" href="/tour">Программа тура</a>*}
                        <button onClick='location.href="/tour/{$item->id}"'>Программа тура</button>
                    </div>
                </div>
            </div>
        {/foreach}


{*        <div class="schedule-tour">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="tour-logo">*}
{*                        <div class="tour-logo__wrapper">*}
{*                            <div class="circle small">*}
{*                            </div>*}
{*                            <div class="tour-logo__title">*}
{*                                <h3>Каппадокия</h3>*}
{*                                <h3></h3>*}
{*                            </div>*}
{*                        </div><img class="tour-logo__image" src="assets/images/tour-1.png" alt=""/>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">сентябрь - октябрь 2020</p>*}
{*                    <p></p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">Полёт на воздушном шаре над марсианскими пейзажами, долины и каньоны, фотосессии в разлетающихся платьях на террасе бутик-отеля, прогулка на квадроциклах и лошадях.</p>*}
{*                <p class="schedule-tour__price">850 € + авиаперелёт</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="schedule-tour">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="tour-logo">*}
{*                        <div class="tour-logo__wrapper">*}
{*                            <div class="circle small">*}
{*                            </div>*}
{*                            <div class="tour-logo__title">*}
{*                                <h3>Бали</h3>*}
{*                                <h3>и Нуса Пенида</h3>*}
{*                            </div>*}
{*                        </div><img class="tour-logo__image" src="assets/images/tour-2.png" alt=""/>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">16-28 октября 2020</p>*}
{*                    <p></p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">11 дней в раю и месте силы. Океан, райские пляжи, мощные водопады, восхождение на вулкан, спа, рестораны в джунглях и джакузи выше облаков.</p>*}
{*                <p class="schedule-tour__price">1620 € + авиаперелёт</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="schedule-tour mobile-hidden">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="tour-logo">*}
{*                        <div class="tour-logo__wrapper">*}
{*                            <div class="circle small">*}
{*                            </div>*}
{*                            <div class="tour-logo__title">*}
{*                                <h3>Бали</h3>*}
{*                                <h3>и Нуса Пенида</h3>*}
{*                            </div>*}
{*                        </div><img class="tour-logo__image" src="assets/images/tour-3.png" alt=""/>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">27 октября - 6 ноября 2020</p>*}
{*                    <p class="schedule-tour__free-places">(8 свободных мест)</p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">9 дней в раю и месте силы. Океан, райские пляжи, мощные водопады, восхождение на вулкан, спа, рестораны в джунглях и джакузи выше облаков.</p>*}
{*                <p class="schedule-tour__price">1290 € + авиаперелёт</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="schedule-tour mobile-hidden">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="tour-logo">*}
{*                        <div class="tour-logo__wrapper">*}
{*                            <div class="circle small">*}
{*                            </div>*}
{*                            <div class="tour-logo__title">*}
{*                                <h3>Япония:</h3>*}
{*                                <h3>красные клёны</h3>*}
{*                            </div>*}
{*                        </div><img class="tour-logo__image" src="assets/images/tour-4.png" alt=""/>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">12-20 ноября 2020</p>*}
{*                    <p class="schedule-tour__free-places">(5 свободных мест)</p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">Неизведанная и таинственная, абсолютно другая и уникальная. Ночной Токио, ручные олени в Наре, древний Киото со знакомством с гейшей, гора Фудзи в закури...</p>*}
{*                <p class="schedule-tour__price">2100 € + авиаперелёт</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="schedule-tour mobile-hidden">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="tour-logo">*}
{*                        <div class="tour-logo__wrapper">*}
{*                            <div class="circle small">*}
{*                            </div>*}
{*                            <div class="tour-logo__title">*}
{*                                <h3>Рождественский Эльзас</h3>*}
{*                                <h3></h3>*}
{*                            </div>*}
{*                        </div><img class="tour-logo__image" src="assets/images/tour-5.png" alt=""/>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">декабрь 2021</p>*}
{*                    <p></p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">5 дней в нетипичной Франции и рождественской сказке. Самые красивые деревушки, отель в виноградниках, средневековые ярмарки и неповторимые эльзасские </p>*}
{*                <p class="schedule-tour__price">1290 € + авиаперелёт</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
        <div class="schedule__form-wrapper">
            <div class="hash-tag">
                <h3 class="tag">#NePaketniki</h3>
                <p class="secrets-text">Секреты путешествий</p>
            </div>
            <div class="schedule-form">
                <div class="circle medium">
                </div>
                <div class="schedule-form__content">
                    <h3 class="schedule-form__title">Обязательно <br />подпишись!</h3>
                    <p class="schedule-form__news">Получай новости о наших новых турах, скидках первым! Это важно!</p>
                    <form class="schedule-form__feedback">
                        <input type="text" placeholder="Введите имя"/>
                        <input type="text" placeholder="Введите телефон"/>
                        <button type="submit">Подписаться</button>
                    </form>
                </div>
            </div>
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
                    <p>Самой большой вашей проблемой в туре будет выбор блюда в ресторане, и даже с этим мы поможем:)</p>
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
                    <p>Мы за идеальный микс активностей и релакса. У нас нет активностей нон-стоп, но и заскучать вам тоже не дадим.</p>
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
                    <p>Не знаем, как так получается, но с нами всегда ездят очень интересные, весёлые, успешные и перспективные ребята</p>
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
                    <p>Не беспокойтесь - мы сделаем вам ОЧЕНЬ классные фотографии!</p>
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
                    <p>В наших турах вкусно! Еда для нас важная эстетическая и культурная часть любой поездки. Мы тщательно выбираем кафе по нашему маршруту</p>
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
                    <p>Мы всегда включаем в стоимость тура все активности, которые дают полное представление о месте, в которое мы едем</p>
                </div>
            </div>
        </div>
    </div>
    <div class="travels__subscribe">
        <p>
            Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего
            <a href="/">блога в Инстаграм</a>,
            а можете отправиться в незабываемое приключение вместе с нами.
        </p>
        <div class="button">
            <button>Подписаться</button>
        </div>
    </div>
</div>
<div class="comments" id="comments">
    <h2 class="comments__title">Сомневаешься стоит ли путешествовать с нами? <br/> Тогда читай, что пишут о нас</h2>
    <div class="comments__pagination">
        <button class="comments__button" id="prevPage"></button><span class="comments__current-page"><span id='currentPage'></span> из <span id='pages'></span></span>
        <button class="comments__button comments__button--active" id="nextPage"></button>
    </div>
    <div class="comments__list">
        <div class="comments-comment upper">
            <div class="comments-comment__border-inside"></div>
            <div class="comment__main">
                <h4 class="comment__name">Карина и Андрей</h4>
                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link" href="http::/instagram.com/karina_duvanova">karina_duvanova</a><span class="comment__link-breaker">|</span><a class="comment__link" href="http::/instagram.com/andy_slipp"> andy_slipp</a>
                </div>
                <p class="comment__text">Это был самый крутой отдых! Вы - просто молодцы! Программа тура была не стандартной туристической и при желании группа могла внести ещё и свои коррективы. Т.е. мое нелюбимое - в 7 утра стоять перед гостиницей с сухим пайком и ждать автобус не происходило... </p>
            </div><img class="comment__avatar" src="../../../resources/images/comment-1.png" alt=""/>
        </div>
        <div class="comments-comment mobile-hidden">
            <div class="comments-comment__border-inside"></div>
            <div class="comment__main">
                <h4 class="comment__name">Людмила</h4>
                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link" href="http::/instagram.com/mng.milka">mng.milka</a>
                </div>
                <p class="comment__text">Ребятки, формат вашей программы оказался просто идеальным для меня (Я собственно на это и рассчитывала) Этот формат я называю «взять и выгулять», когда ты не паришься о подробностях и деталях планирования поездки, ты просто доверяешь себя профессионалам..., расслабляешься и наслаждаешься путешествием на полную </p>
            </div><img class="comment__avatar" src="../../../resources/images/comment-2.png" alt=""/>
        </div>
        <div class="comments-comment mobile-hidden upper">
            <div class="comments-comment__border-inside"></div>
            <div class="comment__main">
                <h4 class="comment__name">Галина</h4>
                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link" href="http::/instagram.com/galochka115">galochka115</a>
                </div>
                <p class="comment__text">Ребята, спасибо вам большое за поездку! Я сама люблю составлять маршруты и всё тщательно планировать, но как же приятно иногда ни о чем не думать и довериться хорошим организаторам!)) До сих пор закрываю глаза и у меня пряничные домики перед глазами))... </p>
            </div><img class="comment__avatar" src="../../../resources/images/comment-3.png" alt=""/>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer__container">
        <div class="footer__text"><span class="traveling-text">travelling</span>
            <p class="travel-format-text">Открой для себя новый <br />формат путешествий</p>
        </div>
        <div class="footer__contact-info">
            <div class="contacts">
                <div class="contacts-socials">
                    <div class="social"><img src="../../../resources/images/social-1.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                    <div class="social"><img src="../../../resources/images/social-2.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                    <div class="social"><img src="../../../resources/images/social-3.png"/>
                        <div class="social--inner-hover"></div>
                    </div>
                </div>
                <div class="contacts__phone"><i class="fa fa-phone"></i>
                    <div class="contacts__number"><strong>+38 099 490 24 54</strong>
                        <p>перезвоните мне!</p>
                    </div>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" value="Контакты Nepaketniki"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
        </div>
    </div>
</div>





{*<div class="header">*}
{*    <div class="menu" id="menu">*}
{*        <div class="menu__icon" id="menuIcon"><i class="fa fa-bars"></i></div>*}
{*        <div class="menu__list" id="menuList">*}
{*            <div class="menu__item"><a href="#travels">О нас</a></div>*}
{*            <div class="menu__item"><a href="#schedule">Расписание</a></div>*}
{*            <div class="menu__item"><a href="#comments">Отзывы</a></div>*}
{*            <div class="menu__item"><a href="/">Фотоотчёты</a></div>*}
{*            <div class="menu__item"><a href="/">Для бизнеса</a></div>*}
{*            <div class="menu__item"><a href="/">Контакты</a></div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="header__nav-info" id="headerNavInfo">*}
{*        <div class="header-nav"><a href="#travels">О нас</a><a href="#schedule">Расписание</a><a*}
{*                    href="#comments">Отзывы</a><a href="/">Фотоотчёты</a><a href="/">Для бизнеса</a><a*}
{*                    href="/">Контакты</a>*}
{*        </div>*}
{*        <div class="contacts">*}
{*            <div class="contacts-socials">*}
{*                <div class="social"><img src="../../../resources/images/social-1.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*                <div class="social"><img src="../../../resources/images/social-2.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*                <div class="social"><img src="../../../resources/images/social-3.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*            </div>*}
{*            <div class="contacts__phone"><i class="fa fa-phone"></i>*}
{*                <div class="contacts__number"><strong>+38 099 490 24 54</strong>*}
{*                    <p>перезвоните мне!</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="header__main">*}
{*        <div class="header__text">*}
{*            <p class="header__author-tours"><strong>Мы создаём авторские туры</strong> в самые красивые места нашей*}
{*                планеты - <br/>Бали, Японию, Эльзас, Каппадокию. </p>*}
{*            <h2 class="header__travel-format-text">Открой для себя новый формат путешествий</h2>*}
{*            <p class="header__proposition-text">*}
{*                Ты можешь путешествовать вместе с нами онлайн - в сториз и постах нашего*}
{*                <a href="/">блога в Инстаграм</a>,*}
{*                а можешь отправиться в незабываемое приключение вместе с нами.*}
{*            </p>*}
{*            <div class="header__news-wrapper"><a href="#schedule">*}
{*                    <div class="button">*}
{*                        <button>Посмотреть туры</button>*}
{*                    </div>*}
{*                </a>*}
{*                <p class="header__news">Хочешь получить новости о наших турах первым? <a href='/'>Напиши нам</a></p>*}
{*            </div>*}
{*            <div class="hash-tag">*}
{*                <h3 class="tag">#NePaketniki</h3>*}
{*                <p class="secrets-text">Секреты путешествий</p>*}
{*            </div>*}
{*        </div>*}
{*        <div class="header__traveling"><span class="traveling-text">traveling</span>*}
{*            <div class="search-bar">*}
{*                <input type="text" value="как правильно отдыхать?"/><i class="fa fa-search"></i>*}
{*                <div class="triangle"></div>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
{*</div>*}
{*<div class="schedule" id="schedule">*}
{*    <h3 class="schedule__title">Расписание авторских туров</h3>*}
{*    <p class="schedule__proposition">*}
{*        Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего*}
{*        <a href='/'>блога в Инстаграм</a>,*}
{*        а можете отправиться в незабываемое приключение вместе с нами.*}
{*    </p>*}
{*    <div class="schedule__tours">*}
{*        {foreach from=$model item=item}*}
{*        <div class="schedule-tour">*}
{*            <div class="schedule-tour__inside">*}
{*                <div class="schedule-tour__heading">*}
{*                    <div class="schedule-tour__logo">*}
{*                        <div class="circle small">*}
{*                        </div>*}
{*                        <div class="schedule-tour__title">*}
{*                            <h3>{$item->name}</h3>*}
{*                        </div>*}
{*                    </div>*}
{*                    <img class="schedule-tour__image" src="../../../resources/images/{$item->image->image}" alt=""/>*}
{*                </div>*}
{*                <div class="schedule-tour__info">*}
{*                    <p class="schedule-tour__date">{$item->front_date}</p>*}
{*                    <p class="schedule-tour__free-places">{$item->front_places_remaining}</p>*}
{*                </div>*}
{*                <p class="schedule-tour__description">{$item->front_description}</p>*}
{*                <p class="schedule-tour__price">{$item->price}</p>*}
{*                <div class="button">*}
{*                    <button>Программа тура</button>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        {/foreach}*}

{*        <div class="schedule__form-wrapper">*}
{*            <div class="hash-tag">*}
{*                <h3 class="tag">#NePaketniki</h3>*}
{*                <p class="secrets-text">Секреты путешествий</p>*}
{*            </div>*}
{*            <div class="schedule-form">*}
{*                <div class="circle medium">*}
{*                </div>*}
{*                <div class="schedule-form__inside">*}
{*                    <div class="schedule-form__content">*}
{*                        <h3 class="schedule-form__title">Обязательно <br/>подпишись!</h3>*}
{*                        <p class="schedule-form__news">Получай новости о наших новых турах, скидках первым! Это*}
{*                            важно!</p>*}
{*                        <form class="schedule-form__feedback">*}
{*                            <input type="text" placeholder="Введите имя"/>*}
{*                            <input type="text" placeholder="Введите телефон"/>*}
{*                            <button type="submit">Спросить онлайн</button>*}
{*                        </form>*}
{*                        <h4 class="schedule-form__instagram">Instagram</h4>*}
{*                    </div>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
{*</div>*}
{*<div class="travels" id="travels">*}
{*    <div class="travels__heading">*}
{*        <h3 class="travels__title">Открой новый формат путешествий вместе с нами!</h3>*}
{*        <p class="travels__news">Подпишитесь и получите чек-лист топ непакетных направлений <span>бесплатно</span></p>*}
{*        <img class="travels__balloon" src="../../../resources/images/balloon.png" alt=""/>*}
{*    </div>*}
{*    <div class="travels__logo"><img src="../../../resources/images/nepaketniki.png" alt=""/></div>*}
{*    <div class="advantages">*}
{*        <div class="advantage column-left">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-1.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Продуманность</h3>*}
{*                    <p>Самой большой вашей проблемой в туре будет выбор блюда в ресторане, и даже с этим мы*}
{*                        поможем:)</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="advantage column-right">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-2.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Программа</h3>*}
{*                    <p>Мы за идеальный микс активностей и релакса. У нас нет активностей нон-стоп, но и заскучать вам*}
{*                        тоже не дадим.</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="advantage column-left">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-3.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Компания</h3>*}
{*                    <p>Не знаем, как так получается, но с нами всегда ездят очень интересные, весёлые, успешные и*}
{*                        перспективные ребята</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="advantage column-right">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-4.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Фотографии</h3>*}
{*                    <p>Не беспокойтесь - мы сделаем вам ОЧЕНЬ классные фотографии!</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="advantage column-left">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-5.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Еда</h3>*}
{*                    <p>В наших турах вкусно! Еда для нас важная эстетическая и культурная часть любой поездки. Мы*}
{*                        тщательно выбираем кафе по нашему маршруту</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="advantage column-right">*}
{*            <div class="advantage__inside">*}
{*                <div class="advantage__logo"><img src="../../../resources/images/advantage-icon-6.png" alt=""/>*}
{*                    <div class="circle large">*}
{*                        <div class="border"></div>*}
{*                    </div>*}
{*                </div>*}
{*                <div class="advantage__text">*}
{*                    <h3>Нет скрытых затрат</h3>*}
{*                    <p>Мы всегда включаем в стоимость тура все активности, которые дают полное представление о месте, в*}
{*                        которое мы едем</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
{*    <div class="travels__subscribe">*}
{*        <p>*}
{*            Вы можете путешествовать вместе с нами онлайн - в сториз и постах нашего*}
{*            <a href="/">блога в Инстаграм</a>,*}
{*            а можете отправиться в незабываемое приключение вместе с нами.*}
{*        </p>*}
{*        <div class="button">*}
{*            <button>Подписаться</button>*}
{*        </div>*}
{*    </div>*}
{*</div>*}
{*<div class="comments" id="comments">*}
{*    <h2 class="comments__title">Сомневаешься стоит ли путешествовать с нами? <br/> Тогда читай, что пишут о нас</h2>*}
{*    <div class="comments__pagination">*}
{*        <button>&lt;</button>*}
{*        <span class="comments__current-page">1 из 12</span>*}
{*        <button>&gt;</button>*}
{*    </div>*}
{*    <div class="comments__list">*}
{*        <div class="comments-comment upper">*}
{*            <div class="comments-comment__border-inside"></div>*}
{*            <div class="comment__main">*}
{*                <h4 class="comment__name">Карина и Андрей</h4>*}
{*                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link"*}
{*                                                                                  href="http::/instagram.com/karina_duvanova">karina_duvanova</a><span*}
{*                            class="comment__link-breaker">|</span><a class="comment__link"*}
{*                                                                     href="http::/instagram.com/andy_slipp">*}
{*                        andy_slipp</a>*}
{*                </div>*}
{*                <p class="comment__text">Это был самый крутой отдых! Вы - просто молодцы! Программа тура была не*}
{*                    стандартной туристической и при желании группа могла внести ещё и свои коррективы. Т.е. мое*}
{*                    нелюбимое - в 7 утра стоять перед гостиницей с сухим пайком и ждать автобус не происходило... </p>*}
{*            </div>*}
{*            <img class="comment__avatar" src="../../../resources/images/comment-1.png" alt=""/>*}
{*        </div>*}
{*        <div class="comments-comment">*}
{*            <div class="comments-comment__border-inside"></div>*}
{*            <div class="comment__main">*}
{*                <h4 class="comment__name">Людмила</h4>*}
{*                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link"*}
{*                                                                                  href="http::/instagram.com/mng.milka">mng.milka</a>*}
{*                </div>*}
{*                <p class="comment__text">Ребятки, формат вашей программы оказался просто идеальным для меня (Я*}
{*                    собственно на это и рассчитывала) Этот формат я называю «взять и выгулять», когда ты не паришься о*}
{*                    подробностях и деталях планирования поездки, ты просто доверяешь себя профессионалам...,*}
{*                    расслабляешься и наслаждаешься путешествием на полную </p>*}
{*            </div>*}
{*            <img class="comment__avatar" src="../../../resources/images/comment-2.png" alt=""/>*}
{*        </div>*}
{*        <div class="comments-comment upper">*}
{*            <div class="comments-comment__border-inside"></div>*}
{*            <div class="comment__main">*}
{*                <h4 class="comment__name">Галина</h4>*}
{*                <div class="comment__instagram"><i class="fa fa-instagram"></i><a class="comment__link"*}
{*                                                                                  href="http::/instagram.com/galochka115">galochka115</a>*}
{*                </div>*}
{*                <p class="comment__text">Ребята, спасибо вам большое за поездку! Я сама люблю составлять маршруты и всё*}
{*                    тщательно планировать, но как же приятно иногда ни о чем не думать и довериться хорошим*}
{*                    организаторам!)) До сих пор закрываю глаза и у меня пряничные домики перед глазами))... </p>*}
{*            </div>*}
{*            <img class="comment__avatar" src="../../../resources/images/comment-3.png" alt=""/>*}
{*        </div>*}
{*    </div>*}
{*</div>*}
{*<div class="footer">*}
{*    <div class="footer__text"><span class="traveling-text">traveling</span>*}
{*        <p class="travel-format-text">Открой для себя новый <br/>формат путешествий</p>*}
{*    </div>*}
{*    <div class="footer__contact-info">*}
{*        <div class="contacts">*}
{*            <div class="contacts-socials">*}
{*                <div class="social"><img src="../../../resources/images/social-1.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*                <div class="social"><img src="../../../resources/images/social-2.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*                <div class="social"><img src="../../../resources/images/social-3.png"/>*}
{*                    <div class="social--inner-hover"></div>*}
{*                </div>*}
{*            </div>*}
{*            <div class="contacts__phone"><i class="fa fa-phone"></i>*}
{*                <div class="contacts__number"><strong>+38 099 490 24 54</strong>*}
{*                    <p>перезвоните мне!</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        <div class="search-bar">*}
{*            <input type="text" value="Контакты Nepaketniki"/><i class="fa fa-search"></i>*}
{*            <div class="triangle"></div>*}
{*        </div>*}
{*    </div>*}
{*</div>*}
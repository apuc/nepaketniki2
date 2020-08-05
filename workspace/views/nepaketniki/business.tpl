<div class="-about-header">
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
            <div class="menu__item"><a href="/">Главная</a></div>
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
            <div class="header-nav">
                <a href="/">На главную</a>
                {include file='includes/nav_menu.tpl'}
            </div>
            {include file='includes/contacts.tpl'}
        </div>
        <div class="-about-header__main">
            <div class="-about-header__text">
                <p class="-about-header__author-tours"><strong>Мы создаём авторские туры</strong> в самые красивые места нашей планеты - <br />Бали, Японию, Эльзас, Каппадокию. </p>
                <h2 class="-about-header__travel-format-text maxed">{$model->header}</h2>
            </div>
            <div class="-about-header__traveling"><span class="traveling-text">travelling</span>
                <div class="search-bar">
                    <input type="text" value="как правильно отдыхать?"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                    <div class="triangle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="-business">
    <div class="container">
        <div class="-business__text">
            {$model->text_block_1}
        </div>
        <div class="-business__text">
            {$model->text_block_2}
        </div>
        <div class="-business__text -business__text--wide">
            {$model->text_block_3}
        </div>
    </div>
</div>
<div class="-business-photos">
    <div class="container">
        <div class="-business-photos__masonry">
            <div class="grid">
                <div class="grid-sizer"></div>
                {foreach from=$model->images item=image}
                     <div class="grid-item"><img src="{$image->image->image}" alt=""/></div>
                {/foreach}

                {*                <div class="grid-sizer"></div>*}
{*                <div class="grid-item"><img src="/resources/images/masonry-1.png" alt=""/></div>*}
{*                <div class="grid-item grid-item--upper"><img src="/resources/images/masonry-2.png" alt=""/></div>*}
{*                <div class="grid-item"><img src="/resources/images/masonry-3.png" alt=""/></div>*}
{*                <div class="grid-item"><img src="/resources/images/masonry-4.png" alt=""/></div>*}
{*                <div class="grid-item"><img src="/resources/images/masonry-5.png" alt=""/></div>*}
{*                <div class="grid-item"><img src="/resources/images/masonry-6.png" alt=""/></div>*}
            </div>
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
            <div class="contacts">
                {include file='../includes/contacts.tpl'}
            </div>
            <div class="search-bar">
                <input type="text" value="Контакты Nepaketniki"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
        </div>
    </div>
</div>
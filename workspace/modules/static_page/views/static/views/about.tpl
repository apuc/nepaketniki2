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
                {include file='workspace/views/includes/nav_menu.tpl'}
            </div>
            {include file='workspace/views/includes/contacts.tpl'}
        </div>
        <div class="-about-header__main">
            <div class="-about-header__text">
                <p class="-about-header__author-tours"><strong>Мы создаём авторские туры</strong> в самые красивые места нашей планеты - <br />Бали, Японию, Эльзас, Каппадокию.</p>
                <h2 class="-about-header__travel-format-text">Открой для себя новый формат путешествий</h2>
                <p class="-about-header__proposition-text">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
                    reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                </p>
                <p class="-about-header__proposition-text">
                    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                    deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste
                    natus error sit voluptatem accusantium doloremque laudantium, totam rem
                    aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
                    beatae vitae dicta sunt explicabo.
                </p>
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
<div class="-about">
    <div class="container">
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
            nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
            qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde
            omnis iste natus error sit voluptatem accusantium doloremque laudantium,
            totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
            architecto beatae vitae dicta sunt explicabo.
        </p><br/>
        <p>
            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,
            sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
            Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
            adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
            dolore magnam aliquam quaerat voluptatem.
        </p>
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
                {include file='workspace/views/includes/contacts.tpl'}
            </div>
            <div class="search-bar">
                <input type="text" value="Контакты Nepaketniki"/><span class="times"><i class="fa fa-times"></i></span><i class="fa fa-search"></i>
                <div class="triangle"></div>
            </div>
        </div>
    </div>
</div>
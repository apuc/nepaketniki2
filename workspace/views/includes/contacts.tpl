<div class="contacts">
    <div class="contacts-socials">
        <a href="{workspace\modules\settings\services\SettingService::run()->get('site_instagram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">
            <div class="social"><img src="../../../resources/images/social-1.png" alt="instagram"/>
                <div class="social--inner-hover"></div>
            </div>
        </a>
        <a href="{workspace\modules\settings\services\SettingService::run()->get('site_telegram', 'https://www.instagram.com/nepaketniki/')}" target="_blank">
            <div class="social"><img src="../../../resources/images/social-2.png" alt="telegram"/>
                <div class="social--inner-hover"></div>
            </div>
        </a>
        <a href="{workspace\modules\settings\services\SettingService::run()->get('site_whatsup', 'https://www.instagram.com/nepaketniki/')}" target="_blank">
            <div class="social"><img src="../../../resources/images/social-3.png" alt="what's up"/>
                <div class="social--inner-hover"></div>
            </div>
        </a>
    </div>
    <div class="contacts__phone"><i class="fa fa-phone"></i>
        <div class="contacts__number"><strong>{workspace\modules\settings\services\SettingService::run()->get('site_phone', '+38 099 490 24 54')}</strong>
        </div>
    </div>
</div>
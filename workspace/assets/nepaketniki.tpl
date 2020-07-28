{capture name=meta}
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
{/capture}

{capture name=css}
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/css/style.css" rel="stylesheet">
    <link href="../resources/css/sweetalert2.min.css" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script src="../resources/js/sweetalert2.all.min.js"></script>
{/capture}

{capture name=contacts}
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
                <p>перезвоните мне!</p>
            </div>
        </div>
    </div>
{/capture}

{capture name=js_end_body}
    <script src="../resources/js/script.js"></script>
{/capture}

{capture name=meta}
    <meta charset="UTF-8">
{/capture}
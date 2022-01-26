{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}

<div id="ts_review_sticker"></div>
<script type="text/javascript">
(function () {
    _tsRatingConfig = {
        {foreach key=skey item=sval from=$site_review_configuration_code}
            '{$skey|escape:'htmlall':'UTF-8'}' : '{$sval|escape:'htmlall':'UTF-8'}',
        {/foreach}
        {if $smarty.const.TSAPI_URL == 'https://api-qa.trustedshops.com'}
            'apiServer': 'https://api-qa.trustedshops.com/',
        {/if}
        tsid: '{$id_trusted_shops|escape:'htmlall':'UTF-8'}'
    };
    var scripts = document.getElementsByTagName('script'),
    me = scripts[scripts.length - 1];
    var _ts = document.createElement('script');
    _ts.type = 'text/javascript';
    _ts.async = true;
    _ts.src = '//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
    me.parentNode.insertBefore(_ts, me);
    _tsRatingConfig.script = _ts;
})();
</script>

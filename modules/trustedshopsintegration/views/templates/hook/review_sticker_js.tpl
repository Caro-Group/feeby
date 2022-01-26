{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}
{block name="displayBottomBothColumn"}
    <div id="ts_review_sticker"></div>
{/block}
<script type="text/javascript">
(function () {
    _tsRatingConfig = {
        tsid: '{$id_trusted_shops|escape:'htmlall':'UTF-8'}',
        {if $smarty.const.TSAPI_URL == 'https://api-qa.trustedshops.com'}
            'apiServer': 'https://api-qa.trustedshops.com/',
        {/if}
        element: '#ts_review_sticker',
        variant: 'testimonial',
        reviews: '{$number_of_reviews|default:"5"|escape:'htmlall':'UTF-8'}',
        betterThan: '{$maximum_rating|default:"3.0"|escape:'htmlall':'UTF-8'}',
        richSnippets: 'on',
        backgroundColor: '{$site_review_background_color|default:"#ffdc0f"|escape:'htmlall':'UTF-8'}',
        linkColor: '#000000',
        quotationMarkColor: '#FFFFFF',
        fontFamily: '{$review_sticker_font|default:"Arial"|escape:'htmlall':'UTF-8'}',
        reviewMinLength: '10'
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

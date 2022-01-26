{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}
    <script type="text/javascript">
        (function () {
        var _tsid = '{$id_trusted_shops|escape:'htmlall':'UTF-8'}';
            _tsConfig = {
            /* offset from page bottom */
            'yOffset': '{$y_offset|escape:'htmlall':'UTF-8'}',
            /* default, reviews, custom, custom_reviews */
            {if $variant == 'hide'}
                'variant': 'default',
            {else}
                'variant': '{$variant|escape:'htmlall':'UTF-8'}',
            {/if}
            /* required for variants custom and custom_reviews */
            'customElementId': '',
            /* for custom variants: topRight, topLeft, bottomRight, bottomLeft */
            'trustcardDirection': '',
            /* for custom variants: 40 - 90 (in pixels) */
            'customBadgeWidth': '',
            /* for custom variants: 40 - 90 (in pixels) */
            'customBadgeHeight': '',
            /* deactivate responsive behaviour */
            'disableResponsive': 'false',
            /* deactivate trustbadge */
            {if $variant == 'hide'}
                'disableTrustbadge': 'true'
            {else}
                'disableTrustbadge': 'false'
            {/if}
            };
            var _ts = document.createElement('script');
            _ts.type = 'text/javascript';
            _ts.charset = 'utf-8';
            _ts.async = true;
            _ts.src = '//{$smarty.const.WIDGET_DOMAIN|default:"widgets.trustedshops.com"|escape:'htmlall':'UTF-8'}/js/' + _tsid + '.js';
            var __ts = document.getElementsByTagName('script')[0];
            __ts.parentNode.insertBefore(_ts, __ts);
        })();
    </script>
<style>
div[id*="trustbadge-container"] {
    z-index: auto!important;
}
</style>

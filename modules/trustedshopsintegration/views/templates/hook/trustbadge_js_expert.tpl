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
            {foreach key=skey item=sval from=$trustbadge_config name="tsbadgeitems"}
                {if $skey == 'disableTrustbadge' && $variant == 'hide'}
                'disableTrustbadge': 'true',
                {else if $skey == 'responsive'}
                '{$skey|escape:'htmlall':'UTF-8'}' : {
                    {foreach from=$sval item=rval key=rkey name="tsbadgeitemsval"}
                        '{$rkey|escape:'htmlall':'UTF-8'}' : '{$rval|escape:'htmlall':'UTF-8'}'{if $smarty.foreach.tsbadgeitemsval.last|escape:'htmlall':'UTF-8'}
{else},
{/if}
                    {/foreach}
                }{if $smarty.foreach.tsbadgeitems.last|escape:'htmlall':'UTF-8'}
{else},
{/if}
                {else}
                '{$skey|escape:'htmlall':'UTF-8'}' : '{$sval|escape:'htmlall':'UTF-8'}'{if $smarty.foreach.tsbadgeitems.last|escape:'htmlall':'UTF-8'}
{else},
{/if}

                {/if}
            {/foreach}
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

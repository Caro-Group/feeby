{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}

<div id="ts_product_widget">
</div>
<script type="text/javascript" src="//widgets.trustedshops.com/reviews/tsSticker/tsProductStickerSummary.js"></script>
{if $action == 'quickview'}
    <script type="text/javascript" src="{$module_dir|escape:'htmlall':'UTF-8'}views/js/product_bottom.js"></script>
{/if}
<script type="text/javascript">
    var summaryBadge = new productStickerSummary();
    summaryBadge.showSummary({
    'tsId': '{$id_trusted_shops|escape:'htmlall':'UTF-8'}',
    'sku': ['{$ts_product_sku|escape:'htmlall':'UTF-8'}'],
    'element': '#ts_product_widget',
    'starColor' : '{$rating_star_color|escape:'htmlall':'UTF-8'}',
    'starSize' : '{$rating_star_size|escape:'htmlall':'UTF-8'}px',
    'fontSize' : '{$rating_font_size|escape:'htmlall':'UTF-8'}px',
    {if $show_rating == 1}
        'showRating' : 'true',
    {else}
        'showRating' : 'false',
    {/if}
    'scrollToReviews' : 'false',
    {if $hide_empty_ratings == 1}
        'enablePlaceholder': 'false'
    {else}
        'enablePlaceholder': 'true'
    {/if}
});
</script>

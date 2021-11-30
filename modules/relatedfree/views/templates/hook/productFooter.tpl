{**
* PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
*
* @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
* @copyright 2010-9999 VEKIA
* @license   This program is not free software and you can't resell and redistribute it
*
* CONTACT WITH DEVELOPER http://mypresta.eu
* support@mypresta.eu
*}


{if isset($products) && $products}
    <div id="featured-category-products-block-center" class="{$rf_maincss}">
        <h1 class="products-section-title text-uppercase ">
            {if $related_link==1}<a href="{$link->getCategoryLink($related_category, null, $id_lang)}">{/if}
                {l s='Related products' mod='relatedfree'}
            {if $related_link==1}</a>{/if}
        </h1>
            <div class="{$rf_productscss}">
                {foreach from=$products item="product"}
                    {include file=$rf_tpath product=$product}
                {/foreach}
            </div>
    </div>
{/if}
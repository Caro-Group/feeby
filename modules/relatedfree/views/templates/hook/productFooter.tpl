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
        {include file='_partials/slider_header.tpl' title={l s='Related products' mod='relatedfree'}}
        
        <div class="swiper">
  
            <div class="swiper-wrapper">
                {foreach from=$products item="product"}
                    <div class="swiper-slide">
                    {include file='catalog/_partials/miniatures/product.tpl' product=$product}
                    </div>
                {/foreach}
            </div>
            
            <div class="swiper-pagination"></div>
        </div>
    </div>
{/if}
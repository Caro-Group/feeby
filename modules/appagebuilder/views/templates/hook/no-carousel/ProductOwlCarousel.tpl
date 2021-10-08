{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ProductOwlCarousel -->
<div id="{$carouselName|escape:'html':'UTF-8'}" class="nocarousel-wapper {if isset($productClassWidget)}{$productClassWidget|escape:'html':'UTF-8'}{/if}">
{$mproducts=array_chunk($products,$formAtts.itempercolumn)}
{foreach from=$mproducts item=products name=mypLoop}
	{foreach from=$products item=product name=products key="position"}
        {if isset($product_item_path)}
            {include file="$product_item_path" position=$position}
        {/if}
	{/foreach}
{/foreach}
</div>
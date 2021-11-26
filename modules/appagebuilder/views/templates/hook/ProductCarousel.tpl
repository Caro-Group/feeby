{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ProductCarousel -->


{if $page.page_name=='index'}

<div class="swiper-popular overflow-hidden min-w-swiper-mobile">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
    <div class="swiper-wrapper plist-dsimple">
        {$mproducts=array_chunk($products,$itemsperpage)}
        {foreach from=$products item="product" name=products key="position"}
            <div class="swiper-slide">
                {if isset($product_item_path)}
                    {include file="$product_item_path" position=$position}
                {/if}
            </div>		
        {/foreach}
    </div>
    <div class="swiper-pagination"></div>
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>

{else}
    
<div class="carousel slide" id="{$carouselName|escape:'html':'UTF-8'}">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
    {if count($products)>$itemsperpage}
		<div class="direction">
			<a class="carousel-control left" href="#{$carouselName|escape:'html':'UTF-8'}" data-slide="prev">
				<span class="icon-prev hidden-xs" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control right" href="#{$carouselName|escape:'html':'UTF-8'}" data-slide="next">
				<span class="icon-next" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
    {/if}
    <div class="carousel-inner">
        {$mproducts=array_chunk($products,$itemsperpage)}
        {foreach from=$mproducts item=products name=mypLoop}
            <div class="carousel-item {if $smarty.foreach.mypLoop.first}active{/if}">
                <ul class="product_list row grid {if isset($productClassWidget)}{$productClassWidget|escape:'html':'UTF-8'}{/if}">
                {foreach from=$products item="product" name=products key="position"}
                    <li class="ajax_block_product product_block {$scolumn} {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{/if}">
                        {if isset($product_item_path)}
                            {include file="$product_item_path" position=$position}
                        {/if}
                    </li>
                {/foreach}
                </ul>
            </div>		
        {/foreach}
    </div>
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>

{/if}


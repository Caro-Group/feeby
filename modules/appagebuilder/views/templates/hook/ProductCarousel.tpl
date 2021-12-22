{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ProductCarousel -->
{* min-w-swiper-mobile w-full mb-28 h-8 tablet:h-12 *}


<div class="tablet:mb-14 swiper-popular overflow-hidden min-w-swiper-mobile">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
    <div class="swiper-wrapper plist-dsimple">
        {$mproducts=array_chunk($products,$itemsperpage)}
        {foreach from=$products item="product" name=products key="position"}
            <div class="swiper-slide overflow-hidden">
                {if isset($product_item_path)}
                    {include file="$product_item_path" position=$position}
                {/if}
            </div>		
        {/foreach}
    </div>
    <div class="swiper-pagination"></div>
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>


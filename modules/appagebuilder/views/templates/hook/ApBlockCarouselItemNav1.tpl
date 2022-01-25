{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockCarouselItem -->
{* tablet:block border-1 border-2 border-main-dark tablet:flex hover:bg-main-dark hover:text-white pb-10 py-8 max-w-screen-full-hd classes used in blog swiper section*}

{$Num=array_chunk($formAtts.slides, $itemsperpage)}

{if count($Num) > 0}
	<div class="swiper" data-top-bar-swiper>
		<div class="swiper-wrapper h-5 tablet:h-10  select-none py-1 tablet:py-0" style="transition-timing-function: linear !important;" >
			{foreach from=$Num item=sliders name=val}
				{foreach from=$sliders item=slider key=i name="sliders"}
					<div class="swiper-slide h-5 tablet:h-10 flex items-center justify-center whitespace-nowrap" style="min-width:max-content !important;">
					{if $i == 1}{assign var="lazyImg" value="eager"}{else}{assign var="lazyImg" value="lazy"}{/if}
					{if $slider.link}
						<a class="flex justify-center items-center" title="{l s='%s' sprintf=[$slider.title] mod='appagebuilder'}" {if $formAtts.is_open}target="_blank"{/if} href="{$slider.link}{*full link can not escape*}">
					{else}
						<div class="flex justify-center items-center">
					{/if}

					{if (isset($slider.title) && !empty($slider.title)) || (isset($slider.sub_title) && !empty($slider.sub_title))}
					<p class="text-[10px] tablet:text-base mb-0 pr-8 font-light text-main-dark font-body">
						{if isset($slider.title) && !empty($slider.title)}
							<span class="text-main">{$slider.title|escape:'html':'UTF-8' nofilter}</span>
						{/if}
						{if isset($slider.sub_title) && !empty($slider.sub_title)}
							{$slider.sub_title|escape:'html':'UTF-8' nofilter}
						{/if}
					</p>
					{/if}


					
					{if isset($slider.image) && !empty($slider.image)}
						<div class="h-4 flex-shrink-0 flex justify-center items-center my-auto" style="flex-shrink:0;">
							<img loading="{$lazyImg}" class="h-full w-auto" src="{$slider.image|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
						</div>
					{/if}

					{if $slider.link}
						</a>
					{else}
						</div>
					{/if}
					</div>
				{/foreach}

			{/foreach}

		</div>
	</div>
{/if}
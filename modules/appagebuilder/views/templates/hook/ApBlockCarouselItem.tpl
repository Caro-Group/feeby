{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockCarouselItem -->
{* tablet:block border-1 border-2 border-main-dark tablet:flex hover:bg-main-dark hover:text-white pb-10 py-8 max-w-screen-full-hd classes used in blog swiper section*}


	{if isset($formAtts.title) && $formAtts.title}
		<h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8'}</h4>
	{/if}
	{if isset($formAtts.sub_title) && $formAtts.sub_title}
		<div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
	{/if}
	{if isset($formAtts.descript)}
		<div>{$formAtts.descript|escape:'html':'UTF-8'}</div>
	{/if}

	<div class="swiper-blog overflow-hidden" data-swiper-blog>
		<div class="swiper-wrapper ml-4">
		{$Num=array_chunk($formAtts.slides, $itemsperpage)}
		{foreach from=$Num item=sliders name=val}

			<div class="swiper-slide max-w-[235px] desktop-presta:max-w-[468px]">
			{foreach from=$sliders item=slider key=i name="sliders"}
				{if $i == 1}{if $hookName == 'displayNav' || $hookName == 'displayNav1' || $hookName == 'displayNav2' || $hookName == 'displayNavFullWidth'}{assign var="lazyImg" value="eager"}{else}{assign var="lazyImg" value="lazy"}{/if}{else}{assign var="lazyImg" value="lazy"}{/if}
				{if $slider.link}
					<a title="{l s='%s' sprintf=[$slider.title] mod='appagebuilder'}" {if $formAtts.is_open}target="_blank"{/if} href="{$slider.link}{*full link can not escape*}">
					<div class=" aspect-square ">
				{/if}
				{if isset($slider.image) && !empty($slider.image)}
					<img class="object-cover w-full max-h-[170px] tablet:max-h-none h-full tablet:h-3/6 phablet:h-4/5 phablet:h-3/4" loading="{$lazyImg}" src="{$slider.image|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
				{else}
					{if isset($slider.image_link) && !empty($slider.image_link)}
						<img class="object-cover w-full max-h-[170px] h-full tablet:max-h-none h-full tablet:h-3/6 phablet:h-4/5 phablet:h-3/4" loading="{$lazyImg}" src="{$slider.image_link|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
					{/if}
				{/if}
				<div class="p-5 bg-white flex flex-col justify-between h-auto tablet:h-3/6 phablet:h-1/5 ">
				
					{if isset($slider.title) && !empty($slider.title)}
						<h2 class="font-normal tablet:text-base italic desktop-presta:text-2xl line-clamp-2 phablet:line-clamp-1 desktop-wide:line-clamp-2">{$slider.title|escape:'html':'UTF-8' nofilter}</h2>
					{/if}
					{if isset($slider.sub_title) && !empty($slider.sub_title)}
						<p class="uppercase hover:text-main transition font-body font-normal text-[10px] tablet:text-sm">{$slider.sub_title|escape:'html':'UTF-8' nofilter}<i class="ti-arrow-right ml-2"></i></p>
					{/if}
				</div>
				{if isset($slider.descript) && !empty($slider.descript)}
					<div class="descript">{$slider.descript nofilter}{* HTML form , no escape necessary *}</div>
				{/if}
				{if $slider.link}
					</div>
					</a>
				{/if}

			{/foreach}
			</div>

		{/foreach}
		</div>
	</div>

	<style>
		.slide-content{
			aspect-ratio: 1;
		}
	</style>








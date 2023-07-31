{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockCarouselItem -->
{* tablet:block border-1 border-2 border-main-dark tablet:flex hover:bg-main-dark hover:text-white pb-10 py-8 max-w-screen-full-hd classes used in blog swiper section*}
{* desktop:-mx-[140px] *}

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
			<div class="swiper-slide max-w-[235px] desktop-presta:max-w-[466px] mr-[20px]">
			{foreach from=$sliders item=slider key=i name="sliders"}
				{if $i == 1}{if $hookName == 'displayNav' || $hookName == 'displayNav1' || $hookName == 'displayNav2' || $hookName == 'displayNavFullWidth'}{assign var="lazyImg" value="eager"}{else}{assign var="lazyImg" value="lazy"}{/if}{else}{assign var="lazyImg" value="lazy"}{/if}
				{if $slider.link}
					<a title="{l s='%s' sprintf=[$slider.title] mod='appagebuilder'}" {if $formAtts.is_open}target="_blank"{/if} href="{$slider.link}{*full link can not escape*}">
					<div class=" aspect-square ">
				{/if}
				{if isset($slider.image) && !empty($slider.image)}
					<picture>
						<source srcset="{$slider.image|replace:" ":"%20"|replace:".png":".webp"|replace:".jpg":".webp"|escape:'html':'UTF-8'}" type="image/webp">
						<source srcset="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg"> 
						<img class="block swiper-lazy object-cover w-full h-full max-h-[182px] tablet:max-h-[367px]" loading="{$lazyImg}" 
					src="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
					</picture>
				{else}
					{if isset($slider.image_link) && !empty($slider.image_link)}
						<img class="block swiper-lazy object-cover w-full h-full max-h-[182px] tablet:max-h-[367px]" loading="{$lazyImg}"  
						src="{$slider.image_link|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
					{/if}
				{/if}
				<div class="p-5 bg-white flex flex-col justify-between max-h-[90px] tablet:max-h-[108px] h-full">
				
					{if isset($slider.title) && !empty($slider.title)}
						<h2 class="font-normal font-body tablet:text-base desktop-presta:text-2xl line-clamp-2 phablet:line-clamp-1 desktop-wide:line-clamp-2 mt-0">{$slider.title|escape:'html':'UTF-8' nofilter}</h2>
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

	<div class="hidden tablet:flex ml-3">
		<div class="my-8">
			<i	class="ti-arrow-left inline-block swiper_blog-button-prev p-3 ml-6 border-2 border-main-dark text-main-dark hover:bg-main-dark hover:text-white rounded-full border-solid   transition cursor-pointer" data-swiper-blog-prev ></i>
			<i	class="ti-arrow-right inline-block swiper_blog-button-next p-3 ml-6 border-2 border-main-dark text-main-dark hover:bg-main-dark hover:text-white rounded-full border-solid   transition cursor-pointer" data-swiper-blog-next ></i>
		</div>
	</div>

<style>
	.slide-content{
		aspect-ratio: 1;
	}
</style>

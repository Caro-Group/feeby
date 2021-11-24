{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockCarouselItem -->
{* tablet:block border-1 border-2 border-gray-main border-main tablet:flex hover:border-main pb-10 *}

{if $page.page_name == 'index'}

	{if isset($formAtts.title) && $formAtts.title}
		<h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8'}</h4>
	{/if}
	{if isset($formAtts.sub_title) && $formAtts.sub_title}
		<div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
	{/if}
	{if isset($formAtts.descript)}
		<div>{$formAtts.descript|escape:'html':'UTF-8'}</div>
	{/if}

	<div class="swiper-blog overflow-hidden">
		<div class="swiper-wrapper ml-4">
		{$Num=array_chunk($formAtts.slides, $itemsperpage)}
		{foreach from=$Num item=sliders name=val}

			<div class="swiper-slide">
			{foreach from=$sliders item=slider name="sliders"}

				{if $slider.link}
					<a title="{l s='%s' sprintf=[$slider.title] mod='appagebuilder'}" {if $formAtts.is_open}target="_blank"{/if} href="{$slider.link}{*full link can not escape*}">
					<div class="slide-content">
				{/if}
				{if isset($slider.image) && !empty($slider.image)}
					<img class="object-fit w-full h-4/5 phablet:h-3/4" src="{$slider.image|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
				{else}
					{if isset($slider.image_link) && !empty($slider.image_link)}
						<img class="object-fit w-full h-4/5 phablet:h-3/4" src="{$slider.image_link|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
					{/if}
				{/if}
				<div class="p-5 bg-white flex flex-col justify-between h-2/6 phablet:h-1/5">
				
					{if isset($slider.title) && !empty($slider.title)}
						<h4 class="font-light">{$slider.title|escape:'html':'UTF-8' nofilter}</h4>
					{/if}
					{if isset($slider.sub_title) && !empty($slider.sub_title)}
						<p class="uppercase hover:text-main transition">{$slider.sub_title|escape:'html':'UTF-8' nofilter}<i class="ti-arrow-right ml-2"></i></p>
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




{else}
		
	{if isset($formAtts.title) && $formAtts.title}
		<h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8'}</h4>
	{/if}
	{if isset($formAtts.sub_title) && $formAtts.sub_title}
		<div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
	{/if}
	{if isset($formAtts.descript)}
		<div>{$formAtts.descript|escape:'html':'UTF-8'}</div>
	{/if}
	<div data-ride="carousel" class="carousel slide" id="{$carouselName|escape:'html':'UTF-8'}">
		{$NumCount = count($formAtts.slides)}
		{if $NumCount > $itemsperpage}
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
		{$Num=array_chunk($formAtts.slides, $itemsperpage)}
		{foreach from=$Num item=sliders name=val}
			<div class="carousel-item {if $smarty.foreach.val.first}active{/if}">
				{foreach from=$sliders item=slider name="sliders"}
					{if $nbItemsPerLine == 1 || $smarty.foreach.sliders.first || $smarty.foreach.sliders.iteration%$nbItemsPerLine == 1}
						<div class="row">
					{/if}
					<div class="{$scolumn|escape:'html':'UTF-8'}">
						{if $slider.link}
						<a title="{l s='%s' sprintf=[$slider.title] mod='appagebuilder'}" {if $formAtts.is_open}target="_blank"{/if} href="{$slider.link}{*full link can not escape*}">
						{/if}
						
						{if isset($slider.image) && !empty($slider.image)}
							<img class="img-fluid{if $aplazyload} lazy{/if}" {if $aplazyload} data-src{else}src{/if}="{$slider.image|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
						{else}
							{if isset($slider.image_link) && !empty($slider.image_link)}
								<img class="img-fluid{if $aplazyload} lazy{/if}" {if $aplazyload} data-src{else}src{/if}="{$slider.image_link|escape:'html':'UTF-8'}" alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}"/>
							{/if}
						{/if}
						{if isset($slider.title) && !empty($slider.title)}
							<div class="title">{$slider.title|escape:'html':'UTF-8' nofilter}</div>
						{/if}
						{if isset($slider.sub_title) && !empty($slider.sub_title)}
							<p class="sub-title">{$slider.sub_title|escape:'html':'UTF-8' nofilter}</p>
						{/if}
						{if isset($slider.descript) && !empty($slider.descript)}
							<div class="descript">{$slider.descript nofilter}{* HTML form , no escape necessary *}</div>
						{/if}
						{if $slider.link}
						</a>
						{/if}
					</div>
					{if $nbItemsPerLine == 1 || $smarty.foreach.sliders.last || $smarty.foreach.sliders.iteration%$nbItemsPerLine == 0}
						</div>
					{/if}
				{/foreach}
			</div>
		{/foreach}
	</div>
	</div>


{/if}






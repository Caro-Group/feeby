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

<div class="ml-[30px] tablet:ml-0 swiper-about" data-about-swiper>
	<div class="swiper-wrapper">
		{$Num=array_chunk($formAtts.slides, $itemsperpage)}
		{foreach from=$Num item=sliders name=val}

			{foreach from=$sliders item=slider key=i name="sliders"}
				<div class="swiper-slide">

					<div class="w-[50px] tablet:w-[70px] aspect-square mb-6 bg-gray-1000 rounded-md swiper-lazy">
						{if isset($slider.image) && !empty($slider.image)}
							<picture>
								<source
									data-srcset="{$slider.image|replace:" ":"%20"|replace:".jpg":".webp"|replace:".png":".webp"|escape:'html':'UTF-8'}"
									type="image/webp">
								<source data-srcset="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg">
								<img class="block p-1 tablet:p-2 select-none h-auto swiper-lazy" loading="lazy" data-lazy
									data-src="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}"
									alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}" width="70"
									height="70" />
							</picture>
						{else}
							{if isset($slider.image_link) && !empty($slider.image_link)}
								<img class="block p-1 tablet:p-2 h-auto select-none swiper-lazy" loading="lazy" data-lazy
									data-src="{$slider.image_link|escape:'html':'UTF-8'}"
									alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}" width="70" height="70" />
							{/if}
						{/if}
					</div>

						{if isset($slider.title) && !empty($slider.title)}
							<h3 class="mb-6 text-base tablet:text-2xl text-gray-main font-normal">{$slider.title|escape:'html':'UTF-8' nofilter}</h3>
						{/if}
						{if isset($slider.sub_title) && !empty($slider.sub_title)}
							<p class="uppercase hover:text-main transition font-body font-normal text-[10px] tablet:text-sm">
								{$slider.sub_title|escape:'html':'UTF-8' nofilter}<i class="ti-arrow-right ml-2"></i></p>
						{/if}
						{if isset($slider.descript) && !empty($slider.descript)}
							<div>
								<p class="text-main-dark text-sm tablet:text-base font-light font-body">
									{$slider.descript nofilter}{* HTML form , no escape necessary *}</p>
							</div>
						{/if}


				</div>
			{/foreach}

		{/foreach}
	</div>
</div>
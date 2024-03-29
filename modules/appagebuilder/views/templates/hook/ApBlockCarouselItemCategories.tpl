{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockCarouselItem -->
{* tablet:block border-1 border-2 border-main-dark tablet:flex hover:bg-main-dark hover:text-white pb-10 py-8 max-w-screen-full-hd classes used in blog swiper section*}


<div class="my-2.5 swiper !overflow-visible" data-categories-swiper>
	<div class="swiper-wrapper">
		{$Num=array_chunk($formAtts.slides, $itemsperpage)}
		{foreach from=$Num item=sliders name=val}
			{foreach from=$sliders item=slider key=i name="sliders"}

			<div class="swiper-slide mr-[25px] !w-auto">
					{if $slider.link}
					<a href="{$slider.link}" class="w-[70px] flex flex-col items-center gap-1.5 cursor-pointer">
						<div class="w-full h-auto aspect-square rounded-full overflow-hidden border border-solid border-main-dark">
						{if isset($slider.image) && !empty($slider.image)}
							<picture class="w-full h-full" >
								<source
									data-srcset="{$slider.image|replace:" ":"%20"|replace:".jpg":".webp"|replace:".png":".webp"|escape:'html':'UTF-8'}"
									type="image/webp">
								<source data-srcset="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg">
								<img class="w-full h-full object-cover" loading="lazy" data-lazy
									data-src="{$slider.image|replace:" ":"%20"|escape:'html':'UTF-8'}"
									alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}" width="70"
									height="70" />
							</picture>
						{else}
							{if isset($slider.image_link) && !empty($slider.image_link)}
								<img class="w-full h-full object-cover" loading="lazy" data-lazy
									data-src="{$slider.image_link|escape:'html':'UTF-8'}"
									alt="{if isset($slider.title)}{$slider.title|escape:'html':'UTF-8'}{/if}" width="70" height="70" />
							{/if}
						{/if}
						</div>
						{if isset($slider.title) && !empty($slider.title)}
							<span class="flex justify-center font-normal text-center text-main-dark text-xs font-medium w-full ">{$slider.title|escape:'html':'UTF-8' nofilter}</span>
						{/if}
					</a>

					{/if}

				</div>
					
			{/foreach}
		{/foreach}
	</div>
</div>
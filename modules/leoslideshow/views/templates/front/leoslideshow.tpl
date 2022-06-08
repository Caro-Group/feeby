{* 
* @Module Name: Leo Slideshow
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="swiper-banner overflow-hidden tablet-medium:rounded-md -mx-[10px] tablet-medium:mx-0">
	<div class="swiper-wrapper">
	{if $sliders}
		{foreach from=$sliders item=slider name="sliders"}
		<div class="swiper-slide"
		data-pausetime="{$slider.data_delay|escape:'html':'UTF-8'}">
		
			{if $slider.video.active}
				<!-- SLIDE VIDEO BEGIN -->
				<div data-leo_image="{$slider.thumbnail|escape:'html':'UTF-8'}"
					data-leo_type="video"
					data-leo_transition="strip-right-fade,strip-left-fade"
					data-leo_background="{$slider.background_type|escape:'html':'UTF-8'}"
					data-autoplay="{$slider.video.videoauto}"
					data-videoid="{$slider.video.videoid|escape:'html':'UTF-8'}">
					<iframe src="{$slider.video.videoURL|escape:'html':'UTF-8'}?title=0&amp;byline=0&amp;portrait=0;api=1" width="100%" height="100%" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
				</div>
				<!-- SLIDE VIDEO END -->
			{else}
				
				<!-- SLIDE IMAGE BEGIN -->
				<a 
					{if $slider.data_link != ''} href="{$slider.data_link|escape:'html':'UTF-8'}"{/if}
					{if $slider.data_target != ''} target="{$slider.data_target|escape:'html':'UTF-8'}"{/if}
					{if $slider.background_color != ''} style="background-color:{$slider.background_color|escape:'html':'UTF-8'};"{/if}			
					>		

					<img
						class="block swiper-lazy min-w-full desktop-wide:h-banner-final object-left h-auto"
						loading="{if $smarty.foreach.sliders.first}{else}lazy{/if}"
						width="{$sliderParams['width']|escape:'html':'UTF-8'}"
						height="{$sliderParams['height']|escape:'html':'UTF-8'}"
						alt="{$slider.title|escape:'html':'UTF-8'}"
						data-src="{$slider.main_image|escape:'html':'UTF-8'}">
				</a>

				<div>
					
					
					{if isset($slider.layersparams)}
						{foreach from=$slider.layersparams item=layer}
							
							<div class="tp-caption {if $layer.layer_link}data-link{/if}{if $layer.layer_class} {$layer.layer_class|escape:'html':'UTF-8'}{/if}" 
								data-x="{$layer.layer_left|escape:'html':'UTF-8'}"
								data-y="{$layer.layer_top|escape:'html':'UTF-8'}"
								data-transition="{$layer.layer_transition|escape:'html':'UTF-8'}"
								{if $layer.layer_link}onclick="event.stopPropagation();window.open('{$layer.layer_link|escape:'html':'UTF-8'}','{$layer.layer_target|escape:'html':'UTF-8'}');"{/if}
								{if $layer.css}style="{$layer.css|escape:'html':'UTF-8'};"{/if}
								>
								
								{if $layer.layer_type == "text"}<!-- LAYER TEXT BEGIN -->
									{$layer.layer_caption|replace:"_ASM_":"&"|replace:"_LEO_BACKSLASH_":"\\"|replace:"_LEO_DOUBLE_QUOTE_":"&quot;" nofilter}
								{/if}<!-- LAYER TEXT END -->


								{if $layer.layer_type == "image"}<!-- LAYER IMAGE BEGIN -->
									<img src="{$layer.layer_content|escape:'html':'UTF-8'}" alt="" class="img_disable_drag"/>
								{/if}<!-- LAYER IMAGE END -->


								{if $layer.layer_type == "video"}<!-- LAYER VIDEO BEGIN -->
									{if $layer.layer_video_type == "vimeo"}
										<iframe src="http://player.vimeo.com/video/{$layer.layer_video_id|escape:'html':'UTF-8'}?wmode=transparent&amp;title=0&amp;byline=0&amp;portrait=0;api=1" width="{$layer.layer_video_width|escape:'html':'UTF-8'}" height="{$layer.layer_video_height|escape:'html':'UTF-8'}" ></iframe>
									{else}
										<iframe src="http://www.youtube.com/embed/{$layer.layer_video_id|escape:'html':'UTF-8'}?wmode=transparent" width="{$layer.layer_video_width|escape:'html':'UTF-8'}" height="{$layer.layer_video_height|escape:'html':'UTF-8'}"></iframe>
									{/if}
								{/if}<!-- LAYER VIDEO END -->
								
								
							</div>
						{/foreach}
					{/if}
					
				</div><!-- SLIDE IMAGE END -->
			{/if}

		</div>
		{/foreach}
	{/if}
	</div>
	<div class="tablet:hidden swiper-pagination"></div>
	<div class="hidden tablet:block absolute bottom-16 w-full z-10">
		<div class="max-w-screen-desktop-wide mx-auto px-16">
			<i class="ti-arrow-left swiper_banner-button-prev p-3 ml-6 border-2 border-white text-white hover:bg-white hover:text-main-dark rounded-full border-solid transition cursor-pointer"></i>
			<i class="ti-arrow-right swiper_banner-button-next p-3 ml-6 border-2 border-white text-white hover:bg-white hover:text-main-dark rounded-full border-solid transition cursor-pointer"></i>
		</div>
	</div>
</div>

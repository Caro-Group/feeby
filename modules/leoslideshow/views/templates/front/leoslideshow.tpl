{* 
* @Module Name: Leo Slideshow
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="swiper-banner">
	<div class="swiper-wrapper">
	{if $sliders}
		{foreach from=$sliders item=slider}
		<div class="swiper-slide">
		
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
				<div class="slide_config {if isset($slider.data_link)&& $slider.data_link}data-link{/if}"
					{if $slider.main_image != ''} data-leo_image="{$slider.main_image|escape:'html':'UTF-8'}"{/if}
					{if $slider.background_color != ''} data-leo_background_color="{$slider.background_color|escape:'html':'UTF-8'}"{/if}					
					{if $slider.data_link != ''} data-link="{$slider.data_link|escape:'html':'UTF-8'}"{/if}
					{if $slider.data_target != ''} data-target="{$slider.data_target|escape:'html':'UTF-8'}"{/if}
					data-leo_pausetime="{$slider.data_delay|escape:'html':'UTF-8'}"
					data-leo_thumbnail="{$slider.thumbnail|escape:'html':'UTF-8'}"
					data-leo_background="{$slider.background_type|escape:'html':'UTF-8'}"					
					{if $slider.enable_custom_html_bullet}
					data-leo_bullet_description="{$slider.bullet_description}"{* HTML form , no escape necessary *}
					data-leo_bullet_class="{$slider.bullet_class|escape:'html':'UTF-8'}"
					{/if}												
					>
					
					
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
	<div class="swiper-pagination"></div>
	<div>
		<i class="ti-arrow-left swiper_banner-button-prev p-3 ml-6 border-2 border-gray-main text-gray-main hover:bg-gray-main hover:text-white rounded-full border-solid   transition cursor-pointer"></i>

		<i class="ti-arrow-right swiper_banner-button-next p-3 ml-6 border-2 border-gray-main text-gray-main hover:bg-gray-main hover:text-white rounded-full border-solid   transition cursor-pointer"></i>
	</div>
</div>

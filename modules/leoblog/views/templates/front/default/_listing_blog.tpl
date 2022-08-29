{*
 *  Leo Prestashop SliderShow for Prestashop 1.6.x
 *
 * @package   leosliderlayer
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
*}

<article class="h-full">
	<div class="bg-gray-1000 flex flex-col">
		
		{if $blog.image && $config->get('listing_show_image',1)}
			<div class="relative mb-[30px]">
				<img 
					src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
					data-lazy
					data-src="{$blog.preview_url|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}"
					width="468"
					height="300"
					alt="" class="w-full h-auto max-h-[300px]" />

				<time class="absolute bottom-0 left-0 m-[30px] p-[9px] bg-white font-header font-italic font-light items-center text-center text-main-dark text-[16px]" datetime="{strtotime($blog.date_add)|date_format:"%Y"|escape:'html':'UTF-8'}">
					<span class="block text-[47px] leading-[47px]">
						{assign var='blog_day' value=strtotime($blog.date_add)|date_format:"%e"}
						{l s=$blog_day d='Shop.Theme.Global'}
						<!-- day of month -->
					</span>
					
					{assign var='blog_month' value=strtotime($blog.date_add)|date_format:"%m"}
					{l s=$blog_month d='Shop.Theme.Global'}
					<!-- month-->
					/
					{assign var='blog_year' value=strtotime($blog.date_add)|date_format:"%Y"}
					{l s=$blog_year d='Shop.Theme.Global'}
					<!-- year -->
				</time>
			</div>
		{/if}

		<div class="px-[30px]">
			{if $config->get('listing_show_title','1')}
				<h2 class="font-header font-light text-[25px] mb-[30px]">
					<a href="{$blog.link|escape:'html':'UTF-8'}" class="text-main-dark"
						title="{$blog.title|escape:'html':'UTF-8'}">{$blog.title|escape:'html':'UTF-8'}</a>
				</h2>
			{/if}

			{if $config->get('listing_show_description','1')}
				<div class="mb-[38px] [&>*]:text[16px] [&>*]:leading[21px]">
					{$blog.description|strip_tags:'UTF-8'|truncate:160:'...' nofilter}{* HTML form , no escape necessary *}
				</div>
			{/if}
			
			{if $config->get('listing_show_readmore',1)}
				<a class="mb-[35px] flex items-center uppercase text-[14px] mr-[16px] leading-[16px] text-main-dark" href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}">
					{l s='Read more' d='Shop.Theme.Global'}

					<svg xmlns="http://www.w3.org/2000/svg" width="15" height="13" viewBox="0 0 16 14" fill="none" class="ml-[10px]">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M9.25 13.3837L15.5 7.13375V6.25L9.25 0L8.36625 0.88375L13.5487 6.0675H0.5V7.3175H13.55L8.365 12.5L9.24875 13.3837H9.25Z" fill="#232322"/>
					</svg>			
				</a>
			{/if}
		</div>
	</div>
</article>
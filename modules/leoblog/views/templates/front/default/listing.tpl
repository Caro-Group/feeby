{* 
* @Module Name: Leo Blog
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
* @description: Content Management
*}

{extends file=$layout}

{block name='content'}
	<section id="main">
		{if isset($no_follow) AND $no_follow}
			{assign var='no_follow_text' value='rel="nofollow"'}
		{else}
			{assign var='no_follow_text' value=''}
		{/if} 
		<div id="blog-listing" class="blogs-container box">
			{if isset($filter.type)}
				{if $filter.type=='tag'}
					<h1>{l s='Filter Blogs By Tag' mod='leoblog'} : <span>{$filter.tag|escape:'html':'UTF-8'}</span></h1>
				{elseif $filter.type=='author'}
					{if isset($filter.id_employee)}
						<h1>{l s='Filter Blogs By Blogger' mod='leoblog'} : <span>{$filter.employee->firstname|escape:'html':'UTF-8'} {$filter.employee->lastname|escape:'html':'UTF-8'}</span></h1>
					{else}
						<h1>{l s='Filter Blogs By Blogger' mod='leoblog'} : <span>{$filter.author_name|escape:'html':'UTF-8'}</span></h1>
					{/if}
					
				{/if}
			{else}
				<h1 class="blog-lastest-title">{l s='Lastest Blogs' mod='leoblog'}</h1>
				{if $url_rss != ''}
					<h4 class="blog-lastest-rss"><a href="{$url_rss|escape:'htmlall':'UTF-8'}">{l s='RSS' mod='leoblog'}</a></h4>
				{/if}
                <p class="font-body mb-[52px] text-[16px]">{$meta_description|escape:'html':'UTF-8'}</p>
			{/if}

			<div class="inner">
				{if count($leading_blogs)+count($secondary_blogs)>0}
                    <div class="flex flex-wrap -mx-[10px]">
                        {if count($leading_blogs)}
                            {foreach from=$leading_blogs item=blog name=leading_blog}
                                <div class="px-[10px] w-full tablet:w-1/2 {if $listing_leading_column>1}desktop:w-4/12{/if} mb-[40px]">
                                    {include file="$_listing_blog"}
                                </div>	
                            {/foreach}
                        {/if}


                        {if count($secondary_blogs)}
                            {foreach from=$secondary_blogs item=blog name=secondary_blog}
                                <div class="px-[10px] w-full tablet:w-1/2 desktop:w-4/12 mb-[40px]">
                                    {include file="$_listing_blog"}
                                </div>
                            {/foreach}
                        {/if}
                    </div>

					<div class="top-pagination-content clearfix bottom-line">
                        {include file="$_pagination"}
					</div>
				{else}
					<div class="alert alert-warning">{l s='Sorry, We are update data, please come back later!!!!' mod='leoblog'}</div>
				{/if}    

			</div>
		</div>
	</section>
{/block}
{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{block name='product_tabs'}
	<div class="product-tabs tabs">
	  	<ul class="flex items-baseline flex-nowrap nav nav-tabs mb-5 after:content-[''] after:h-[1px] after:w-full after:absolute after:bottom-[2px] relative after:bg-[#F8F8F8] after:z-[-1]" role="tablist">
		    {if $product.description}
		    	<li class="nav-item mr-12 md:mr-[79px]">
				   <a
					 class="font-body text-base tablet:text-[25px] text-gray-3000 border-0 border-b-[3px] border-solid rounded-b-[3px] nav-link font-normal{if $product.description} active{/if}"
					 data-toggle="tab"
					 href="#description"
					 role="tab"
					 aria-controls="description"
					 {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
				</li>
	    	{/if}
		    <li class="nav-item mr-5 md:mr-[79px]">
				<a
				  class="font-body text-base tablet:text-[25px] text-gray-3000 border-0 border-b-[3px] border-solid rounded-b-[3px] nav-link font-normal{if !$product.description} active{/if}"
				  data-toggle="tab"
				  href="#product-details"
				  role="tab"
				  aria-controls="product-details"
				  {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
			</li>
		    {if $product.attachments}
				<li class="nav-item mr-5 md:mr-[79px]">
				  <a
					class="font-body text-base tablet:text-[25px] text-gray-3000 border-0 border-b-[3px] border-solid rounded-b-[3px] nav-link font-normal"
					data-toggle="tab"
					href="#attachments"
					role="tab"
					aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
				</li>
			 {/if}
		    {foreach from=$product.extraContent item=extra key=extraKey}
			    <li class="nav-item mr-5 md:mr-[79px]">
				  <a
					class="font-body text-base tablet:text-[25px] text-gray-3000 border-0 border-b-[3px] border-solid rounded-b-[3px] nav-link font-normal"
					data-toggle="tab"
					href="#extra-{$extraKey}"
					role="tab"
					aria-controls="extra-{$extraKey}">{$extra.title}</a>
				</li>
		    {/foreach}
	  	</ul>

	  	<div class="tab-content" id="tab-content">
		   	<div class="tab-pane pt-0 tablet:p-5 tablet:pt-8 fade in{if $product.description} active{/if}" id="description" role="tabpanel">
		     	{block name='product_description'}
					<div class="flex flex-wrap product-desc-wrapper">
		       			<div class="w-full product-description mb-[60px] tablet:mb-5">
						   <h2 class="h2 product-title" itemprop="name">{$product.name}</h2>
						   {$product.description nofilter}
						</div>
					</div>
		     	{/block}
		   	</div>

		   	{block name='product_details'}
		     	{include file='catalog/_partials/product-details.tpl'}
		   	{/block}

		   	{block name='product_attachments'}
		     	{if $product.attachments}
		      	<div class="tab-pane fade in" id="attachments" role="tabpanel">
		         	<section class="product-attachments">
		           		<h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
			           	{foreach from=$product.attachments item=attachment}
			             	<div class="attachment">
				               	<h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
				               	<p>{$attachment.description}</p>
				               	<a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
				                 {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
				               	</a>
			             	</div>
			           	{/foreach}
		         	</section>
		       	</div>
		     	{/if}
		   	{/block}
		   	{foreach from=$product.extraContent item=extra key=extraKey}
			   	<div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
			       {$extra.content nofilter}
			   	</div>
		   {/foreach}
		</div>
	</div>

	<div class="product-tabs tabs reviews">
	  	<ul class="nav nav-tabs after:content-[''] after:h-[1px] after:w-full after:absolute after:bottom-[2px] relative after:bg-[#F8F8F8] after:z-[-1]" role="tablist">
			{hook h='displayLeoProductTab' product=$product}
	  	</ul>

	  	<div class="tab-content  -mx-5" id="tab-content">
		   	{hook h='displayLeoProductTabContent' product=$product}
		</div>
  	</div>

{/block}
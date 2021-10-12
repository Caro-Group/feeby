{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{block name='product_tabs'}
	<div class="product-tabs tabs">
	  	<ul class="nav nav-tabs" role="tablist">
		    {if $product.description}
		    	<li class="nav-item">
				   <a
					 class="nav-link{if $product.description} active{/if}"
					 data-toggle="tab"
					 href="#description"
					 role="tab"
					 aria-controls="description"
					 {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
				</li>
	    	{/if}
		    <li class="nav-item">
				<a
				  class="nav-link{if !$product.description} active{/if}"
				  data-toggle="tab"
				  href="#product-details"
				  role="tab"
				  aria-controls="product-details"
				  {if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
			</li>
		    {if $product.attachments}
				<li class="nav-item">
				  <a
					class="nav-link"
					data-toggle="tab"
					href="#attachments"
					role="tab"
					aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
				</li>
			 {/if}
		    {foreach from=$product.extraContent item=extra key=extraKey}
			    <li class="nav-item">
				  <a
					class="nav-link active"
					data-toggle="tab"
					href="#extra-{$extraKey}"
					role="tab"
					aria-controls="extra-{$extraKey}">{$extra.title}</a>
				</li>
		    {/foreach}
	  	</ul>

	  	<div class="tab-content" id="tab-content">
		   	<div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
		     	{block name='product_description'}
				 	<h2 class="h2 product-title" itemprop="name">{$product.name}</h2>
					<div class="product-desc-wrapper">
		       			<div class="product-description">{$product.description nofilter}</div>
						<div class="product-icons-description">{hook h='displayApSC' sc_key=sc3645178611}</div>
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
			   	<div class="tab-pane fade in {$extra.attr.class} active" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
			       {$extra.content nofilter}
			   	</div>
		   {/foreach}
		</div>
	</div>

	<div class="product-tabs tabs reviews">
	  	<ul class="nav nav-tabs" role="tablist">
			{hook h='displayLeoProductTab' product=$product}
	  	</ul>

	  	<div class="tab-content" id="tab-content">
		   	{hook h='displayLeoProductTabContent' product=$product}
		</div>
    </div>

{literal}
<style>
.product-tabs.tabs{    
   display: flex;
    flex-direction: column;
}

.product-tabs.tabs .nav.nav-tabs{  
	display: flex;
	border-bottom: 1px solid #000;
	margin-bottom: 10px;
	width: 100%;
	text-align: left;
}

.product-tabs.tabs .nav-tabs .nav-item{
	margin: 0;
}

@media(max-width: 400px){
	.product-tabs.tabs .nav-tabs .nav-link{
		background: transparent;
		margin: 0;
	}
}

.product-tabs.tabs.reviews{
    border: 0;
}

.product-description{
	margin-bottom: 20px;
}

@media(min-width: 1200px){
	.product-description{
		padding-right: 100px;
		margin-bottom: 0;
	}
}

.product-desc-wrapper{
display:flex;
    flex-wrap: wrap;
}

@media(min-width: 1200px){
.product-desc-wrapper{
    flex-wrap: nowrap;
}
}

.product-icons-description{
    flex: 0 0 auto;
		max-width: 500px;
    width: 100%;
}

.product-icons-description .ApImage{
display: flex;
    flex-direction: column;
}

.product-icons-description .ApImage img{
	    max-width: 50px;
    margin-bottom: 10px;
    order: -1;
}
</style>
{/literal}

{/block}
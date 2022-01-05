{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}

{if ($nbReviews_product_extra == 0 && $too_early_extra == false && ($customer.is_logged || $allow_guests_extra)) || ($nbReviews_product_extra != 0)}
	<div id="leo_product_reviews_block_extra" class="flex flex-row" {if $nbReviews_product_extra != 0}itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating"{/if}>
		<div class="reviews_note clearfix">
			<div class="star_content clearfix">
				{if $nbReviews_product_extra != 0}	
					{section name="i" start=0 loop=5 step=1}
						{if $averageTotal_extra le $smarty.section.i.index}
							<div class="star"></div>
						{else}
							<div class="star star_on"></div>
						{/if}
					{/section}
					<meta itemprop="worstRating" content = "0" />
					<meta itemprop="ratingValue" content = "{if isset($ratings_extra.avg)}{$ratings_extra.avg|round:1|escape:'html':'UTF-8'}{else}{$averageTotal_extra|round:1|escape:'html':'UTF-8'}{/if}" />
					<meta itemprop="bestRating" content = "5" />
				{else}
					{section name="i" start=0 loop=5 step=1}
						<div class="star star_on"></div>
					{/section}
				{/if}
			</div>
		</div>		
		<div>
			{if $nbReviews_product_extra != 0}
				<a href="javascript:void(0)" class="read-review">					
					<i class="material-icons">&#xE0B9;</i>
					<span itemprop="reviewCount">{$nbReviews_product_extra}</span> {l s='Reviews' d='Modules.Leofeature.Shop'}
				</a>
			{else if ($too_early_extra == false AND ($customer.is_logged OR $allow_guests_extra))}
				<a class="open-review-form" href="#reviewForm" data-id-product="{$id_product_review_extra}" data-is-logged="{$customer.is_logged}" data-product-link="{$link_product_review_extra}">
					<span class="font-light leading-10 text-5xl">+</span>
					{l s='Write a review' d='Modules.Leofeature.Shop'}
				</a>
			{/if}
		</div>
	</div>
{/if}


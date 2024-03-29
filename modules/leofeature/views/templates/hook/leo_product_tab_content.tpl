{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}
{if isset($USE_PTABS) && $USE_PTABS == 'default'}
	
{else if isset($USE_PTABS) && $USE_PTABS == 'accordion'}
	<div id="collapseleofeatureproductreview" class="collapse" role="tabpanel">
          <div class="card-block">
{else}
	<div class="tab-pane fade in active" id="leo-product-show-review-content">	
{/if}

		<div id="product_reviews_block_tab">
			<div class="tablet:columns-2 w-full tablet:gap-[80px]">
				{if $reviews}
					{foreach from=$reviews item=review}
						{if $review.content}
						<div class="break-inside-avoid-column review pb-5" itemprop="review" itemscope itemtype="https://schema.org/Review">
							<div class="review-info mt-[60px] mb-[60px] border-0 border-b border-solid border-gray-2000 pb-5">

								<div class="review_details mb-[20px]">
									<p itemprop="name" class="font-body font-normal text-base desktop:text-[20px]">
										~{$review.title}
									</p>
									<p class="font-light font-body min-h-[60px]" itemprop="reviewBody">{$review.content|escape:'html':'UTF-8'|nl2br nofilter}</p>
								</div>
								
								<div class="review_author">
									<div class="review_author_infos flex justify-between flex-wrap">
										<div class="flex items-center justify-start flex-wrap">
											<div style="margin-right: 10px;" class="star_content clearfix"  itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
												{section name="i" start=0 loop=5 step=1}
													{if $review.grade le $smarty.section.i.index}
														<div class="star"></div>
													{else}
														<div class="star star_on"></div>
													{/if}
												{/section}
												<meta itemprop="worstRating" content = "0" />
												<meta itemprop="ratingValue" content = "{$review.grade|escape:'html':'UTF-8'}" />
												<meta itemprop="bestRating" content = "5" />
											</div>
											<strong itemprop="author">{$review.customer_name|escape:'html':'UTF-8'}</strong>
										</div>
										<meta itemprop="datePublished" content="{$review.date_add|escape:'html':'UTF-8'|substr:0:10}" />
										<em>{dateFormat date=$review.date_add|escape:'html':'UTF-8' full=0}</em>
									</div>
								</div>

							</div>
							
						</div>
						{/if}
					{/foreach}
				{/if}
			</div>
		</div> 
		
{if isset($USE_PTABS) && $USE_PTABS == 'default'}
		
{else if isset($USE_PTABS) && $USE_PTABS == 'accordion'}
		</div>
	</div>
{else}
	</div>	
{/if}
 
<div id="reviewForm" class="review-form" data-review-form data-id-product="{$id_product_tab_content}" data-is-logged="{$customer.is_logged}" data-product-link="{$link_product_tab_content}"></div>


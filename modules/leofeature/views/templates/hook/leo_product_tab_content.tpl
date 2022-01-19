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
			<span class="product-opinion-title">{l s='Yours opinion' d='Modules.Leofeature.Shop'}</span>
			<div style="display: flex;flex-direction: row;flex-wrap: wrap;width: 100%;">
				{if $reviews}
					{foreach from=$reviews item=review}
						{if $review.content}
						<div class="review" style="" itemprop="review" itemscope itemtype="https://schema.org/Review">
							<div class="review-info">

								<div class="review_details" style="margin-bottom: 20px;">
									<p itemprop="name" class="title_block">
										<strong>{$review.title}</strong>
									</p>
									<p itemprop="reviewBody">{$review.content|escape:'html':'UTF-8'|nl2br nofilter}</p>
									
								</div><!-- .review_details -->
								
								<div class="review_author">
									<div class="review_author_infos" style="display: flex;justify-content: space-between;flex-wrap: wrap;">
										<div style="display: flex;align-items: center;justify-content: flex-start;flex-wrap: wrap;">
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
							
							<div class="review_button">
								<ul style="display: flex;flex-direction: row;justify-content: space-between;align-items: baseline;">
									{if $review.total_advice > 0}
										<li>
											{l s='%1$d out of %2$d people found this review useful.' sprintf=[$review.total_useful,$review.total_advice] d='Modules.Leofeature.Shop'}
										</li>
									{/if}
									{if $customer.is_logged}
										{if !$review.customer_advice && $allow_usefull_button}
										<li>
											<span>{l s='Was this review useful to you?' d='Modules.Leofeature.Shop'}</span>
											<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="1" data-id-product-review="{$review.id_product_review}">
												<span>{l s='Yes' d='Modules.Leofeature.Shop'}</span>
											</button>
											<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="0" data-id-product-review="{$review.id_product_review}">
												<span>{l s='No' d='Modules.Leofeature.Shop'}</span>
											</button>
										</li>
										{/if}
										{if !$review.customer_report && $allow_report_button}
										<li>
											<a href="javascript:void(0)" class="btn report_btn" data-id-product-review="{$review.id_product_review}">
												{l s='Report abuse' d='Modules.Leofeature.Shop'}
											</a>
										</li>
										{/if}
									{/if}
								</ul>
							</div>
						</div> <!-- .review -->
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

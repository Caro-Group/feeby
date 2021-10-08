{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}


			<div class="row">
				<div class="new_review_form_content col-xs-12 col-sm-12">					
					{if $criterions|@count > 0}
						<ul id="criterions_list">
						{foreach from=$criterions item='criterion'}
							<li>
								{if isset($criterion.name) && $criterion.name != ''}<label>{$criterion.name|escape:'html':'UTF-8'}:</label>{/if}
								<div class="star_content">
									<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="1" />
									<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="2" />
									<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="3" />
									<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="4" checked="checked" />
									<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="5" />
								</div>
								<div class="clearfix"></div>
							</li>
						{/foreach}
						</ul>
					{/if}				
					<form class="form-new-review" action="#" method="post">
						<div class="form-group">
						  <label class="form-control-label" for="new_review_title">{l s='Title' mod='leofeature'} <sup class="required">*</sup></label>
						  <input type="text" class="form-control" id="new_review_title" required="" name="new_review_title">					  
						</div>
						<div class="form-group">
						  <label class="form-control-label" for="new_review_content">{l s='Comment' mod='leofeature'} <sup class="required">*</sup></label>
						  <textarea type="text" class="form-control" id="new_review_content" required="" name="new_review_content"></textarea>				  
						</div>
						{if $allow_guests == true && !$is_logged}
							<div class="form-group">
							  <label class="form-control-label" for="new_review_customer_name">{l s='Your name' mod='leofeature'} <sup class="required">*</sup></label>
							  <input type="text" class="form-control" id="new_review_customer_name" required="" name="new_review_customer_name">					  
							</div>
						{/if}
						<div class="form-group">
							<label class="form-control-label"><sup>*</sup> {l s='Required fields' mod='leofeature'}</label>
						<input id="id_product_review" name="id_product_review" type="hidden" value='{$product_modal_review->id}' />
						</div>
						<button class="btn btn-primary form-control-submit leo-fake-button pull-xs-right leo-modal-review-bt btn btn-primary" type="submit">
				<span class="leo-modal-review-loading cssload-speeding-wheel"></span>
				<span class="leo-modal-review-bt-text">
					{l s='Submit' mod='leofeature'}
				</span>
						</button>

					</form>
				</div>
			</div>

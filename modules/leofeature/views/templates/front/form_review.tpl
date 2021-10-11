{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}


			<div class="" style="display:flex;flex-direction:row;flex-wrap:wrap;">
				<div style="display:flex;align-items: flex-start;justify-content: center;flex: 1 1 33.333333%;display: flex;flex-direction: column;padding-left: 30px;">
					<span style="font-style: normal;font-weight: bold;font-size: 25px;line-height: 34px;display: flex;align-items: center;letter-spacing: -0.015em;color: #424242;">{l s='Do you have this product?' mod='leofeature'}</span>
					<span style="font-style: normal;font-weight: bold;font-size: 20px;line-height: 27px;display: flex;align-items: center;letter-spacing: -0.015em;color: #424242;">{l s='Tell others how you rate it!' mod='leofeature'}</span>
				</div>
				<div class="new_review_form_content col-xs-12 col-sm-12" style="flex: 1 1 66.666667%">
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
						  <label class="form-control-label" for="new_review_title">{l s='Your title' mod='leofeature'}</label>
						  <input type="text" class="form-control" id="new_review_title" required="required" name="new_review_title"  placeholder="{l s='Your title here' mod='leofeature'}">					  
						</div>
						{if $allow_guests == true && !$is_logged}
							<div class="form-group">
							  <label class="form-control-label" for="new_review_customer_name">{l s='Your pseudonim' mod='leofeature'}</label>
							  <input type="text" class="form-control" id="new_review_customer_name" required="required" name="new_review_customer_name" placeholder="{l s='Your pseudonim here' mod='leofeature'}">					  
							</div>
						{/if}
						<div class="form-group">
						  <label class="form-control-label" for="new_review_content">{l s='Your comment' mod='leofeature'}</label>
						  <textarea type="text" class="form-control" id="new_review_content" required="required" name="new_review_content" placeholder="{l s='Your comment here' mod='leofeature'}"></textarea>				  
						</div>
						<div class="form-group">
							<input id="id_product_review" name="id_product_review" type="hidden" value='{$product_modal_review->id}' />
						</div>
						<div style="display: flex;flex-direction: revert;justify-content: space-between; align-items: flex-start;padding-top: 10px;">
							<div class="form-group">
								<label class="form-control-label" for="new_review_customer_agreement" style="font-style: normal;font-weight: normal;font-size: 12px;line-height: 16px;    padding: 0;">
									<input id="new_review_customer_agreement" type="checkbox" required="required" style="margin-right:10px">{l s='Content of consent to the processing of personal data.' mod='leofeature'}
								</label>
							</div>
							<button class="btn btn-primary form-control-submit leo-fake-button pull-xs-right leo-modal-review-bt btn btn-primary" type="submit">
								<span class="leo-modal-review-loading cssload-speeding-wheel"></span>
								<span class="leo-modal-review-bt-text">
									{l s='Submit' mod='leofeature'}
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>

{literal}
	<style>
		.form-new-review .form-control-label{ 
			font-style: normal;
			font-weight: bold;
			font-size: 20px;
			line-height: 27px;
			display: flex;
			align-items: center;
			letter-spacing: -0.015em;
		}
	</style>
{/literal}

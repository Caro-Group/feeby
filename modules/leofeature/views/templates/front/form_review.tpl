{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}

<div class="bg-gray-default flex flex-col tablet-wide:flex-row flex-wrap p-12 tablet-wide:p-[80px]">
	<div class="text-main-dark">
		<span class="font-italic text-[25px] font-header">{l s='Do you have this product?' d='Modules.Leofeature.Shop'}</span>
		<span class="font-italic text-[20px] font-body">{l s='Tell others how you rate it!' d='Modules.Leofeature.Shop'}</span>
	</div>
	<div class="new_review_form_content col-xs-12 col-sm-12 p-0 flex-[1_1_50%]">
		{if $criterions|@count > 0}
			<ul id="criterions_list">
			{foreach from=$criterions item='criterion'}
				<li class="flex items-center">
					{if isset($criterion.name) && $criterion.name != ''}
						<label class="form-control-label mb-[20px] block p-0">{$criterion.name|escape:'html':'UTF-8'}:</label>
					{/if}
					<div class="star_content">
						<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="1" />
						<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="2" />
						<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="3" />
						<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="4"  />
						<input class="star not_uniform" type="radio" name="criterion[{$criterion.id_product_review_criterion|round}]" value="5" checked="checked"/>
					</div>
					<div class="clearfix"></div>
				</li>
			{/foreach}
			</ul>
		{/if}				
		<form class="form-new-review" action="#" method="post">
			<div class="form-group">
				<label class="form-control-label" for="new_review_title">{l s='Your title' d='Modules.Leofeature.Shop'}</label>
				<input type="text" class="form-control" id="new_review_title" required="required" name="new_review_title"  placeholder="{l s='Your title here' d='Modules.Leofeature.Shop'}">					  
			</div>
			{if $allow_guests == true && !$is_logged}
				<div class="form-group">
					<label class="form-control-label" for="new_review_customer_name">{l s='Your pseudonim' d='Modules.Leofeature.Shop'}</label>
					<input type="text" class="form-control" id="new_review_customer_name" required="required" name="new_review_customer_name" placeholder="{l s='Your pseudonim here' d='Modules.Leofeature.Shop'}">					  
				</div>
			{/if}
			<div class="form-group">
				<label class="form-control-label" for="new_review_content">{l s='Your comment' d='Modules.Leofeature.Shop'}</label>
				<textarea type="text" class="form-control" id="new_review_content" required="required" name="new_review_content" placeholder="{l s='Your comment here' d='Modules.Leofeature.Shop'}"></textarea>				  
			</div>
			
			<input id="id_product_review" name="id_product_review" type="hidden" value='{$product_modal_review->id}' />
			<div class="flex flex-row-revert justify-between items-start pt-[10px]">
				<button class="btn btn-primary form-control-submit leo-fake-button pull-xs-right leo-modal-review-bt btn btn-primary" type="submit">
					<span class="leo-modal-review-loading cssload-speeding-wheel"></span>
					<span class="leo-modal-review-bt-text">
						{l s='Submit' d='Modules.Leofeature.Shop'}
					</span>
				</button>
			</div>
		</form>
	</div>
</div>
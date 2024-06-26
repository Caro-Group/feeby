{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}

<div class="bg-gray-default flex flex-col tablet-wide:flex-row flex-wrap p-[20px] py-[47px] tablet:p-12 tablet-wide:p-[80px] mt-2 mb-[100px] rounded-[5px]">
	<div class="flex flex-col pr-10 text-main-dark flex-auto justify-center mb-[40px] tablet:mb-[20px]">
		<span class="font-normal text-[20px] tablet:text-[25px] font-body">{l s='Do you have this product?' d='Modules.Leofeature.Shop'}</span>
		<span class="text-base tablet:text-[20px] font-body">{l s='Tell others how you rate it!' d='Modules.Leofeature.Shop'}</span>
	</div>
	<div class="new_review_form_content p-0 flex-[1_1_50%] tablet:mb-[20px]">
		{if $criterions|@count > 0}
			<ul id="criterions_list" class="flex list-unstyled mb-5">
			{foreach from=$criterions item='criterion'}
				<li class="flex items-center flex-col tablet:flex-row">
					{if isset($criterion.name) && $criterion.name != ''}
						<label class="mb-0 mr-auto tablet:mr-[18px] px-[20px] text-base tablet:text-[20px] text-main-dark">{$criterion.name|escape:'html':'UTF-8'}:</label>
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
		<form class="form-new-review flex flex-row flex-wrap" action="#" method="post">
			<div class="flex flex-col flex-wrap w-full tablet:w-1/2 tablet:pr-[20px] mb-[15px]">
				<label class="text-main-dark text-base tablet:text-[20px] px-[20px]" for="new_review_title">{l s='Your title' d='Modules.Leofeature.Shop'}</label>
				<input type="text" class="border border-solid border-gray-2000 form-input px-[20px] rounded-[23px] text-[#6B7280] placeholder:text-gray-3000 text-[12px] tablet:text-[14px]" id="new_review_title" required="required" name="new_review_title"  placeholder="{l s='Your title here' d='Modules.Leofeature.Shop'}">					  
			</div>
			<div class="flex flex-col flex-wrap w-full tablet:w-1/2 mb-[15px]">
				<label class="text-main-dark text-base tablet:text-[20px] px-[20px]" for="new_review_customer_name">{l s='Your pseudonim' d='Modules.Leofeature.Shop'}</label>
				<input type="text" class="border border-solid border-gray-2000 form-input px-[20px] rounded-[23px] text-[#6B7280] placeholder:text-gray-3000 text-[12px] tablet:text-[14px]" id="new_review_customer_name" required="required" name="new_review_customer_name" placeholder="{l s='Your pseudonim here' d='Modules.Leofeature.Shop'}">					  
			</div>
			<div class="flex flex-col flex-wrap w-full mb-[15px]">
				<label class="text-main-dark text-base tablet:text-[20px] px-[20px]" for="new_review_content">{l s='Your comment' d='Modules.Leofeature.Shop'}</label>
				<textarea type="text" rows="5" class="form-textarea border border-solid border-gray-2000 px-[20px] rounded-[23px] text-[12px] tablet:text-[14px] text-[#6B7280] placeholder:text-gray-3000 resize-none" id="new_review_content" required="required" name="new_review_content" placeholder="{l s='Your comment here' d='Modules.Leofeature.Shop'}"></textarea>				  
			</div>

			{hook h='displayGDPRConsent' id_module='leofeature'}
			
			<input id="id_product_review" name="id_product_review" type="hidden" value='{$product_modal_review->id}' />
			<div class="flex flex-row-revert justify-between items-start pt-[10px] ml-auto w-full tablet:w-auto">
				<button class="leo-fake-button leo-modal-review-bt bg-main-dark hover:bg-main-hover font-me text-white py-2 px-4 text-[12px] tablet:text-[14px] uppercase text-center border-0 rounded-full font-medium cursor-pointer mx-auto" type="submit">
					<span class="leo-modal-review-loading cssload-speeding-wheel"></span>
					<span class="leo-modal-review-bt-text">
						{l s='Add review' d='Modules.Leofeature.Shop'}
					</span>
					<i class="ti-arrow-right ml-2"></i>
				</button>
			</div>
		</form>
	</div>
	<div data-review-messages class="flex flex-wrap"></div>
</div>
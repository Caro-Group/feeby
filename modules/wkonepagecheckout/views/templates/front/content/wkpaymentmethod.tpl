{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}<div class="wk-payment-method">
	<h4 class="w-max mx-auto font-normal mb-5 tablet:text-2xl text-main-dark text-xl">{l s='Payment Method' mod='wkonepagecheckout'}</h4>
	<div class="wkerrorcolor wkhide wk-left" id="wkpayment-error" style="margin-left:25px;"></div>
	<div class="payment-options">
		{hook h='displayPaymentTop'}
		{if $wk_is_logged == 1 && (int)$id_address > 0}
			{if isset($is_free) && $is_free}
				<input type="hidden" value="{$is_free}" id="wk_free_order" />
				<p>{l s='No payment needed for this order' mod='wkonepagecheckout'}</p>
			{/if}
			{if isset($payment_options) && $payment_options}
				<div {if $is_free}class="hidden-xs-up" {/if}>
					{foreach from=$payment_options key='key' item="module_options"}
						<div class="row wk-payment-select">
						{assign var=counter value=1}
							{foreach from=$module_options item="option"}
								<div id="{$option.id}-container" class="flex items-center">
									<div class="wk-payment payment-option wkpadding mr-7">
										{* This is the way an option should be selected when Javascript is enabled *}
										<span class="pull-xs-left">
											<input {if is_null($option.module_name)}
														{if $counter == 1}
															{if Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') == $key || $is_free}checked="checked"{/if}
														{/if} 
													{else}
														{if Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') == $option.module_name || $is_free}checked="checked"{/if}
													{/if}
														class="ps-shown-by-js {if $option.binary} binary {/if} after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent cursor-pointer focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5" 
															id="{$option.id}"
															data-module-name="{$option.module_name}" name="payment-option" type="radio" required>
														<span></span>
													</span>
													{* This is the way an option should be selected when Javascript is disabled *}
													<form method="GET" class="ps-hidden-by-js">
														<button class="ps-hidden-by-js" type="submit" name="select_payment_option"
															value="{$option.id}">
															{l s='Choose' mod='wkonepagecheckout'}
														</button>
													</form>
												</div>
												<label
													for="{$option.id}"
													class="cursor-pointer col-md-11 col-sm-9 col-xs-9 wk-selected-payment-{$option.id} {if Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') && (Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') == $option.module_name)}wkSelectedBorder{/if}">
													<div class="row">
														{if Configuration::get('WK_CHECKOUT_PAYMENT_LOGO')}
															<div class="col-md-3 col-xs-12 col-sm-3">
																{if $option.logo}
																	<img src="{$option.logo}" width="50">
																{else}
																	<img class="wk-custom-payment-icon" width="50"
																		src="{$wk_opc_modules_dir}img/wk-icon-money.png">
																{/if}
															</div>
														{/if}
														<div class="col-md-9 col-xs-12 col-sm-9">
														{if !Configuration::get('WK_CHECKOUT_PAYMENT_LOGO') && $option.call_to_action_text == ""}
															<img src="{$option.logo}" width="50">
														{else}
															<p class="font-normal">{$option.call_to_action_text}</p>
														{/if}
														</div>
													</div>
												</label>
											</div>

											{if $option.additionalInformation}
												<div id="{$option.id}-additional-information"
													class="js-additional-information definition-list col-sm-11 offset-sm-1"
													style="
													{if is_null($option.module_name)}
														{if $counter == 1}
															{if Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') == $key || $is_free}display:block{/if}
														{/if} 
													{else}
														{if Configuration::get('WK_CHECKOUT_DEFAULT_PAYMENT') == $option.module_name || $is_free}display:block{/if}
													{/if}
													">
													{$option.additionalInformation nofilter}
												</div>
											{/if}
											<div id="pay-with-{$option.id}-form" class="js-payment-option-form wk-left col-md-12">
												{if $option.form}
													{$option.form nofilter}
												{else}
													<form id="payment-form" method="POST" action="{$option.action nofilter}">
														{foreach from=$option.inputs item=input}
															<input type="{$input.type}" name="{$input.name}" value="{$input.value}">
														{/foreach}
														<button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
													</form>
												{/if}
											</div>
											{assign var=counter value=$counter+1}
										{/foreach}
									</div>
								{/foreach}
							</div>
						{else}
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="alert alert-danger">
									{l s='Unfortunately, there are no payment method available.'  mod='wkonepagecheckout'}
								</div>
							</div>
						{/if}
					{else}
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="alert alert-danger">
								{l s='First you need to fill the shipping address.' mod='wkonepagecheckout'}
							</div>
						</div>
					{/if}
				</div>
				<div id="wkpayment-method"></div>
			</div>
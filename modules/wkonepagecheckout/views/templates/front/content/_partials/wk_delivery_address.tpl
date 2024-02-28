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
*}
<div id="wk-delivery-address-form">
	{if isset($addressFormFields)}
		<div class="wk-delivery-address-form">
			<form class="wk-address-form" method="POST" action="#" id="wk-delivery-form" data-type="delivery">
				<input type="hidden" name="data-type" value="delivery" id="delivery">
				<input type="hidden" name="id-new-delivery-address"
					value="{if isset($delivery_address)}{$delivery_address->id}{/if}" id="id-new-delivery-address">

				{foreach from=$addressFormFields item=field key=fieldName}
					{if $fieldName != 'country' && $fieldName != 'state' && $field}
						<div class="form-group w-full input-{$fieldName}">
							<input maxlength="{$field.maxlength}" {if $field.required}data-required="1" 
							{else}data-required="0"
								{/if} data-validate="{$field.validate}" type="text" name="{$field.delivery_field_name}"
								id="{$field.delivery_field_name}"
								value="{if isset($delivery_address)}{$delivery_address->{$field.db_fieldname}}{/if}"
								placeholder="{$field.label}{if $field.required} *{/if}"
								class="form-control wkvalidatefield border-gray-2000 border-solid border rounded-full bg-white">
							<i class="material-icons wk-check-icon wkhide icon_{$field.delivery_field_name}">&#xE876;</i>
							<i class="material-icons wk-error-icon wkhide error_{$field.delivery_field_name}">&#xE001;</i>
							<span class="help-block wk-error {$field.delivery_field_name}"></span>
						</div>
					{elseif $fieldName == 'country'}
						<div class="form-group w-full">
							<select data-required="1" data-attr="delivery" name="wk_delivery_address_country"
								class="form-control wk_address_country label-control required bg-white border border-gray-2000 focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full">
								{if isset($countries)}
									{foreach $countries as $country}
										<option {if isset($updateCountry)} 
											{if $updateCountry == $country.id_country}selected="selected"
												{/if} 
												{else if isset($delivery_address)}
													{if $delivery_address->id_country == $country.id_country}selected="selected" {/if}
												{else if isset($cartAddress)}
													{if $cartAddress->id_country == $country.id_country}selected="selected" {/if}
												{else if $defaultCountry == $country.id_country}selected="selected" 
												{/if}
												value="{$country.id_country}">{$country.name}</option>
										{/foreach}
									{/if}
								</select>
							</div>
						{elseif $fieldName == 'state'}
							<div id="wk-delivery-country-state">
								{if isset($states) && $states}
									{block name='wk_delivery_state'}
										{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk-delivery-state.tpl"}
									{/block}
								{/if}
							</div>
						{/if}
					{/foreach}

					<div class="form-group w-full" style="text-align: right;">
						{if Module::isEnabled('wkgdpr')}
							{hook h='displayGDPRConsent' mod='wkgdpr' id_module=$id_module}
						{else}
							{hook h='displayGDPRConsent' mod='psgdpr' id_module=$id_module}
						{/if}

						<button type="submit" class="btn py-3 px-4 border-2 text-main-dark uppercase border-main-dark hover:bg-main-dark hover:text-white rounded-full border-solid  transition font-body text-xs font-normal wk-save-address">
							{l s='Save' mod='wkonepagecheckout'}
						</button>
						<div class="wkhide wk_text-light wkbotton" id="wk-msg-new-delivery"></div>
					</div>
				</form>
			</div>
		{/if}
	</div>
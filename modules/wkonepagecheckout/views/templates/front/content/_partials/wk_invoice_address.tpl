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
<div id="wk-invoice-address-form">
	{if isset($addressFormFields)}
	<div class="wk-invoice-address-form wk_div_container">
		<form class="wk-address-form" method="POST" action="#" id="wk-invoice-form" data-type="invoice">
			<input type="hidden" name="data-type" value="invoice" id="invoice">
			<input type="hidden" name="id-new-invoice-address" value="{if isset($delivery_address)}{$delivery_address->id}{/if}" id="id-new-invoice-address">

			{foreach from=$addressFormFields item=field key=fieldName}
				{if $fieldName != 'country' && $fieldName != 'state' && $field}
					<div class="form-group">
						<label class="label-control {if $field.required}required{/if}">
							{$field.label}
						</label>
						<input
							maxlength="{$field.maxlength}"
							{if $field.required}data-required="1"{else}data-required="0"{/if}
							data-validate="{$field.validate}"
							type="text"
							name="{$field.invoice_field_name}"
							id="{$field.invoice_field_name}"
							value="{if isset($delivery_address)}{$delivery_address->{$field.db_fieldname}}{/if}"
							class="form-control wkvalidatefield">
						<i class="material-icons wk-check-icon wkhide icon_{$field.invoice_field_name}">&#xE876;</i>
						<i class="material-icons wk-error-icon wkhide error_{$field.invoice_field_name}">&#xE001;</i>
						<span class="help-block wk-error {$field.invoice_field_name}"></span>
					</div>
				{elseif $fieldName == 'country'}
					<div class="form-group">
						<label class="label-control required">{l s='Country' mod='wkonepagecheckout'}</label>
						<select
							data-attr="invoice"
							name="wk_invoice_address_country"
							class="form-control wk_address_country">
							{if isset($countries)}
								{foreach $countries as $country}
									<option
										{if isset($updateCountry)}
											{if $updateCountry == $country.id_country}selected="selected"{/if}
										{else if isset($delivery_address)}
											{if $delivery_address->id_country == $country.id_country}selected="selected"{/if}
										{else if isset($cartAddress)}
											{if $cartAddress->id_country == $country.id_country}selected="selected"{/if}
										{else if $defaultCountry == $country.id_country}selected="selected"{/if}
										value="{$country.id_country}">{$country.name}</option>
								{/foreach}
							{/if}
						</select>
					</div>
				{elseif $fieldName == 'state'}
					<div id="wk-invoice-country-state">
						{if isset($states) && $states}
							{block name='wk_delivery_state'}
								{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk-invoice-state.tpl"}
							{/block}
						{/if}
					</div>
				{/if}
			{/foreach}

			<div class="form-group" style="text-align: right;">
				{if Module::isEnabled('wkgdpr')}
					{hook h='displayGDPRConsent' mod='wkgdpr' id_module=$id_module}
				{else}
					{hook h='displayGDPRConsent' mod='psgdpr' id_module=$id_module}
				{/if}
				<button type="submit" class="btn btn-primary wk-save-address">
					{l s='Save' mod='wkonepagecheckout'}
				</button>
				<div class="wkhide wk_text-light wkbotton" id="wk-msg-new-invoice"></div>
			</div>
		</form>
	</div>
	{/if}
</div>

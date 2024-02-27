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
<div class="wk-address-block">
	<ul class="nav nav-tabs" style="display: inline-flex;">
		<li class="nav-item">
			<a class="nav-link active" href="#wk-existing-delivery" data-toggle="tab">
				{l s='Delivery Address' mod='wkonepagecheckout'}
			</a>
		</li>

		<li
			class="nav-item wk-disabled-invoice {if !Configuration::get('WK_CHECKOUT_DELIVERY_AS_INVOICE')}disabled{/if}">
			<a class="nav-link" href="#wk-existing-invoice"
				{if !Configuration::get('WK_CHECKOUT_DELIVERY_AS_INVOICE')}data-toggle="tab" {/if}>
				{l s='Invoice Address' mod='wkonepagecheckout'}
			</a>
		</li>
	</ul>
	<div class="tab-content" id="tab-content">
		<div class="tab-pane fade in active" id="wk-existing-delivery">
			{block name='wk_existing_delivery_address'}
				{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_existing_delivery_address.tpl"}
			{/block}

			<!-- Add new delivery address -->
			<div class="box {if $customer.addresses|count > 0}wkhide{/if}" id="wk-new-delivery">
				{block name='wk_delivery_address'}
					{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_delivery_address.tpl"}
				{/block}
			</div>
		</div>

		<div class="tab-pane fade" id="wk-existing-invoice">
			{block name='wk_existing_invoice_address'}
				{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_existing_invoice_address.tpl"}
			{/block}

			<!-- Add new invoice address -->
			<div class="box {if $customer.addresses|count > 0}wkhide{/if}" id="wk-new-invoice">
				{block name='wk_invoice_address'}
					{include file="module:wkonepagecheckout/views/templates/front/content/_partials/wk_invoice_address.tpl"}
				{/block}
			</div>
		</div>
	</div>
</div>
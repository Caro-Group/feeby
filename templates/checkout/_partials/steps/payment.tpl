{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div class="p-5 tablet:p-0">
    <div class="flex flex-row mb-14">
      <h2 class="border-0 border-b-[3px] rounded-b-sm border-main border-solid mb-0 pb-2 tablet:pb-3 font-normal text-xl tablet:text-2xl">
        {l s='Payment method' d='Shop.Theme.Checkout'}
      </h2>
    </div>

    {hook h='displayPaymentTop'}

    {if !empty($display_transaction_updated_info)}
    <p class="cart-payment-step-refreshed-info mb-2">
      {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
    </p>
    {/if}

    {if $is_free}
      <p class=" mb-2">
        {l s='No payment needed for this order' d='Shop.Theme.Checkout'}
      </p>
    {/if}
    <div class="payment-options {if $is_free}hidden{/if} mb-14 pb-1">
      {foreach from=$payment_options item="module_options"}
        {foreach from=$module_options item="option"}
          <div>
            <div id="{$option.id}-container" class="bg-gray-1000 flex flex-row mb-5 p-5 payment-option min-h-[55px] tablet:min-h-[80px] rounded-md">
              {* This is the way an option should be selected when Javascript is enabled *}
              <span class="flex items-center tablet:ml-[10px]">
                <input
                  class="ps-shown-by-js {if $option.binary} binary {/if} cursor-pointer after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5"
                  id="{$option.id}"
                  data-module-name="{$option.module_name}"
                  name="payment-option"
                  type="radio"
                  required
                  {if $selected_payment_option == $option.id || $is_free} checked {/if}
                >
              </span>
              {* This is the way an option should be selected when Javascript is disabled *}
              <form method="GET" class="ps-hidden-by-js">
                  <button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
                    {l s='Choose' d='Shop.Theme.Actions'}
                  </button>
              </form>

              <label for="{$option.id}" class="cursor-pointer flex flex-auto flex-wrap font-body font-normal justify-between items-center mb-0 ml-[30px] tablet:text-base text-sm">
                <span class="text-sm tablet:text-base text-main-dark font-medium">{$option.call_to_action_text}</span>
                {if $option.logo}
                  <img src="{$option.logo}">
                {/if}
              </label>

            </div>
          </div>

          {if $option.additionalInformation}
            <div
              id="{$option.id}-additional-information"
              class="js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
            >
              {$option.additionalInformation nofilter}
            </div>
          {/if}

          <div
            id="pay-with-{$option.id}-form"
            class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
          >
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
        {/foreach}
      {foreachelse}
        <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
      {/foreach}
    </div>

    <div class="flex flex-wrap-reverse justify-between">
      <button data-checkout-back="#checkout-delivery-step" class="text-main-dark bg-transparent border-0 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"/></svg>
        {l s='Go back' d='Shop.Theme.Checkout'}
      </button>  
      <button data-checkout-payment disabled class="w-full text-xs tablet:text-sm tablet:w-auto ml-auto bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-3 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">
        {l s='Go to the summary' d='Shop.Theme.Checkout'}
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
      </button>
    </div>
  </div>
{/block}

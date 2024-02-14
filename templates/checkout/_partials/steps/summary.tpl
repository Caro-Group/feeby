{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}
  
  <div class="block desktop-presta:hidden">
  {block name='cart_summary'}
    {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
  {/block}
  </div>
  
  <div class="mx-[30px] tablet:mx-0">
    <div id="delivery" class="border-0 border-gray-1000 border-solid border-t mt-[68px] py-2 tablet:border-b tablet:border-t-0 tablet:mt-0 tablet:pb-5 tablet:py-0">
      <a class=" text-black w-full collapsed mb-4 text-main-dark w-full hover:text-main transition text-sm font-body " data-toggle="collapse" href="#collapseDeliveryMessage" role="button" aria-expanded="false" aria-controls="collapseDeliveryMessage">
        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="9" fill="none"><path fill="#181828" d="M0 3h7v1H0z"/><path fill="#181828" d="M4 0v7H3V0z"/></svg>
        {l s='Add information for the store' d='Shop.Theme.Checkout'}
      </a>
      <form
        class="clearfix"
        id="js-summary"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'saveMessage']}"
        method="post"
      >
        <div class="collapse" id="collapseDeliveryMessage">
          <textarea rows="2" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
        </div>
      </form>
    </div>

    <div class="mb-4 tablet:mb-10 pb-1">
      {if $conditions_to_approve|count}
        <p class="ps-hidden-by-js">
          {* At the moment, we're not showing the checkboxes when JS is disabled
            because it makes ensuring they were checked very tricky and overcomplicates
            the template. Might change later.
          *}
          {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
        </p>

        <form id="conditions-to-approve" class="tablet:pt-7" method="GET">
          <ul>
            {foreach from=$conditions_to_approve item="condition" key="condition_name"}
              <li>
                <div class="float-xs-left">
                  <span class="">
                    <input  id    = "conditions_to_approve[{$condition_name}]"
                            name  = "conditions_to_approve[{$condition_name}]"
                            required
                            type  = "checkbox"
                            value = "1"
                            class = "ps-shown-by-js form-checkbox cursor-pointer bg-white border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition"
                    >
                  </span>
                </div>
                <div class="ml-[30px]">
                  <label class="js-terms cursor-pointer font-body text-sm tablet:text-base text-gray-3000" for="conditions_to_approve[{$condition_name}]">
                    {$condition nofilter}
                  </label>
                </div>
              </li>
            {/foreach}
          </ul>
        </form>
      {/if}
    </div>

    <div class="flex flex-wrap-reverse justify-between pb-[30px] desktop-presta:mb-0 items-center border-0 border-b border-solid border-gray-1000 tablet:border-b-0">
      <button data-checkout-back="#checkout-payment-step" class="text-main-dark bg-transparent border-0 uppercase whitespace-nowrap flex items-center justify-between cursor-pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"/></svg>
        {l s='Go back' d='Shop.Theme.Checkout'}
      </button>  

      <div class="ml-auto tablet:w-auto w-full">
        <div id="payment-confirmation">
          <div class="ps-shown-by-js">
            <button type="submit" disabled="disabled" class="w-full tablet:w-auto !text-base tablet:!text-lg btn bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white tablet:p-3 px-4 tablet:px-8 uppercase whitespace-nowrap mb-8 tablet:mb-0 flex items-center justify-between cursor-pointer">
              {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0 shrink-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
            </button>
          </div>
          <div class="ps-hidden-by-js">
            {if $selected_payment_option}
              <label for="pay-with-{$selected_payment_option}" class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
            {/if}
          </div>
        </div>

        {hook h='displayPaymentByBinaries'}
      </div>
    </div>
  </div>

  <div class="reassurance block desktop-presta:hidden">
    {hook h='displayReassurance'}
  </div>

  <div class="modal fade" id="modal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true">&times;</span>
        </button>
        <div class="js-modal-content"></div>
      </div>
    </div>
  </div>
  
{/block}

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

  <div id="delivery">
    <a class="border-b text-black w-full collapsed" data-toggle="collapse" href="#collapseDeliveryMessage" role="button" aria-expanded="false" aria-controls="collapseDeliveryMessage">
      <svg xmlns="http://www.w3.org/2000/svg" width="7" height="7" fill="none"><path fill="#181828" d="M0 3h7v1H0z"/><path fill="#181828" d="M4 0v7H3V0z"/></svg>
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

  <div class="mb-14 pb-1">
    {if $conditions_to_approve|count}
      <p class="ps-hidden-by-js">
        {* At the moment, we're not showing the checkboxes when JS is disabled
          because it makes ensuring they were checked very tricky and overcomplicates
          the template. Might change later.
        *}
        {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
      </p>

      <form id="conditions-to-approve" method="GET">
        <ul>
          {foreach from=$conditions_to_approve item="condition" key="condition_name"}
            <li>
              <div class="float-xs-left">
                <span class="custom-checkbox">
                  <input  id    = "conditions_to_approve[{$condition_name}]"
                          name  = "conditions_to_approve[{$condition_name}]"
                          required
                          type  = "checkbox"
                          value = "1"
                          class = "ps-shown-by-js"
                  >
                  <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                </span>
              </div>
              <div class="condition-label">
                <label class="js-terms" for="conditions_to_approve[{$condition_name}]">
                  {$condition nofilter}
                </label>
              </div>
            </li>
          {/foreach}
        </ul>
      </form>
    {/if}
  </div>

  <div class="flex flex-wrap justify-between items-start">
    <button data-checkout-back="#checkout-payment-step" class="text-black bg-transparent border-0 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"/></svg>
      {l s='Go back' d='Shop.Theme.Checkout'}
    </button>  

    <div>
      <div id="payment-confirmation">
        <div class="ps-shown-by-js">
          <button type="submit" disabled="disabled" class="btn bg-main hover:opacity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">
            {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
          </button>
        </div>
        <div class="ps-hidden-by-js">
          {if $selected_payment_option}
            <label for="pay-with-{$selected_payment_option}" class="bg-main hover:opacity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
          {/if}
        </div>
      </div>

      {hook h='displayPaymentByBinaries'}
    </div>
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

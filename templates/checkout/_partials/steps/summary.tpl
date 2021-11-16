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

  <form
  class="clearfix"
  id="js-summary"
  data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'saveMessage']}"
  method="post"
>
    <div id="delivery">
      <label for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
      <textarea rows="2" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
    </div>
 </form>

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

  <div class="flex flex-wrap justify-between items-start">
    <button data-checkout-back="#checkout-payment-step" >{l s='Go back' d='Shop.Theme.Checkout'}</button>  

    <div>
      <div id="payment-confirmation">
        <div class="ps-shown-by-js">
          <button type="submit" disabled="disabled" class="btn btn-primary center-block">
            {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
          </button>
        </div>
        <div class="ps-hidden-by-js">
          {if $selected_payment_option}
            <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
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

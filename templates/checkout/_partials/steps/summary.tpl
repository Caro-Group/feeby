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

  <div class="w-full">
    {if $show_final_summary}
      <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
        {l
          s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
          sprintf=[
            '[1]' => '<a data-checkout-payment-reset href="#checkout-payment-step">',
            '[/1]' => '</a>',
            '[2]' => '<a href="#conditions-to-approve">',
            '[/2]' => '</a>'
          ]
          d='Shop.Theme.Checkout'
        }
      </article>
    {/if}
  </div>

  <div class="flex flex-wrap justify-between items-start">
    <button data-checkout-payment-reset>{l s='Go back' d='Shop.Theme.Checkout'}</button>  

    <div>
      <div id="payment-confirmation">
        <div class="ps-shown-by-js">
          <button type="submit" {if !$selected_payment_option} disabled {/if} class="btn btn-primary center-block">
            {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
          </button>
        </div>
        <div class="ps-hidden-by-js">
          {if $selected_payment_option and $all_conditions_approved}
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

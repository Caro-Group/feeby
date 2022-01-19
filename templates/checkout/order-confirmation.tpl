{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{extends file='page.tpl'}

{block name='page_content_container' prepend}

    <section id="content-hook_order_confirmation">
      <div class="">
            {block name='order_confirmation_header'}
              <h3 class="font-normal text-2xl tablet:text-4xl mt-14 mb-8 tablet:mb-10 text-main-dark italic">
                {l s='Your order is confirmed' d='Shop.Theme.Checkout'}
              </h3>
            {/block}

            <p class="font-light text-sm tablet:text-base pb-6 tablet:pb-10 text-main-dark font-body">
              {l s='An email has been sent to your mail address ' d='Shop.Theme.Checkout'} <span class="font-medium"> {l s='%email%.' sprintf=['%email%' => $customer.email]} </span>
              {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='You can also [1]download your invoice[/1]'
                  d='Shop.Theme.Checkout'
                  sprintf=[
                    '[1]' => "<a href='{$order.details.invoice_url}'>",
                    '[/1]' => "</a>"
                  ]
                }
              {/if}
            </p>

            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}
      </div>
    </section>
{/block}

{block name='page_content_container'}

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="definition-list">
      <div class="font-body text-main-dark">
        {$HOOK_PAYMENT_RETURN nofilter}
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="card font-body text-main-dark">
        <div class="card-block">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}
{/block}

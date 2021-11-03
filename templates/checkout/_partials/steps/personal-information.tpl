{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {hook h='displayPersonalInformationTop' customer=$customer}

  {if $customer.is_logged && !$customer.is_guest}

    <p class="identity">
      {* [1][/1] is for a HTML tag. *}
      {l s='Connected as [1]%firstname% %lastname%[/1].'
        d='Shop.Theme.Customeraccount'
        sprintf=[
          '[1]' => "<a href='{$urls.pages.identity}'>",
          '[/1]' => "</a>",
          '%firstname%' => $customer.firstname,
          '%lastname%' => $customer.lastname
        ]
      }
    </p>
    <p>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Not you? [1]Log out[/1]'
        d='Shop.Theme.Customeraccount'
        sprintf=[
        '[1]' => "<a href='{$urls.actions.logout}'>",
        '[/1]' => "</a>"
        ]
      }
    </p>
    {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
      <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
    {/if}

    <div class="clearfix">
      <form method="GET" action="{$urls.pages.order}">
        <button
          class="continue btn btn-primary float-xs-right"
          name="controller"
          type="submit"
          value="order"
        >
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>

    </div>

  {else}
    <div class="absolute inset-0 z-10 bg-gray-100 mt-24" data-login-panel>
      <div class="flex flex-wrap tablet-wide:flex-nowrap">
        <div class="border-r my-20 px-24 w-1/2">
          <h2>{l s='I do not have an account' d='Shop.Theme.Checkout'}</h2>
          <p>
            {l s='You do not have an account? You can place an order as a guest, or create an account to save your details and shipping preferences for your next purchase.' d='Shop.Theme.Checkout'}
          </p>
          <a
            class="nav-link {if !$show_login_form}active{/if}"
            data-toggle="tab"
            href="#checkout-guest-form"
            role="tab"
            aria-controls="checkout-guest-form"
            {if !$show_login_form} aria-selected="true"{/if}
            >
            {if $guest_allowed}
              {l s='Order as a guest' d='Shop.Theme.Checkout'}
            {/if}
          </a>
          <a
            class="nav-link {if !$show_login_form}active{/if}"
            data-toggle="tab"
            href="#checkout-guest-form"
            role="tab"
            aria-controls="checkout-guest-form"
            {if !$show_login_form} aria-selected="true"{/if}
            >
             {l s='Create an account' d='Shop.Theme.Customeraccount'}
          </a>
        </div>
        <div class="my-20 px-24 w-1/2">
          <h2>{l s='I have an account' d='Shop.Theme.Checkout'}</h2>
          <div class="{if $show_login_form}active{/if}" id="checkout-login-form">
            {render file='checkout/_partials/login-form.tpl' ui=$login_form}
          </div>
        </div>
      </div>
    </div>
  {/if}

  <div class="tab-pane {if !$show_login_form}active{/if}" id="checkout-guest-form" role="tabpanel" {if $show_login_form}aria-hidden="true"{/if}>
    {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
  </div>
{/block}

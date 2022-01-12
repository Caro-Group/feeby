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

    <h2 class="mb-4">
      {l s='%firstname% %lastname%'
        d='Shop.Theme.Customeraccount'
        sprintf=[
          '%firstname%' => $customer.firstname,
          '%lastname%' => $customer.lastname
        ]
      }
    </h2>
    <p class="mb-2">
      {l s='Do you give up shopping?' d='Shop.Theme.Checkout'}
      <a href="{$urls.actions.logout}">
        {l s='Log out' d='Shop.Theme.Checkout'}
      </a>
    </p>
    
    {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
      <p class="mb-2"><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
    {/if}

    
      <form method="GET" action="{$urls.pages.order}">
        <button
          class="bg-main hover:opacity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer ml-auto"
          name="controller"
          type="submit"
          value="order"
        >
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>

  {else}
    <div class="absolute inset-0 z-10 bg-gray-100 mt-[120px] tablet:mt-40" data-login-panel>
      <div class="flex flex-wrap tablet-wide:flex-nowrap">
        <div class="flex flex-col border-r my-8 tablet-wide:my-20 px-8 tablet-wide:px-24 w-full tablet-wide:w-1/2 items-start">
          <h2>{l s='I do not have an account' d='Shop.Theme.Checkout'}</h2>
          <p>
            {l s='You do not have an account? You can place an order as a guest, or create an account to save your details and shipping preferences for your next purchase.' d='Shop.Theme.Checkout'}
          </p>
          {if $guest_allowed}
            <a
              class="bg-main hover:opacity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer"
              href="#checkout-guest-form"
              aria-controls="checkout-guest-form"
              >
                {l s='Order as a guest' d='Shop.Theme.Checkout'}
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>
            </a>
          {/if}
          <a
            class="bg-black hover:opcaity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer"
            href="#checkout-register-form"
            aria-controls="checkout-guest-form"
            >
             {l s='Create an account' d='Shop.Theme.Customeraccount'}
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>
          </a>
        </div>
        <div class="my-8 tablet-wide:my-20 px-8 tablet-wide:px-24 w-full tablet-wide:w-1/2">
          <h2>{l s='I have an account' d='Shop.Theme.Checkout'}</h2>
          <div class="{if $show_login_form}active{/if}" id="checkout-login-form">
            {render file='checkout/_partials/login-form.tpl' ui=$login_form}
          </div>
        </div>
      </div>
    </div>
  {/if}

  <div id="checkout-guest-form">
    {if !$customer.is_logged || $customer.is_guest}
      <div class="flex flex-row mb-14">
        <h2 class="border-0 border-b border-main border-solid mb-0 pb-3">
          {l s='Personal information' d='Shop.Theme.Checkout'}
        </h2>
      </div>
      
      {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
    {/if}
  </div>
{/block}

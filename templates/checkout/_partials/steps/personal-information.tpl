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
    <div class="p-5 tablet:p-0">
      <h2 class="mb-4 font-normal mb-2 tablet:mb-[10px] text-2xl text-main-dark">
        {l s='%firstname% %lastname%'
          d='Shop.Theme.Customeraccount'
          sprintf=[
            '%firstname%' => $customer.firstname,
            '%lastname%' => $customer.lastname
          ]
        }
      </h2>
      <p class="mb-2 text-sm tablet:text-base font-body text-main-dark">
        {l s='Do you give up shopping?' d='Shop.Theme.Checkout'}
        <a href="{$urls.actions.logout}" class="text-main hover:text-main-hover transition">
          {l s='Log out' d='Shop.Theme.Checkout'}
        </a>
      </p>
      
      {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
        <p class="mb-2 text-xs tablet:text-sm font-body text-gray-3000 ">
        {l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</p>
      {/if}
      
      <form method="GET" action="{$urls.pages.order}">
        <button
          class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer ml-auto"
          name="controller"
          type="submit"
          value="order"
        >
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>
    </div>

    

  {else}
    <div class=" bg-gray-1000 inset-0 tablet:rounded-md z-10 tablet:pb-12" data-login-panel>
      <div class="flex flex-wrap tablet-wide:flex-nowrap">
        <div class="border-0 border-b border-gray-3000 border-solid flex flex-col items-start mb-0 my-10 pb-10 px-0 mx-5 tablet:px-5 tablet:mx-0 tablet-wide:px-24 tablet:border-b-0 tablet:border-r tablet:mb-8 tablet:my-20 tablet:w-1/2 w-full">
          <h2 class="text-2xl tablet:text-3xl font-normal mb-5">{l s='I do not have an account' d='Shop.Theme.Checkout'}</h2>
          <p class="hidden tablet:block font-body font-light text-base text-main-dark mb-8">
            {l s='You do not have an account? You can place an order as a guest, or create an account to save your details and shipping preferences for your next purchase.' d='Shop.Theme.Checkout'}
          </p>
          {if $guest_allowed}
            <a
              class="bg-main border-0 cursor-pointer duration-150 flex font-body hover:text-white hover:bg-main-hover items-center justify-between max-w-[320px] mb-3 px-5 py-3 rounded-full tablet:max-w-[300px] text-white text-xs  tablet:text-sm uppercase w-full whitespace-nowrap"
              href="#checkout-guest-form"
              aria-controls="checkout-guest-form"
              >
                {l s='Order as a guest' d='Shop.Theme.Checkout'}
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>
            </a>
          {/if}
          <a
            class="bg-main-dark border-0 cursor-pointer duration-150 flex font-body hover:text-white hover:bg-black items-center justify-between max-w-[320px] mb-3 px-5 py-3 rounded-full tablet:max-w-[300px] text-white text-xs  tablet:text-sm uppercase w-full whitespace-nowrap"
            href="#checkout-register-form"
            aria-controls="checkout-guest-form"
            >
             {l s='Create an account' d='Shop.Theme.Customeraccount'}
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>
          </a>
        </div>
        <div class="flex flex-col items-start my-10 mb-5 px-5 tablet-wide:px-24 tablet:my-20 tablet:w-1/2 w-full">
          <h2 class="text-2xl tablet:text-3xl font-normal">{l s='I have an account' d='Shop.Theme.Checkout'}</h2>
          <div class="{if $show_login_form}active{/if} w-full" id="checkout-login-form">
            {render file='checkout/_partials/login-form.tpl' ui=$login_form}
          </div>
        </div>
      </div>
    </div>
  {/if}

  <div id="checkout-guest-form" class="p-5 tablet:p-0">
    {if !$customer.is_logged || $customer.is_guest}
      <div class="flex flex-row mb-3 tablet:mb-14 ">
        <h2 class="border-0 border-b-[3px] rounded-b-sm border-main border-solid mb-0 pb-2 tablet:pb-3 font-normal text-xl tablet:text-2xl">
          {l s='Personal information' d='Shop.Theme.Checkout'}
        </h2>
      </div>
      
      {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
    {/if}
  </div>
{/block}

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

  <div>
    <div class="flex flex-col items-start my-10 mb-5 px-5 tablet-wide:px-24 tablet:my-20 tablet:w-1/2 w-full">
      <h2 class="text-2xl tablet:text-3xl font-normal">{l s='Already have an account?' d='Shop.Theme.Checkout'}</h2>
        <div class="{if $show_login_form}active{/if} w-full" id="checkout-login-form">
          {render file='checkout/_partials/login-form.tpl' ui=$login_form}
        </div>
      </div>
  </div>
{/block}

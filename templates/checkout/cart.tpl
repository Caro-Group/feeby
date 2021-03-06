{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file=$layout}

{block name='breadcrumb'}{/block}

{block name='content'}
  <section id="main">
    <div class="flex flex-wrap mt-5 tablet:mt-12 tablet:mb-12">
      <div class="flex flex-col items-start flex-auto w-full ">
        <a class="block tablet-wide:hidden mb-2" href="{$urls.pages.index}" title="{l s='Continue shopping' d='Shop.Theme.Actions'}">
          <i class="hover:text-main text-base text-main-dark ti-arrow-left transition"></i>
        </a>
        <h1 class="text-2xl tablet:text-[45px] mb-8 tablet:mb-12">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
        <span class="bg-gray-1000 font-medium m-0 px-5 py-2 rounded-md tablet:text-base text-main-dark text-sm">{l s='Do not hesitate and order the product - adding it to the cart does not mean a reservation.' d='Shop.Theme.Checkout'}</span>
      </div>
    </div>

    <div class="flex flex-row flex-wrap desktop-presta:flex-nowrap">
      <!-- Left Block: cart product informations & shpping -->
      <div class="flex flex-col items-start flex-auto tablet:pr-8">

        <!-- cart products detailed -->
        {block name='cart_overview'}
          {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}

        {block name='cart_voucher'}
          {include file='checkout/_partials/cart-voucher.tpl'}
        {/block}
        
        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}

        {block name='continue_shopping'}
          <a class="hidden desktop-presta:flex items-center label mt-auto text-[12px] tablet:text-sm text-main-dark uppercase group hover:text-main transition font-normal " href="{$urls.pages.index}">
            <i class="ti-arrow-left text-main-dark mr-2 group-hover:text-main transition font-normal "></i>
            {l s='Continue shopping' d='Shop.Theme.Actions'}
          </a>
        {/block}
      </div>
      
      <!-- Right Block: cart subtotal & cart total -->
      {if $cart.products}
      <div class="w-full  flex-initial desktop-presta:w-side">

        {block name='cart_summary'}
          
          <div class="bg-gray-1000 -mx-[20px] tablet:rounded-md px-[30px] pb-4 mb-6">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}

            {block name='cart_totals'}
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            {/block}

            {block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            {/block}

            <div class=" font-medium mt-7 tablet:text-base text-center text-main-dark text-sm">
              {l s='Your order will be available in 2 work day' d='Shop.Theme.Checkout'}
            </div>

          </div>
        {/block}

        <div>
          {block name='hook_reassurance'}
            {hook h='displayReassurance'}
          {/block}
        </div>

        {block name='continue_shopping'}
          <div class="flex desktop-presta:hidden mt-10">
            <a class="items-center label mt-auto text-[12px] tablet:text-sm text-main-dark uppercase group hover:text-main transition font-normal " href="{$urls.pages.index}">
              <i class="ti-arrow-left text-main-dark mr-2 group-hover:text-main transition font-normal "></i>
              {l s='Continue shopping' d='Shop.Theme.Actions'}
            </a>
          <div>
        {/block}

      </div>
      {/if}

    </div>
  </section>
{/block}

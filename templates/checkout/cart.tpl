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
    <div class="flex flex-wrap mt-12 mb-12">
      <div class="flex flex-col items-start flex-auto w-full ">
        <a class="block tablet-wide:hidden mb-4" href="{$urls.pages.index}" title="{l s='Continue shopping' d='Shop.Theme.Actions'}">
          <i class="material-icons text-3xl leading-none -ml-2">chevron_left</i>
        </a>
        <h1 class="text-xl tablet:text-[45px] mb-12">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
        <span class="bg-gray-1000 font-medium m-0 px-5 py-2 rounded-md tablet:text-base text-main-dark text-sm">{l s='Do not hesitate and order the product - adding it to the cart does not mean a reservation.' d='Shop.Theme.Checkout'}</span>
      </div>
    </div>

    <div class="flex flex-row flex-wrap tablet:flex-nowrap">
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
          <a class="hidden tablet-wide:flex items-center label font-bold" href="{$urls.pages.index}">
            <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="9" height="14" fill="none"><path d="M8 13 2 7l6-6" stroke="#000" stroke-opacity=".7" stroke-width="2"/></svg>
            {l s='Continue shopping' d='Shop.Theme.Actions'}
          </a>
        {/block}
      </div>
      
      <!-- Right Block: cart subtotal & cart total -->
      <div class="w-full tablet:w-auto flex-initial tablet-wide:w-side">

        {block name='cart_summary'}
          <div class="block bg-gray-200 rounded mb-6">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}

            {block name='cart_totals'}
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            {/block}

            {block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            {/block}

            <p class="card-block text-center">
              {l s='Your order will be available in 2 work day' d='Shop.Theme.Checkout'}
            </p>

          </div>
        {/block}

        <div>
          {block name='hook_reassurance'}
            {hook h='displayReassurance'}
          {/block}
        </div>

      </div>

    </div>
  </section>
{/block}

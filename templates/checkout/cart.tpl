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
    <div class="flex flex-wrap mt-12 mb-6">
      <div class="flex flex-col items-start flex-auto w-full ">
        <a class="block tablet-wide:hidden mb-4" href="{$urls.pages.index}" title="{l s='Continue shopping' d='Shop.Theme.Actions'}">
          <i class="material-icons text-3xl leading-none -ml-2">chevron_left</i>
        </a>
        <h1 class="h1 mb-2">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
        <p class="m-0 bg-gray-200 text-black p-1.5 font-bold rounded">{l s='Do not hesitate and order the product - adding it to the cart does not mean a reservation.' d='Shop.Theme.Checkout'}</p>
      </div>
    </div>

    <div class="flex flex-wrap tablet-wide:flex-nowrap">
      <!-- Left Block: cart product informations & shpping -->
      <div class="flex flex-col items-start justify-between flex-auto tablet-wide:pr-16">

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
      </div>

      {block name='continue_shopping'}
        <a class="label" href="{$urls.pages.index}">
          <i class="material-icons">chevron_left</i>{l s='Continue shopping' d='Shop.Theme.Actions'}
        </a>
      {/block}
      
      <!-- Right Block: cart subtotal & cart total -->
      <div class="flex-initial w-side">

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

          </div>
        {/block}

        {block name='hook_reassurance'}
          {hook h='displayReassurance'}
        {/block}

      </div>

    </div>
  </section>
{/block}

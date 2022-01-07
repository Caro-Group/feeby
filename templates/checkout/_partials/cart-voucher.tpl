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
{if $cart.vouchers.allowed}
  {block name='cart_voucher'}
      <div class="cart-voucher desktop:ml-[122px] tablet:max-w-[370px] w-full my-6 tablet-wide:ml-[122px]">
        <span class="font-header font-light italic tablet:text-2xl text-main-dark text-xl ml-5">
          {l s='Add coupon' d='Shop.Theme.Checkout'}
        </span>
        {if $cart.vouchers.added}
          {block name='cart_voucher_list'}
            <ul class="promo-name py-6">
              {foreach from=$cart.vouchers.added item=voucher}
                <li class="cart-summary-line bg-gray-1000 rounded-md px-5 flex justify-between items-center ">
                  <span class="text-main-dark text-sm">{$voucher.name}</span>
                  <div class="flex-shrink-0">
                    <span class="font-medium tablet:text-2xl text-base text-main" >{$voucher.reduction_formatted}</span>
                      {if isset($voucher.code) && $voucher.code !== ''}
                        <a href="{$voucher.delete_url}" data-link-action="remove-voucher"><i class="material-icons relative bottom-2.5 text-lg">close</i></a>
                      {/if}
                  </div>
                </li>
              {/foreach}
            </ul>
          {/block}
        {/if}

        <div class=" mt-4 {if $cart.discounts|count > 0} with-discounts{/if}">
          <div class="promo-code">
            {block name='cart_voucher_form'}
              <form class="border-gray-2000 border-solid border flex rounded-full pl-4 bg-white" action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="addDiscount" value="1">
                <input class="promo-input w-full bg-transparent border-0 py-3 outline-none font-body italic focus:ring-0 text-[12px] tablet:text-sm" type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
                <button type="submit" class="bg-main hover:bg-main-hover overflow-hidden transition border-0 rounded-full text-white px-8 uppercase whitespace-nowrap font-body"><span class="font-light leading-[38px] tablet:leading-[43px] flex justify-center text-5xl" >+</span></button>
              </form>
            {/block}

            {block name='cart_voucher_notifications'}
              <div class="alert bg-opacity-10 bg-red-600 border-red-600 max-w-lg mx-auto text-red-600 js-error hidden " role="alert">
                <span class="ml-1 js-error-text before:content-['\f00d'] before:font-['FontAwesome']"></span>
              </div>
            {/block}
          </div>
        </div>

        {if $cart.discounts|count > 0}
          <p class="block-promo promo-highlighted">
            {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
          </p>
          <ul class="js-discount card-block promo-discounts">
            {foreach from=$cart.discounts item=discount}
              <li class="cart-summary-line">
                <span class="label">
                  <span class="code">{$discount.code}</span> - {$discount.name}
                </span>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
  {/block}
{/if}

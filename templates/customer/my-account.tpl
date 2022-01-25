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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="row">
    <div class="links">

      {include file='customer/_partials/my-account-block.tpl' type='identity-link' link={$urls.pages.identity} title={l s='Information' d='Shop.Theme.Customeraccount'} icon="&#xE853;"}

      {if $customer.addresses|count}
        {include file='customer/_partials/my-account-block.tpl' type='identity-link' link={$urls.pages.addresses} title={l s='Addresses' d='Shop.Theme.Customeraccount'} icon="&#xE567;"}
      {else}
        {include file='customer/_partials/my-account-block.tpl' type='address-link' link={$urls.pages.address} title={l s='Add first address' d='Shop.Theme.Customeraccount'} icon="&#xE567;"}
      {/if}

      {if !$configuration.is_catalog}
        {include file='customer/_partials/my-account-block.tpl' type='history-link' link={$urls.pages.history} title={l s='Order history and details' d='Shop.Theme.Customeraccount'} icon="&#xE916;"}
      {/if}

      {if !$configuration.is_catalog}
        {include file='customer/_partials/my-account-block.tpl' type='order-slips-link' link={$urls.pages.order_slip} title={l s='Credit slips' d='Shop.Theme.Customeraccount'} icon="&#xE8B0;"}
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        {include file='customer/_partials/my-account-block.tpl' type='discounts-link' link={$urls.pages.discount} title={l s='Vouchers' d='Shop.Theme.Customeraccount'} icon="&#xE54E;"}
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        {include file='customer/_partials/my-account-block.tpl' type='returns-link' link={$urls.pages.order_follow} title={l s='Merchandise returns' d='Shop.Theme.Customeraccount'} icon="&#xE860;"}
      {/if}

      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}

    </div>
  </div>
{/block}


{block name='page_footer'}
  {block name='my_account_links'}
    <div class="text-sm-center">
      <a href="{$logout_url}" >
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block}

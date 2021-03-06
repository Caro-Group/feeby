{**
 * 2007-2020 PrestaShop and Contributors
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{if $status == 'ok'}
    <p class="font-light text-sm tablet:text-base mb-4 tablet:mb-6 text-main-dark font-body" >
      {l s='Your order on %s is complete.' sprintf=[$shop_name] d='Modules.Wirepayment.Shop'}<br/>
      {l s='Please send us a bank wire with:' d='Modules.Wirepayment.Shop'}
    </p>
    
    <div class="flex flex-col tablet:rounded-md w-full tablet:max-w-[672px] overflow-hidden">
      <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
          <div class="w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Amount' d='Modules.Wirepayment.Shop'}</div>
          <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$total}</div>
      </div>
      <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
          <div class="w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Name of account owner' d='Modules.Wirepayment.Shop'}</div>
          <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$bankwireOwner}</div>
      </div>
      <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
          <div class="w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Please include these details' d='Modules.Wirepayment.Shop'}</div>
          <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$bankwireDetails nofilter}</div>
      </div>
      <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
          <div class="w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Bank name' d='Modules.Wirepayment.Shop'}</div>
          <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$total}</div>
      </div>
      <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
          <div class="w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Bankwire description' d='Modules.Wirepayment.Shop'}</div>
          <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{l s='%s' sprintf=[$reference]}</div>
      </div>
    </div>

    <p class="font-light text-sm tablet:text-base mt-4 tablet:mt-6 mb-6 tablet:mb-10 text-main-dark font-body">
      {l s='We\'ve also sent you this information by e-mail.' d='Modules.Wirepayment.Shop'}
    </p>
    <strong class="font-medium text-sm tablet:text-base text-main-dark font-body" >{l s='Your order will be sent as soon as we receive payment.' d='Modules.Wirepayment.Shop'}</strong>
    <p class="font-light text-sm tablet:text-base mb-6 tablet:mb-10 text-main-dark font-body">
      {l s='If you have questions, comments or concerns, please contact our [1]expert customer support team[/1].' d='Modules.Wirepayment.Shop' sprintf=['[1]' => "<a href='{$contact_url}'>", '[/1]' => '</a>']}
    </p>

    <div class="cart_navigation">
    <a href="{$urls.pages.register}" class="account-link">
        <i class="material-icons">&#xE5CB;</i>
        <span>{l s='Create account' d='Modules.Wirepayment.Shop'}</span>
    </a>
    <a href="{$urls.pages.index}" class="account-link">
        <i class="material-icons">&#xE5CB;</i>
        <span>{l s='Back to homepage' d='Modules.Wirepayment.Shop'}</span>
    </a>
    </div>
{else}
    <p class="warning font-body">
      {l s='We noticed a problem with your order. If you think this is an error, feel free to contact our [1]expert customer support team[/1].' d='Modules.Wirepayment.Shop' sprintf=['[1]' => "<a href='{$contact_url}'>", '[/1]' => '</a>']}
    </p>
{/if}

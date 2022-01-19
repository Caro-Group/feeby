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


{* <dl>
    <dt>{l s='Amount' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$total}</dd>
    <dt>{l s='Name of account owner' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireOwner}</dd>
    <dt>{l s='Please include these details' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireDetails nofilter}</dd>
    <dt>{l s='Bank name' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireAddress nofilter}</dd>
</dl> *}

<div class="flex flex-col tablet:rounded-md w-full tablet:max-w-[672px] overflow-hidden">
    <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
        <div class="w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Amount' d='Modules.Wirepayment.Shop'}</div>
        <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$total}</div>
    </div>
    <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
        <div class="w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Name of account owner' d='Modules.Wirepayment.Shop'}</div>
        <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$bankwireOwner}</div>
    </div>
    <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
        <div class="w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Please include these details' d='Modules.Wirepayment.Shop'}</div>
        <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$bankwireDetails nofilter}</div>
    </div>
    <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
        <div class="w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Bank name' d='Modules.Wirepayment.Shop'}</div>
        <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{$total}</div>
    </div>
    <div class="flex flex-col tablet:flex-row mb-[2px] p-5 bg-gray-1000">
        <div class="w-[250px] text-main-dark font-medium text-sm tablet:text-base">{l s='Bankwire description' d='Modules.Wirepayment.Shop'}</div>
        <div class="w-full flex-1 text-main-dark font-light text-sm tablet:text-base">{l s='%s' sprintf=[$reference]}</div>
    </div>
</div>

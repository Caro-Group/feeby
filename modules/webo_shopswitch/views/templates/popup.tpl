{**
 * 2007-2020 PrestaShop SA and Contributors
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="shopswitch-popup"
    class="popup-hidden fixed z-50 inset-0 max-h-screen flex justify-center items-center p-5 bg-[#282828]/50 transition duration-300">
    <div class="flex flex-col items-center w-full max-w-[468px] bg-white rounded-[5px] p-7">
        <h3 class="text-2xl font-header italic font-light mt-5 mb-8 text-main-dark">
            {l s='Language' d='Shop.Theme.Global'}
        </h3>
        <div class="language-selector mb-8 w-full">
            <ul class="flex flex-wrap justify-center">
                {foreach from=$languages item=language}
                    <li class="basis-1/3">
                        <input class="hidden" type="radio" id="{$language.id_lang}" name="language"
                            value="{$link->getLanguageLink($language.id_lang)}"
                            {if $language.id_lang == $current_language.id_lang} checked {/if}>
                        <label for="{$language.id_lang}" class="flex flex-col items-center cursor-pointer w-min mx-auto">
                            <img class="flex-grow-0 flex-shrink-0 mb-2 rounded-full border border-solid border-gray-2000 transition duration-200"
                                src="/modules/webo_shopswitch/views/img/PL.png" height="50" width="50">
                            <span class="text-base font-normal text-main-dark">{$language.name_simple}</span>
                        </label>
                    </li>
                {/foreach}
            </ul>
        </div>

        <hr class="w-full">

        <h3 class="text-2xl font-header italic font-light my-8 text-main-dark">
            {l s='Currency' d='Shop.Theme.Global'}
        </h3>


        <div class="currency-selector mb-8 w-full">
            <ul class="flex flex-wrap justify-center">
                {foreach from=$currencies item=currency}
                    <li class="basis-1/3">
                        <input class="hidden" type="radio" id="{$currency.id}" name="currency" value="{$currency.id}"
                            {if $currency.current} checked {/if}>
                        <label for="{$currency.id}" class="flex flex-col items-center cursor-pointer w-min mx-auto">
                            <span
                                class="currency-sign h-[50px] w-[50px] flex justify-center items-center flex-grow-0 flex-shrink-0 mb-2 rounded-full border border-solid border-gray-2000 text-2xl font-header text-main-dark transition duration-200"
                                src="/modules/webo_shopswitch/views/img/PL.png">{$currency.sign}</span>
                            <span class="text-base font-normal text-main-dark">{$currency.iso_code}</span>
                        </label>
                    </li>
                {/foreach}
            </ul>
        </div>
        <button
            class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white px-4 py-3 text-sm uppercase whitespace-nowrap font-body cursor-pointer"
            name="submitNewsletter" type="submit" value="Subskrybuj">
            Subskrybuj
            <i class="ti-arrow-right text-white ml-2"></i>
        </button>
    </div>
</div>
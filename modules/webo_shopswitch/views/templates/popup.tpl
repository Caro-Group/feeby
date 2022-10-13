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
    <div class="modal relative w-full max-w-[468px] bg-white rounded-[5px] p-7 transition duration-300">
        <div class="absolute top-5 right-5 cursor-pointer group">
            <svg id="shopswitch-popup-close"
                class="text-main-dark group-hover:text-main fill-current transition duration-200" width="28" height="28"
                viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M0.703126 27.2031C0.314801 26.8148 0.314801 26.1852 0.703126 25.7969L25.7969 0.703135C26.1852 0.314809 26.8148 0.314809 27.2031 0.703134C27.5914 1.09146 27.5914 1.72106 27.2031 2.10938L2.10937 27.2031C1.72105 27.5914 1.09145 27.5914 0.703126 27.2031Z" />
                <path
                    d="M27.2031 27.2031C27.5914 26.8148 27.5914 26.1852 27.2031 25.7969L2.10939 0.703135C1.72106 0.314809 1.09146 0.314809 0.703135 0.703134C0.314811 1.09146 0.314811 1.72106 0.703136 2.10938L25.7969 27.2031C26.1852 27.5914 26.8148 27.5914 27.2031 27.2031Z" />
            </svg>
        </div>
        <form name="lang-curr-form" class="w-full flex flex-col items-center ">
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
                            <label for="{$language.id_lang}"
                                class="flex flex-col items-center cursor-pointer w-min mx-auto">
                                <img class="flex-grow-0 flex-shrink-0 mb-2 rounded-full border border-solid border-gray-2000 transition duration-200 overflow-hidden"
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
                            <input class="hidden" type="radio" id="{$currency.iso_code}" name="currency"
                                value="{$currency.id}" {if $currency.current} checked {/if}>
                            <label for="{$currency.iso_code}"
                                class="flex flex-col items-center cursor-pointer w-min mx-auto">
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
        </form>
    </div>
</div>
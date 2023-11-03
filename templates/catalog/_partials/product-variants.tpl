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
 {assign var="ids_with_info" value=[2,5]} 
 
 <div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}

      <div class="{if $group.group_name|strstr:"Rodzaj fototapety"}hidden{/if} clearfix product-variants-item flex flex-col items-start mb-5">
        <div class="block text-[14px] text-gray-main text-base leading-normal mb-[10px] font-light">
          {if $id_attribute_group neq 21}
            <span class="text-inherit">
              {$group.name}
            </span>
          {/if}
          {if in_array($id_attribute_group, $ids_with_info)}
            <span class="text-inherit ml-2 hover:underline hover:text-main cursor-pointer transition duration-200" data-attr-popup-open>
              {l s='Look' d='Shop.Theme.Global'}
            </span>
            <div class="fixed z-[9999] inset-0 max-h-screen flex justify-center items-center p-5 bg-[#282828]/50 transition duration-300 pointer-events-none opacity-0" data-attr-popup>
                <div class="relative w-full max-w-[468px] bg-white rounded-[5px] py-7 transition duration-300 max-h-full flex flex-col">
                  <div class="ml-auto w-min cursor-pointer group">
                      <svg class="text-main-dark group-hover:text-main fill-current transition duration-200" width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg" data-attr-popup-close>
                          <path d="M0.703126 27.2031C0.314801 26.8148 0.314801 26.1852 0.703126 25.7969L25.7969 0.703135C26.1852 0.314809 26.8148 0.314809 27.2031 0.703134C27.5914 1.09146 27.5914 1.72106 27.2031 2.10938L2.10937 27.2031C1.72105 27.5914 1.09145 27.5914 0.703126 27.2031Z"></path>
                          <path d="M27.2031 27.2031C27.5914 26.8148 27.5914 26.1852 27.2031 25.7969L2.10939 0.703135C1.72106 0.314809 1.09146 0.314809 0.703135 0.703134C0.314811 1.09146 0.314811 1.72106 0.703136 2.10938L25.7969 27.2031C26.1852 27.5914 26.8148 27.5914 27.2031 27.2031Z"></path>
                      </svg>
                  </div>
                  <div class="w-full px-7 overflow-y-auto bg-gray-default">
                    {* attr info image *}
                  </div>
                </div>
            </div>
          {/if}
        </div>
        
        {if $group.group_type == 'select'}

          <select
            class="form-select taxt-base tablet:text-xl py-[18px] tablet:py-4 pl-[30px] bg-[center_right_30px] bg-gray-default rounded border-none w-full mb-[10px] focus:ring-main transition"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>

        {elseif $group.group_type == 'color'}

          <ul id="group_{$id_attribute_group}" class="flex w-full flex-wrap justify-center tablet:justify-start">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container w-full mr-5 phone:max-w-[40%] tablet:max-w-[121px] tablet:aspect-ratio-[4/3] tablet:mr-5 desktop:max-w-[29%] ">
                <label aria-label="{$group_attribute.name}" class="flex flex-col">
                  <input class="input-color peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                    {if $group_attribute.texture}
                      class="color texture w-full h-20 tablet:h-[120px] mx-auto tablet:mx-0 bg-no-repeat bg-cover rounded-[5px] border-2 border-solid border-white hover:border-white peer-checked:border-main opacity-50 peer-checked:opacity-100 transition shadow-none aspect-[4/3] overflow-hidden"
                    {elseif $group_attribute.html_color_code}
                      class="color w-10 h-10 rounded-[5px]" style="background-color: {$group_attribute.html_color_code}" 
                    {/if}
                  >
                  {if $group_attribute.texture}
                    <picture>
                      <source srcset="{$group_attribute.texture|replace:".png":".webp"|replace:".jpg":".webp"|escape:'html':'UTF-8'}" type="image/webp">
						          <source srcset="{$group_attribute.texture|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg"> 
                      <img class="block h-full object-cover" src="{$group_attribute.texture|replace:" ":"%20"}" />
                    </picture>
                  {/if}
                  </span>
                  <span class="text-main-dark text-base tablet-medium:text-2xl p-0 pt-[10px] text-center">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {elseif $group.group_type == 'radio'}

          <ul id="group_{$id_attribute_group}" class="{if $group.name == "Rozmiar fototapety" || $id_attribute_group == '21'} hidden {/if} flex flex-row flex-wrap">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="flex-1 mb-2">
                <label class="mb-0 mr-2 h-full">
                  <input class="form-radio sr-only peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span class="bg-gray-default flex items-center text-center h-full border-2 border-solid cursor-pointer p-3 peer-checked:border-main peer-checked:text-gray-main rounded text-[#BABABA] transition {if $breadcrumb.links[1].title == 'Parawany'} text-sm tablet:text-base {else} text-base tablet:text-xl {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
          
        {/if}

        <span class="block leading-normal text-[14px] tablet:text-base text-[#ADAFBA]">
          {if $group.group_name == "Rozmiar"}

            {l s='See' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]" href="/tabela-rozmiarow" target="_blank">{l s='table size' d='Shop.Theme.Actions'}</a>

          {elseif $group.group_name == "Typ"}

            {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Parawany"}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]" href="/nasze-parawany" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {else}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]" href="/technologia-wykonania" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {/if}
            
          {/if}
        </span>

      </div>
    {/if}
  {/foreach}
</div>


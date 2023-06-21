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
<div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}

      <div class="{if $group.group_name|strstr:"Rodzaj fototapety"}hidden{/if} clearfix product-variants-item flex flex-col items-start mb-5 {if $id_attribute_group eq 23 } py-5 px-2.5 tablet:p-[30px] border-2 border-gray-2000 border-solid rounded-[5px] {/if}">
        <span class="block text-base text-gray-main text-lg leading-normal mb-[10px] font-medium">
          {if $id_attribute_group neq 21 }
            {$group.name}
          {/if}
        </span>

        {if $group.group_type == 'select'}

          <select
            class="form-select taxt-base tablet:text-xl py-[18px] tablet:py-4 pl-[30px] bg-[center_right_30px] bg-gray-default rounded border-none w-full mb-[10px] focus:ring-main transition"
            id="group_{$id_attribute_group}" data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}" {if $group_attribute.selected} selected="selected"
                {/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>

        {elseif $group.group_type == 'color'}

          <ul id="group_{$id_attribute_group}" class="flex w-full flex-wrap justify-center tablet:justify-start">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container w-full {if $id_attribute_group eq 23 } mx-2.5 tablet:ml-0 tablet:mr-[35px] phone:max-w-[80px] {/else} mr-5 phone:max-w-[40%] tablet:max-w-[121px] tablet:aspect-ratio-[4/3] tablet:mr-5 desktop:max-w-[29%] {/if} ">
                <label aria-label="{$group_attribute.name}" class="flex flex-col">
                  <input class="input-color peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                   class="{if $group_attribute.texture} color texture w-full  {if $id_attribute_group eq 23 } tablet:h-[54px] {/else} h-20 tablet:h-[120px] {/if}  mx-auto tablet:mx-0 bg-no-repeat bg-cover rounded-[5px] border-2 border-solid border-gray-2000 hover:border-gray-3000 peer-checked:border-main opacity-50 peer-checked:opacity-100 transition shadow-none aspect-[4/3] overflow-hidden {elseif $group_attribute.html_color_code} color w-10 h-10 rounded-[5px] {/if}" {if $group_attribute.html_color_code} style="background-color: {$group_attribute.html_color_code}" {/if}>
                  {if $group_attribute.texture}
                    <picture>
                      <source srcset="{$group_attribute.texture|replace:".png":".webp"|replace:".jpg":".webp"|escape:'html':'UTF-8'}" type="image/webp">
						          <source srcset="{$group_attribute.texture|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg"> 
                      <img class="block h-full object-cover" src="{$group_attribute.texture|replace:" ":"%20"}" />
                    </picture>
                  {/if}
                  </span>
                <span class="text-main-dark p-0 pt-[10px] text-center text-base {if $id_attribute_group eq 23 } tablet-medium:text-lg {/else} tablet-medium:text-2xl {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {elseif $group.group_type == 'radio'}

          <ul id="group_{$id_attribute_group}"
            class="{if $group.name == "Rozmiar fototapety" || $id_attribute_group == '21'} hidden {/if} flex flex-row flex-wrap">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="flex-1 mb-2">
                <label class="mb-0 mr-2 h-full">
                  <input class="form-radio sr-only peer" type="radio" data-product-attribute="{$id_attribute_group}"
                    name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"
                    {if $group_attribute.selected} checked="checked" {/if}>
                  <span
                    class="bg-gray-default flex items-center text-center h-full border-2 border-solid cursor-pointer p-3 peer-checked:border-main peer-checked:text-gray-main rounded text-[#BABABA] transition {if $breadcrumb.links[1].title == 'Parawany'} text-sm tablet:text-base {else} text-base tablet:text-xl {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {/if}

        <div class="flex leading-normal text-[14px] tablet:text-base text-[#ADAFBA] gap-2.5 tablet:gap-5">
          {if $group.group_name == "Rozmiar" or $id_attribute_group eq 6}

            <span>
              {l s='See' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]" href="/tabela-rozmiarow" target="_blank">{l s='table size' d='Shop.Theme.Actions'}</a>
            </span>
            {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Fototapety"}
              <span>
                <a class="underline font-medium text-[#ADAFBA]" href="/instrukcja-montazu" target="_blank">{l s='Download the assembly manual' d='Shop.Theme.Actions'}</a>
              </span>
            {/if}


          {elseif $group.group_name == "Typ"}
            
            <span>
            {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Parawany"}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]"
                href="/nasze-parawany" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {else}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-[#ADAFBA]"
                href="/technologia-wykonania" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {/if}
            </span>
          {/if}
        </div>

      </div>
    {/if}
  {/foreach}
</div>
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

      <div class="clearfix product-variants-item flex flex-col items-start mb-5">
        <span class="block text-[14px] text-gray-main text-base leading-normal mb-[10px] font-light">
          {if $id_attribute_group neq 21}
            {$group.name}
          {/if}
        </span>
        
        {if $group.id_attribute_group neq 21}
        {else $group.group_type == 'select'}

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
                      class="color texture w-full h-20 tablet:h-[120px] mx-auto tablet:mx-0 bg-no-repeat bg-cover rounded-[5px] border-2 border-solid border-white hover:border-white peer-checked:border-main opacity-50 peer-checked:opacity-100 transition shadow-none aspect-[4/3]" style="background-image: url({$group_attribute.texture})"
                    {elseif $group_attribute.html_color_code}
                      class="color w-10 h-10 rounded-[5px]" style="background-color: {$group_attribute.html_color_code}" 
                    {/if}
                  ></span>
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


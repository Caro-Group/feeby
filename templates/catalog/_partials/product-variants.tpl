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
 {assign var="ids_with_container" value=[20, 3, 23]}

 <div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}

      <div class="{if $group.group_name|strstr:"Rodzaj fototapety"}hidden{/if} clearfix product-variants-item flex flex-col items-start mb-5 {if $id_attribute_group|in_array:$ids_with_container} mt-[30px] py-5 px-2.5 tablet:p-[30px] border-2 border-gray-2000 border-solid rounded-[5px] {/if}">
        <div class="block text-[14px] text-gray-main text-base leading-normal mb-[10px] font-light">
          {if $id_attribute_group neq 21}
            <span class="text-inherit">
              {$group.name}
            </span>
          {/if}
          {if $id_attribute_group eq 2 }
            {include file="./product-attr-popup.tpl" content_id=27}
          {/if}
        </div>
        
        {if $group.group_type == 'select'}
          <div class="w-full flex gap-2.5 flex-wrap tablet:flex-nowrap">
            <select
              class="form-select taxt-base py-2.5 pl-5 bg-[center_right_30px] bg-gray-default rounded border border-gray-2000 hover:border-gray-3000 !ring-0 !outline-0 !outline-offset-0 focus:!border-gray-3000 w-full focus:!ring-0 transition"
              id="group_{$id_attribute_group}"
              data-product-attribute="{$id_attribute_group}"
              name="group[{$id_attribute_group}]">
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
              {/foreach}
            </select>

            {if $group.group_name == "Rozmiar" || $id_attribute_group == 6}
              {*
              <a href="/" target="_blank" class="w-full tablet:w-[156px] group flex justify-center items-center w-full shrink-0 px-5 py-1.5 tablet:py-0 rounded-[5px] border border-solid border-gray-2000 hover:border-gray-3000 transition duration-300">
                <svg class="mr-5 tablet:mr-2.5 shrink-0" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M8.78593 15.2141H23.4916C23.7705 15.2141 24 15.4435 24 15.7224V23.4914C24 23.7704 23.7704 24 23.4914 24H0.508647C0.229618 24 0 23.7704 0 23.4914V0.508647C0 0.229618 0.229618 0 0.508647 0H8.27728C8.55631 0 8.78593 0.229618 8.78593 0.508647V15.2141ZM22.983 22.9827L19.6067 22.9839V19.7314C19.6067 19.4524 19.3771 19.2228 19.0981 19.2228C18.8191 19.2228 18.5894 19.4524 18.5894 19.7314V22.9839H15.9997V21.0263C15.9997 20.7473 15.7701 20.5177 15.4911 20.5177C15.212 20.5177 14.9824 20.7473 14.9824 21.0263V22.9839H12.393V21.0263C12.393 20.7473 12.1633 20.5177 11.8843 20.5177C11.6053 20.5177 11.3757 20.7473 11.3757 21.0263V22.9839H8.78593V19.7314C8.78593 19.4524 8.55631 19.2228 8.27728 19.2228C7.99826 19.2228 7.76864 19.4524 7.76864 19.7314V22.9839H1.01729V15.9924H4.26857C4.54759 15.9924 4.77721 15.7628 4.77721 15.4838C4.77721 15.2048 4.54759 14.9751 4.26857 14.9751H1.01729V12.3854H2.97486C3.25389 12.3854 3.4835 12.1558 3.4835 11.8768C3.4835 11.5977 3.25389 11.3681 2.97486 11.3681H1.01729V8.77866H2.97486C3.25389 8.77866 3.4835 8.54905 3.4835 8.27002C3.4835 7.99099 3.25389 7.76137 2.97486 7.76137H1.01729V5.17163H4.26857C4.54759 5.17163 4.77721 4.94201 4.77721 4.66298C4.77721 4.38396 4.54759 4.15434 4.26857 4.15434H1.01729V1.01729H7.76864V15.7227C7.76958 16.0014 7.99862 16.2304 8.27728 16.2314H22.9827L22.983 22.9827Z" fill="#ADAFBA"/>
                </svg>
                <span class="font-medium text-main-dark text-sm tablet:text-xs group-hover:!text-main transition duration-300">
                  {l s='Order custom-size wallpaper' d='Shop.Theme.Actions'}
                </span>
              </a>
              *}
            {/if}

          </div>

        {elseif $group.group_type == 'color'}

        <ul id="group_{$id_attribute_group}" class="flex w-full flex-wrap {if ! $id_attribute_group|in_array:$ids_with_container} justify-center {/if} tablet:justify-start">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container w-full {if $id_attribute_group|in_array:$ids_with_container} mx-2.5 tablet:ml-0 tablet:mr-[35px] max-w-[80px] {else} mr-5 phone:max-w-[40%] tablet:max-w-[121px] tablet:aspect-ratio-[4/3] tablet:mr-5 desktop:max-w-[29%] 1920:max-w-[28%] {/if} ">
                <label aria-label="{$group_attribute.name}" class="flex flex-col cursor-pointer">
                  <input class="input-color peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                   class=" color texture w-full  {if $id_attribute_group|in_array:$ids_with_container} h-[54px] {else} h-20 tablet:h-[120px]  opacity-50 peer-checked:opacity-100 aspect-[4/3] {/if}  mx-auto tablet:mx-0 bg-no-repeat bg-cover rounded-[5px] border-2 border-solid border-gray-2000 hover:border-gray-3000 peer-checked:border-main transition shadow-none overflow-hidden" {if $group_attribute.html_color_code} style="background-color: {$group_attribute.html_color_code}" {/if}>
                  {if $group_attribute.texture}
                    <picture>
                      <source srcset="{$group_attribute.texture|replace:".png":".webp"|replace:".jpg":".webp"|escape:'html':'UTF-8'}" type="image/webp">
						          <source srcset="{$group_attribute.texture|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg">
                      <img class="block h-full w-full object-cover" src="{$group_attribute.texture|replace:" ":"%20"}" />
                    </picture>
                  {/if}
                  </span>
                <span class="text-main-dark p-0 text-center text-base {if $id_attribute_group|in_array:$ids_with_container} pt-1 tablet-medium:text-lg !leading-4 tablet-medium:!leading-5 {else} pt-[10px] tablet-medium:text-sm {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {elseif $group.group_type == 'radio'}

          <ul id="group_{$id_attribute_group}"
            class="{if $group.name == "Rozmiar fototapety" || $id_attribute_group == '21'} hidden {/if} flex flex-row flex-wrap gap-y-2">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="shrink basis-0 tablet:basis-1/5 pr-2">
                <label class="mb-0 w-full h-full">
                  <input class="form-radio sr-only peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span class="bg-gray-default flex justify-center items-center text-center h-full border-2 border-solid border-gray-2000 cursor-pointer px-2 py-3 hover:border-gray-3000 peer-checked:border-main text-gray-main rounded transition text-sm !leading-[139%] min-w-[120px] word-break">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {/if}

        </div>
      <hr class="my-[20px] bg-gray-2000  {if $group.group_name|strstr:"Rodzaj fototapety" || ($group.group_name == "Typ" && $group.attributes['416'] && $group.attributes['416'] && $group.attributes['416'].selected) || $id_attribute_group == '2' || $id_attribute_group == '23' || $group@last }hidden{/if}  ">
    {/if}
  {/foreach}
</div>
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
 {assign var="ids_with_container" value=[23, 4]}

 <div class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}

      <div class="{if $group.group_name|strstr:"Rodzaj fototapety"}hidden{/if} clearfix product-variants-item flex flex-col items-start mb-5 {if $id_attribute_group|in_array:$ids_with_container} mt-[30px] py-5 px-2.5 tablet:p-[30px] border-2 border-gray-2000 border-solid rounded-[5px] {/if}">
        <span class="block text-base text-gray-main text-lg leading-normal mb-[13px] tablet:mb-[18px] font-medium">
          {if $id_attribute_group neq 21 }
            {$group.name}
          {/if}
        </span>
        
        {if $group.group_type == 'select'}

          <select
            class="form-select taxt-base tablet:text-xl py-[18px] tablet:py-4 pl-[30px] bg-[center_right_30px] bg-gray-default rounded border-2 border-gray-2000 hover:border-gray-3000 !ring-0 !outline-0 !outline-offset-0 focus:!border-gray-3000 w-full mb-[10px] focus:!ring-0 transition"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>

        {elseif $group.group_type == 'color'}

        <ul id="group_{$id_attribute_group}" class="flex w-full flex-wrap {if ! $id_attribute_group|in_array:$ids_with_container} justify-center {/if} tablet:justify-start">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container w-full {if $id_attribute_group|in_array:$ids_with_container} mx-2.5 tablet:ml-0 tablet:mr-[35px] max-w-[80px] {else} mr-5 phone:max-w-[40%] tablet:max-w-[121px] tablet:aspect-ratio-[4/3] tablet:mr-5 desktop:max-w-[29%] {/if} ">
                <label aria-label="{$group_attribute.name}" class="flex flex-col cursor-pointer">
                  <input class="input-color peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                   class="{if $group_attribute.texture} color texture w-full  {if $id_attribute_group|in_array:$ids_with_container} h-[54px] {else} h-20 tablet:h-[120px]  opacity-50 peer-checked:opacity-100 aspect-[4/3] {/if}  mx-auto tablet:mx-0 bg-no-repeat bg-cover rounded-[5px] border-2 border-solid border-gray-2000 hover:border-gray-3000 peer-checked:border-main transition shadow-none overflow-hidden {elseif $group_attribute.html_color_code} color w-10 h-10 rounded-[5px] {/if}" {if $group_attribute.html_color_code} style="background-color: {$group_attribute.html_color_code}" {/if}>
                  {if $group_attribute.texture}
                    <picture>
                      <source srcset="{$group_attribute.texture|replace:".png":".webp"|replace:".jpg":".webp"|escape:'html':'UTF-8'}" type="image/webp">
						          <source srcset="{$group_attribute.texture|replace:" ":"%20"|escape:'html':'UTF-8'}" type="image/jpeg"> 
                      <img class="block h-full object-cover" src="{$group_attribute.texture|replace:" ":"%20"}" />
                    </picture>
                  {/if}
                  </span>
                <span class="text-main-dark p-0 text-center text-base {if $id_attribute_group|in_array:$ids_with_container} pt-1 tablet-medium:text-lg whitespace-nowrap {else} pt-[10px] tablet-medium:text-2xl {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {elseif $group.group_type == 'radio'}

          <ul id="group_{$id_attribute_group}" class="{if $group.name == "Rozmiar fototapety" || $id_attribute_group == '21'} hidden {/if} flex flex-row flex-wrap">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="flex-1 grow-0 mb-2">
                <label class="mb-0 mr-2 h-full">
                  <input class="form-radio sr-only peer" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span class="bg-gray-default flex items-center text-center h-full border-2 border-solid cursor-pointer px-2 py-1 hover:border-gray-3000 peer-checked:border-main text-gray-main rounded transition {if $breadcrumb.links[1].title == 'Parawany'} text-sm tablet:text-base {else} text-base tablet:text-lg !leading-6 min-w-[100px] word-break {/if}">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
          
        {/if}

        <div class="flex flex-wrap mt-5 leading-normal text-[14px] tablet:text-base  gap-2.5 tablet:gap-5">
          {if $group.group_name == "Rozmiar" || $id_attribute_group == 6}

            <a href="/tabela-rozmiarow" target="_blank" class="flex items-center phone:basis-[calc(50%_-_5px)] tablet-medium:basis-auto transition">
              <svg class="shrink-0 mr-2.5" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                <path d="M9 0.25C4.16797 0.25 0.25 4.16797 0.25 9C0.25 13.832 4.16797 17.75 9 17.75C13.832 17.75 17.75 13.832 17.75 9C17.75 4.16797 13.832 0.25 9 0.25ZM9 16.2656C4.98828 16.2656 1.73438 13.0117 1.73438 9C1.73438 4.98828 4.98828 1.73438 9 1.73438C13.0117 1.73438 16.2656 4.98828 16.2656 9C16.2656 13.0117 13.0117 16.2656 9 16.2656Z" fill="#ADAFBA"/>
                <path d="M8.0625 5.5625C8.0625 5.81114 8.16127 6.0496 8.33709 6.22541C8.5129 6.40123 8.75136 6.5 9 6.5C9.24864 6.5 9.4871 6.40123 9.66291 6.22541C9.83873 6.0496 9.9375 5.81114 9.9375 5.5625C9.9375 5.31386 9.83873 5.0754 9.66291 4.89959C9.4871 4.72377 9.24864 4.625 9 4.625C8.75136 4.625 8.5129 4.72377 8.33709 4.89959C8.16127 5.0754 8.0625 5.31386 8.0625 5.5625ZM9.46875 7.75H8.53125C8.44531 7.75 8.375 7.82031 8.375 7.90625V13.2188C8.375 13.3047 8.44531 13.375 8.53125 13.375H9.46875C9.55469 13.375 9.625 13.3047 9.625 13.2188V7.90625C9.625 7.82031 9.55469 7.75 9.46875 7.75Z" fill="#ADAFBA"/>
              </svg>
              <span class="text-gray-3000 hover:text-main font-medium transition duration-200">
                {l s='See table size' d='Shop.Theme.Actions'}
              </span>
            </a>
            {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Fototapety"}
            <a href="/instrukcja-montazu" target="_blank" class="flex items-center phone:basis-[calc(50%_-_5px)] tablet-medium:basis-auto transition">
              <svg class="shrink-0 mr-2.5" xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 21 23" fill="none">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M20.5 6.57812V19.9375C20.5 20.6834 20.199 21.3988 19.6632 21.9262C19.1273 22.4537 18.4006 22.75 17.6429 22.75H16.2143V21.3438H17.6429C18.0217 21.3438 18.3851 21.1956 18.653 20.9319C18.9209 20.6681 19.0714 20.3105 19.0714 19.9375V6.57812H16.2143C15.646 6.57812 15.1009 6.35589 14.6991 5.9603C14.2972 5.56472 14.0714 5.02819 14.0714 4.46875V1.65625H6.21429C5.83541 1.65625 5.47204 1.80441 5.20413 2.06813C4.93622 2.33185 4.78571 2.68954 4.78571 3.0625V15.7188H3.35714V3.0625C3.35714 2.31658 3.65816 1.60121 4.19398 1.07376C4.7298 0.546316 5.45652 0.25 6.21429 0.25L14.0714 0.25L20.5 6.57812ZM2.78571 16.9141H0.5V22.5377H1.63V20.6505H2.77714C3.18714 20.6505 3.53571 20.5703 3.82286 20.4072C4.11286 20.2427 4.33429 20.0205 4.48429 19.7406C4.63998 19.447 4.71902 19.1198 4.71429 18.7886C4.71429 18.437 4.63857 18.1192 4.48857 17.8366C4.33937 17.5556 4.11127 17.3227 3.83143 17.1658C3.54571 16.997 3.19857 16.9141 2.78571 16.9141ZM3.56429 18.7886C3.56944 18.9739 3.52771 19.1575 3.44286 19.323C3.36673 19.467 3.24824 19.5851 3.10286 19.6619C2.93655 19.7429 2.75261 19.7825 2.56714 19.7772H1.62571V17.8H2.56857C2.88 17.8 3.12429 17.8844 3.3 18.0545C3.47571 18.2261 3.56429 18.4708 3.56429 18.7886ZM5.30286 16.9141V22.5377H7.38857C7.96143 22.5377 8.43714 22.4252 8.81429 22.2044C9.19594 21.9796 9.49396 21.6399 9.66429 21.2355C9.85 20.8136 9.94429 20.3045 9.94429 19.7111C9.94429 19.1205 9.85143 18.617 9.66429 18.1994C9.49597 17.7996 9.2008 17.4642 8.82286 17.2431C8.44571 17.0238 7.96714 16.9141 7.38714 16.9141H5.30286ZM6.43286 17.8211H7.23714C7.59143 17.8211 7.88 17.8914 8.10714 18.0348C8.34291 18.1866 8.52079 18.4112 8.61286 18.6733C8.72571 18.9559 8.78143 19.3089 8.78143 19.7322C8.78586 20.0127 8.7532 20.2925 8.68429 20.5647C8.63339 20.7793 8.53807 20.9814 8.40429 21.1581C8.27999 21.3158 8.11531 21.4381 7.92714 21.5125C7.70666 21.5937 7.47249 21.6328 7.23714 21.6278H6.43286V17.8211ZM11.78 20.3003V22.5377H10.6514V16.9141H14.2914V17.8323H11.78V19.4031H14.0743V20.3003H11.78Z" fill="#ADAFBA"/>
              </svg>
              <span class="text-gray-3000 hover:text-main font-medium transition duration-200">
                {l s='Download the assembly manual' d='Shop.Theme.Actions'}
              </span>
            </a>

            <div class=" text-center mt-2.5 w-full shrink-0 px-5 py-[5px] rounded-[5px] border border-solid border-gray-2000">
              <span class="text-main-dark text-base">
                {l s='Need a different size?' d='Shop.Theme.Actions'} <a class="underline font-medium text-main-dark inline-block tablet:inline hover:!underline hover:!text-main transition duration-200" href="/" target="_blank">{l s='Try out our generator' d='Shop.Theme.Actions'}</a>
              </span>
            </div>

            {/if}


          {elseif $group.group_name == "Typ"}
            
            <span class="font-normal text-gray-3000">
            {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Parawany"}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-gray-3000 hover:text-main hover:underline transition duration-200" href="/nasze-parawany" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {else}
              {l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium text-gray-3000 hover:text-main hover:underline transition duration-200" href="/technologia-wykonania" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a>
            {/if}
            </span>
          {/if}
        </div>
      </div>
      {if $group.group_name == "Typ" && $group.attributes['416'] && !$group.attributes['416'].selected}
        <hr class="my-[30px]">
      {/if}
    {/if}
  {/foreach}
</div>


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

      <div class="clearfix product-variants-item flex flex-col items-start mb-[10px]">
        <span class="flex font-bold text-[20px] leading-[27px] items-start mb-[10px]">

          {if $group.group_name == "Rozmiar"}
            <span class="mr-[5px]">{l s='Choose size' d='Shop.Theme.Actions'}</span>

            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 23 23" fill="none">
              <path d="M21.9768 15.9297L7.07839 1.01563C6.93327 0.870358 6.76095 0.755109 6.57126 0.676478C6.38158 0.597846 6.17826 0.557373 5.97292 0.557373C5.76758 0.557373 5.56426 0.597846 5.37457 0.676478C5.18489 0.755109 5.01256 0.870358 4.86745 1.01563L1.0237 4.8672C0.732682 5.15995 0.569336 5.55597 0.569336 5.96876C0.569336 6.38155 0.732682 6.77757 1.0237 7.07032L15.9221 21.9844C16.0681 22.1292 16.2413 22.2438 16.4317 22.3215C16.622 22.3993 16.8259 22.4387 17.0315 22.4375C17.4441 22.4378 17.8401 22.2749 18.1331 21.9844L21.9768 18.1328C22.2678 17.8401 22.4312 17.444 22.4312 17.0313C22.4312 16.6185 22.2678 16.2224 21.9768 15.9297ZM17.0315 20.875L2.12526 5.96876L5.96901 2.12501L8.92995 5.08595L7.17214 6.81251L8.2737 7.91407L10.0315 6.18751L13.2581 9.41407L11.5003 11.1719L12.6096 12.2813L14.3674 10.5234L17.594 13.75L15.8362 15.5078L16.969 16.6094L18.7268 14.8516L20.8753 17.0313L17.0315 20.875Z" fill="#C4C4C4"/>
            </svg>

          {elseif $group.group_name == "Typ"}
            <span class="mr-[5px]">{$group.name}</span>

            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
              <path d="M10 0C8.02219 0 6.08879 0.58649 4.4443 1.6853C2.79981 2.78412 1.51809 4.3459 0.761209 6.17317C0.00433284 8.00043 -0.193701 10.0111 0.192152 11.9509C0.578004 13.8907 1.53041 15.6725 2.92894 17.0711C4.32746 18.4696 6.10929 19.422 8.0491 19.8079C9.98891 20.1937 11.9996 19.9957 13.8268 19.2388C15.6541 18.4819 17.2159 17.2002 18.3147 15.5557C19.4135 13.9112 20 11.9778 20 10C20 8.68678 19.7413 7.38642 19.2388 6.17317C18.7363 4.95991 17.9997 3.85752 17.0711 2.92893C16.1425 2.00035 15.0401 1.26375 13.8268 0.761205C12.6136 0.258658 11.3132 0 10 0ZM10 18C8.41775 18 6.87104 17.5308 5.55544 16.6518C4.23985 15.7727 3.21447 14.5233 2.60897 13.0615C2.00347 11.5997 1.84504 9.99113 2.15372 8.43928C2.4624 6.88743 3.22433 5.46197 4.34315 4.34315C5.46197 3.22433 6.88743 2.4624 8.43928 2.15372C9.99113 1.84504 11.5997 2.00346 13.0615 2.60896C14.5233 3.21447 15.7727 4.23984 16.6518 5.55544C17.5308 6.87103 18 8.41775 18 10C18 12.1217 17.1572 14.1566 15.6569 15.6569C14.1566 17.1571 12.1217 18 10 18Z" fill="#C4C4C4"/>
              <path d="M10 7C10.5523 7 11 6.55228 11 6C11 5.44772 10.5523 5 10 5C9.44772 5 9 5.44772 9 6C9 6.55228 9.44772 7 10 7Z" fill="#C4C4C4"/>
              <path d="M10 8C9.73478 8 9.48043 8.10536 9.29289 8.29289C9.10536 8.48043 9 8.73478 9 9V14C9 14.2652 9.10536 14.5196 9.29289 14.7071C9.48043 14.8946 9.73478 15 10 15C10.2652 15 10.5196 14.8946 10.7071 14.7071C10.8946 14.5196 11 14.2652 11 14V9C11 8.73478 10.8946 8.48043 10.7071 8.29289C10.5196 8.10536 10.2652 8 10 8Z" fill="#C4C4C4"/>
            </svg>

          {elseif $group.group_name == "Rodzaj fototapety"}
          {else}
            <span>{$group.name}</span>
          {/if}

        </span>
        
        {if $group.group_name == "Rodzaj fototapety"}
        {elseif $group.group_type == 'select'}

          <select
            class="form-control form-select"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>

        {elseif $group.group_type == 'color'}

          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="float-xs-left input-container">
                <label aria-label="{$group_attribute.name}" class="flex flex-col">
                  <input class="input-color" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                    {if $group_attribute.texture}
                      class="color texture" style="background-image: url({$group_attribute.texture})"
                    {elseif $group_attribute.html_color_code}
                      class="color" style="background-color: {$group_attribute.html_color_code}" 
                    {/if}
                  ></span>
                  <span class="text-black text-center p-0 pt-[10px]">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>

        {elseif $group.group_type == 'radio'}

          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li class="input-container float-xs-left">
                <label>
                  <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span class="radio-label">{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
          
        {/if}

        {if $group.group_name == "Rozmiar"}

          <span class="text-[16px] leading-[22px]">{l s='See' d='Shop.Theme.Actions'} <a class="underline font-medium" href="/tabela-rozmiarow" target="_blank">{l s='table size' d='Shop.Theme.Actions'}</a></span>
          
        {elseif $group.group_name == "Typ"}
          {if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Parawany"}
            <span class="text-[16px] leading-[22px]">{l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium" href="/nasze-parawany" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a></span>
          {else}
            <span class="text-[16px] leading-[22px]">{l s='Learn more about the' d='Shop.Theme.Actions'} <a class="underline font-medium" href="/technologia-wykonania" target="_blank">{l s='manufacturing technology' d='Shop.Theme.Actions'}</a></span>
          {/if}
        {/if}

      </div>
    {/if}
  {/foreach}
</div>


{*
 * We offer the best and most useful modules PrestaShop and modifications for your online store.
 *
 * We are experts and professionals in PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses.
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 * @author    PresTeamShop SAS (Registered Trademark) <info@presteamshop.com>
 * @copyright 2011-2022 PresTeamShop SAS, All rights reserved.
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
 *
 * @category  PrestaShop
 * @category  Module
*}

{*
* Necesario para acceder a la propiedad color para añadir clase "two-column-mobile" siempre y cando no sea filtro de colores.
*}
{assign var='first_option' value=array_shift($filter.options)}
{assign var='no_use' value=array_unshift($filter.options, $first_option)}

<div id="filter-options_{$filter.id_filter|intval}" class="overflow-hidden collapse in"
    aria-expanded="true" >
    <div class="flex flex-wrap gap-2.5 pb-[30px]">
        {foreach $filter.options item=option}
            {if $option}
                <div class="checkbox ">
                    <label for="option_{$option.id_option|intval}" class="whitespace-nowrap border-2 border-solid border-gray-2000 rounded-[5px] checked:border-main
                    {if $filter.id_filter == 18}
                      !p-2.5 
                    {else}
                      !p-[15px]  
                    {/if}
                    ">
                        <input
                            id="option_{$option.id_option|intval}"
                            name="filter_{$filter.id_filter|intval}"
                            type="checkbox"
                            {if $option.id_option == 0}disabled{/if}
                            data-id_searcher="{$searcher.id_searcher|intval}"
                            data-id_filter="{$filter.id_filter|intval}"
                            data-control_type="{$filter.control|intval}"
                            {if $params_back.CONFIG_VARS.FPP_SHOW_FILTER_IN_URL eq 1}
                            data-name="{$option.name|escape:'htmlall':'UTF-8'}"
                            data-option-name="{$option.link_rewrite|escape:'htmlall':'UTF-8'}"
                            {/if}
                            value="{$option.id_option|intval}"
                            autocomplete="off"
                            {if $option.selected}checked{/if}
                            {if $filter.type eq 5 and $option.color and ($option.color.color or $option.color.texture)}
                                class="hidden d-none"
                            {/if}
                        />

                        <i class="material-icons hidden !visible peer-checked:!inline-block text-main -left-1 -top-[3px] mr-2.5 text-lg relative">close</i>

                        {if $filter.id_filter == 18}
                        <div class="bg-gray-2000 clearfix float-left w-[25px] h-[25px] mr-6 rounded border border-solid" style="
                          {if $option.id_option == 796}
                            background-color: #FEF3DE;
                            border-color: #FEF3DE;
                          {elseif $option.id_option == 799}
                            background-color: #AA6D12;
                            border-color: #AA6D12;
                          {elseif $option.id_option == 800}
                            background: linear-gradient(270deg, #000000 50.51%, #FFFFFF 50.52%);
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 804}
                            background-color: #ED0000;
                            border-color: #ED0000;
                          {elseif $option.id_option == 806}
                            background-color: #C23D85;
                            border-color: #C23D85;
                          {elseif $option.id_option == 808}
                            background: linear-gradient( 90deg, rgba(255, 0, 0, 1) 0%, rgba(255, 154, 0, 1) 10%, rgba(208, 222, 33, 1) 20%, rgba(79, 220, 74, 1) 30%, rgba(63, 218, 216, 1) 40%, rgba(47, 201, 226, 1) 50%, rgba(28, 127, 238, 1) 60%, rgba(95, 21, 242, 1) 70%, rgba(186, 12, 248, 1) 80%, rgba(251, 7, 217, 1) 90%, rgba(255, 0, 0, 1) 100% );
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 809}
                            background-color: #005FB1;
                            border-color: #005FB1;
                          {elseif $option.id_option == 811}
                            background-color: #FF9A02;
                            border-color: #FF9A02;
                          {elseif $option.id_option == 813}
                            background-color: #FFB6C1;
                            border-color: #FFB6C1;
                          {elseif $option.id_option == 815}
                            background-color: #EAEAEA;
                            border-color: #EAEAEA;
                          {elseif $option.id_option == 816}
                            background-color: #848484;
                            border-color: #848484;
                          {elseif $option.id_option == 818}
                            background-color: #46932A;
                            border-color: #46932A;
                          {elseif $option.id_option == 822}
                            background-color: #DFCA80;
                            border-color: #DFCA80;
                          {elseif $option.id_option == 821}
                            background-color: #FFE233;
                            border-color: #FFE233;
                          {elseif $option.id_option == 797}
                            background: #FFFFFF;
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 802}
                            background-color: #000000;
                            border-color: #000000;
                          {/if}">
                          </div>
                        {/if}
                        
                        {if $filter.type eq 5 and $option.color and ($option.color.color or $option.color.texture)}
                            {if $option.color.color}
                                <span class="checkmark {if $option.color.color eq '#ffffff'}white{/if}" style="background: {$option.color.color|escape:'htmlall':'UTF-8'};" title="{$option.name|escape:'htmlall':'UTF-8'}"></span>
                                <span class="hidden">{$option.name|escape:'htmlall':'UTF-8'}</span>
                            {/if}
                            {if $option.color.texture }
                                <span class="checkmark" style="background-image: url('{$option.color.texture|escape:'htmlall':'UTF-8'}');" title="{$option.name|escape:'htmlall':'UTF-8'}"></span>
                                <span class="hidden">{$option.name|escape:'htmlall':'UTF-8'}</span>
                            {/if}
                        {else}
                            <span>{$option.name|escape:'htmlall':'UTF-8'}</span>
                        {/if}
                        {if $params_back.CONFIG_VARS.FPP_SHOW_TOTAL_PRODUCTS_OPTION eq 1 and $option.id_option != 0}
                            <span>({$option.total_products|intval})</span>
                        {/if}
                    </label>
                </div>
            {/if}
        {/foreach}
    </div>
</div>
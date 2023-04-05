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

<div id="filter-options_{$filter.id_filter|intval}" class="column-{$filter.columns|intval} filter-options-content{if $first_option.color and !$first_option.color.color} two-column-mobile{/if}{if $searcher.hook neq 3 and $searcher.hook neq 4} fixed-height{/if}
     max-h-[210px] overflow-y-scroll collapse tablet:max-w-[350px] tablet:min-w-[260px] tablet:-ml-[19px] tablet:mt-[13px] bg-gray-1000 rounded-b-md"
    aria-expanded="false" >
    <div class="content-to-scroll">
        {foreach $filter.options item=option}
            {if $option}
                <div class="checkbox">
                    <label for="option_{$option.id_option|intval}">
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
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

<div id="filter_{$filter.id_filter|intval}"
    class="relative border-0 border-b tablet:border-b-0 border-gray-2000 border-solid"
    data-id_filter="{$filter.id_filter|intval}"
    data-control_type="{$filter.control|intval}"
    data-filter_name="{$filter.name.{$params_back.id_lang|intval}}"
    data-filter_depends="{$filter.filter_depends|intval}"
    data-name="{FilterProductsPro::linkRewrite($filter.name[$params_back.id_lang|intval])}"
    data-sort="{$filter.sort|intval}">
    {if $filter.type neq 7}
        {foreach $filter.options item=option}
            {if $option && $option.selected}
                {assign var=activeCount value=$activeCount+1}
            {/if}
        {/foreach}
        <div class="filter-name !flex cursor-pointer tablet:px-0 py-5 tablet:py-0 justify-between tablet:justify-start group collapse in"
        data-parent="#searcher_{$searcher.id_searcher|intval}" data-target="#filter-options_{$filter.id_filter|intval}" data-toggle="collapse" aria-expanded="true">
            <p class="!m-0 text-lg tablet:text-2xl font-body font-normal text-main-dark">
                {$filter.name[$params_back.id_lang|intval]}
            </p>
            <svg class="facet-icon transition duration-300" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.6273 5L19.5 13.7596L19.5 13.7614L18.2454 15L9.99913 6.73966L1.7546 14.9982L0.5 13.7596L9.3727 5L10.6273 5Z" fill="#232322"/>
            </svg>
        </div>
    {/if}
    {if $params_back.CONFIG_VARS.FPP_FILTER_SEARCH_BOX and ($filter.control eq $params_back.control_types.CHECK or $filter.control eq $params_back.control_types.RADIO)}
        <div class="filter-options-box">
            <input
                type="text"
                class="form-control"
                value=""
                placeholder="{l s='Search options' mod='filterproductspro'}"
                data-id_filter="{$filter.id_filter|intval}"
                autocomplete="off"
                />
        </div>
    {/if}
    {if $filter.control eq $params_back.control_types.LIST and isset($filter.options)}
        {include file="module:filterproductspro/views/templates/front/controls/list.tpl" filter=$filter}
    {elseif $filter.control eq $params_back.control_types.RADIO and isset($filter.options)}
        {include file="module:filterproductspro/views/templates/front/controls/radio.tpl" filter=$filter}
    {elseif $filter.control eq $params_back.control_types.CHECK and isset($filter.options)}
        {include file="module:filterproductspro/views/templates/front/controls/checkbox.tpl" filter=$filter}
    {elseif $filter.control eq $params_back.control_types.SLIDER and isset($searcher.min_price) and isset($searcher.max_price)}
        {include file="module:filterproductspro/views/templates/front/controls/price.tpl" filter=$filter}
    {elseif $filter.control eq $params_back.control_types.INPUT}
        {include file="module:filterproductspro/views/templates/front/controls/input.tpl" filter=$filter}
    {/if}
</div>
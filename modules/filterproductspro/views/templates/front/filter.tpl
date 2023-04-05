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
    class="relative"
    data-id_filter="{$filter.id_filter|intval}"
    data-control_type="{$filter.control|intval}"
    data-filter_name="{$filter.name.{$params_back.id_lang|intval}}"
    data-filter_depends="{$filter.filter_depends|intval}"
    data-name="{FilterProductsPro::linkRewrite($filter.name[$params_back.id_lang|intval])}"
    data-sort="{$filter.sort|intval}">
    {if $filter.type neq 7}
        <div class="filter-name flex cursor-pointer px-5 tablet:px-0 border-0 border-b-2 tablet:border-b-0 border-gray-1000 border-solid py-5 tablet:py-0 justify-between tablet:justify-start group collapsed"
        data-parent="#searcher_{$searcher.id_searcher|intval}" data-target="#filter-options_{$filter.id_filter|intval}" data-toggle="collapse" aria-expanded="false">
            <p class="!m-0 text-base font-body font-normal text-main-dark group-hover:text-main transition">
                {$filter.name[$params_back.id_lang|intval]}
            </p>
            <span class="pl-4 -top-[2px] relative">
                <i class="material-icons text-xl text-main-dark group-hover:text-main transition">add</i>
            </span>
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
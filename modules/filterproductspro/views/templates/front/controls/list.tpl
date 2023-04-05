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

<select
    class="form-control"
    name="filter_{$filter.id_filter|intval}"
    id="filter_{$filter.id_filter|intval}"
    data-id_searcher="{$searcher.id_searcher|intval}"
    data-id_filter="{$filter.id_filter|intval}"
    data-control_type="{$filter.control|intval}"
    data-filter_depends="{$filter.filter_depends|intval}"
    data-sort="{$filter.sort|intval}"
    autocomplete="off"
    {if $filter.enabled eq 0}disabled="disabled"{/if}>
    <option value="-1">{l s='Select an option' mod='filterproductspro'}</option>
    {foreach $filter.options item=option}
        <option
            {if $option.id_option == 0}disabled{/if}
            value="{$option.id_option|intval}"
            {if $params_back.CONFIG_VARS.FPP_SHOW_FILTER_IN_URL eq 1}
            data-option-name="{$option.link_rewrite|escape:'htmlall':'UTF-8'}"
            data-name="{$option.name|escape:'htmlall':'UTF-8'}"
            {/if}
            {if $option.selected}selected="selected"{/if}>
            {$option.name|escape:'htmlall':'UTF-8'}
            {if $params_back.CONFIG_VARS.FPP_SHOW_TOTAL_PRODUCTS_OPTION eq 1 and $option.id_option != 0}({$option.total_products|intval}){/if}
        </option>
    {/foreach}
</select>
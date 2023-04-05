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

<div class="column-{$filter.columns|intval} filter-options-content price {if $searcher.hook neq 3 and $searcher.hook neq 4} fixed-height {/if}">
    <div class="row">
        <div class="col-6 col-md-6">
            <label for="min_price_{$filter.id_filter|intval}">
                <div class="min_price_label">
                    {l s='Min. price: ' mod='filterproductspro'}
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">{$params_back.currencySign|escape:'htmlall':'UTF-8'}</span>
                    <input
                        id="min_price_{$filter.id_filter|intval}"
                        name="min_price_{$filter.id_filter|intval}"
                        class="form-control"
                        type="number"
                        data-id_searcher="{$searcher.id_searcher|intval}"
                        data-id_filter="{$filter.id_filter|intval}"
                        data-control_type="{$filter.control|intval}"
                        value="{if isset($searcher.min_selected)}{$searcher.min_selected|intval}{else}{if $searcher.min_price|intval < 0}0{else}{$searcher.min_price|intval}{/if}{/if}"
                        autocomplete="off"
                    >
                </div>
            </label>
        </div>
        <div class="col-6 col-md-6">
            <label for="max_price_{$filter.id_filter|intval}">
                <div class="max_price_label">
                    {l s='Max. price: ' mod='filterproductspro'}
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">{$params_back.currencySign|escape:'htmlall':'UTF-8'}</span>
                    <input
                        id="max_price_{$filter.id_filter|intval}"
                        name="max_price_{$filter.id_filter|intval}"
                        class="form-control"
                        type="number"
                        data-id_searcher="{$searcher.id_searcher|intval}"
                        data-id_filter="{$filter.id_filter|intval}"
                        data-control_type="{$filter.control|intval}"
                        value="{if isset($searcher.max_selected)}{$searcher.max_selected|intval}{else}{$searcher.max_price|intval}{/if}"
                        autocomplete="off"
                    >
                </div>
            </label>
        </div>
    </div>
    <div class="row">
        <div class="slider-price-content">
            <div class="div-xs-12">
                <div
                    class="filterpro_slider_container option option-slider"
                    id="filter_price_{$filter.id_filter|intval}"
                    data-control="{$filter.control|intval}"
                    data-min="{if $searcher.min_price|intval < 0}0{else}{$searcher.min_price|intval}{/if}"
                    data-max="{$searcher.max_price|intval}">
                </div>
            </div>
        </div>
    </div>
</div>
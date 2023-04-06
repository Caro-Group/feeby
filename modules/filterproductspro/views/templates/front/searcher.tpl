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

<div id="search_filters_wrapper"
    class="collapse order-3 tablet:order-2 tablet:rounded-l-md tablet:bg-gray-1000 w-full tablet:w-filter "
    aria-expanded="false" style="">
    <div class="tablet:block tablet:h-full relative">
        <div class='fpp_searchers'>
            {foreach from=$params_back.searchers item=searcher}
                {if $searcher.filters|count > 0}
                    {if $searcher.hook neq 1 and $searcher.hook neq 3 and $searcher.hook neq 4 and $searcher.hook neq 8}
                        <div class="{if $searcher.hook eq 2}searcher-top{/if}">
                        {/if}
                        <div class="content-permanent-mobile" id="content_permanent_mobile_{$searcher.id_searcher|intval}">
                            <div data-id_searcher="{$searcher.id_searcher|intval}" id="searcher_{$searcher.id_searcher|intval}"
                                data-name="{FilterProductsPro::linkRewrite($searcher.name.{$params_back.id_lang|intval})}"
                                class="pts searcher-content hook_{$searcher.hook|intval} !bg-transparent">
                                <div class="searcher-header hidden">
                                    <div class="header-content">
                                        <i class="header-icon fa-pts fa-pts-filter"></i>&nbsp;
                                        <span>{$searcher.name.{$params_back.id_lang|intval}}</span>
                                        <div class="header-right-content">
                                            <a class="close-mobile-searcher hidden-dt"
                                                data-toggle-searcher="{$searcher.id_searcher|intval}">
                                                <i class="fa-pts fa-pts-times"></i>
                                            </a>
                                            {if $searcher.instant_search eq 1}
                                                <a class="refresh-mobile-searcher"
                                                    id="refresh_searcher_{$searcher.id_searcher|intval}"
                                                    data-id_searcher="{$searcher.id_searcher|intval}"
                                                    title="{l s='Refresh searcher' mod='filterproductspro'}">
                                                    <i class="fa-pts fa-pts-refresh"></i>
                                                </a>
                                            {/if}
                                            <i class="icon-collapse fa-pts fa-pts-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="searcher-body tablet:pl-5">
                                    <div class="filter-content">
                                        <div class="row flex flex-wrap">
                                            {assign var='col' value=$searcher.columns_break}

                                            {foreach from=$searcher.filters item=filter}
                                                <div class="filter w-full tablet:w-auto tablet:pr-5 tablet:py-2.5">
                                                    {include file='./filter.tpl' filter=$filter}
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                                {if $searcher.instant_search eq 0}
                                    <div class="searcher-footer">
                                        <div class="row">
                                            <div class="col-12 col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                                <button class="btn btn-sm btn-primary w-100"
                                                    data-id_searcher="{$searcher.id_searcher|intval}"
                                                    id="btn_searcher_{$searcher.id_searcher|intval}">
                                                    <i class="fa-pts fa-pts-search">
                                                        &nbsp;</i>{l s='Search' mod='filterproductspro'}
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                {else}
                                    <div class="searcher-footer" style="display: none;">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                                <button class="btn btn-sm btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12"
                                                    data-toggleSearcher="{$searcher.id_searcher|intval}" id="btn_view_results">
                                                    <i class="fa-pts fa-pts-eye">
                                                        &nbsp;</i>{l s='View Results' mod='filterproductspro'}
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                        {if $searcher.hook neq 1 and $searcher.hook neq 3 and $searcher.hook neq 4 and $searcher.hook neq 8}
                        </div>
                    {/if}
                {/if}
            {/foreach}
        </div>
    </div>
</div>

<div style="flex:1 1 auto;"
    class=".active_filters_wrapper order-4 tablet:h-full tablet:block tablet:!max-h-[none] transition duration-300">
    <div id="active_filters" class="tablet:block tablet:h-full relative" aria-expanded="false">
        {foreach from=$params_back.searchers item=searcher}
            {if $searcher.filters|count > 0}
                <div class="content-permanent-mobile" id="content_permanent_mobile_{$searcher.id_searcher|intval}">
                    {if !empty($searcher.selected_options) }
                        <div style="flex:1 1 auto;" class="order-4 tablet:h-full tablet:block">
                            <div id="options_selected_{$searcher.id_searcher|intval}">
                                <div class="mt-5 mb-5 tablet:mb-0 tablet:pl-5">
                                    <div class="text-base font-body font-normal hidden tablet:block hidden tablet:block">
                                        {l s='Selected options: ' mod='filterproductspro'}</div>
                                    {foreach from=$searcher.selected_options item=option}
                                        <button id="btn_selected_option_{$option.id_option|intval}"
                                            class="btn-selected-option hidden tablet:block filter-block ml-4 text-sm mb-4 border-2 border-gray-2000 border-solid rounded-md py-1 pl-1 pr-2 group text-main-dark font-normal"
                                            data-id_searcher="{$searcher.id_searcher|intval}"
                                            data-id_filter="{$option.id_filter|intval}"
                                            data-filter_name="{$option.filter_name.{$params_back.id_lang|intval}}"
                                            data-id_option="{$option.id_option|intval}"
                                            data-option_name="{$option.option_name.{$params_back.id_lang|intval}}"
                                            data-control_type="{$option.control|intval}">
                                            <i
                                                class="material-icons float-left font-light mr-2 close text-lg relative mt-px flex justify-center items-center text-main-dark group-hover:text-main transition"></i>
                                            {$option.filter_name[$params_back.id_lang|intval]}:
                                            {$option.option_name[$params_back.id_lang|intval]|replace:'--':''}
                                        </button>
                                    {/foreach}
                                    <button
                                        class="btn-reset-filter block bg-gray-1000 hover:bg-gray-2000 transition border-2 border-gray-1000 border-solid cursor-pointer text-main-dark mx-auto tablet:ml-4 px-5 py-1.5 tablet:py-1 relative rounded-full text-base tablet:text-sm uppercase tablet:!normal-case"
                                        id="reset_button_{$searcher.id_searcher|intval}"
                                        data-id_searcher="{$searcher.id_searcher|intval}">
                                        {l s='Reset Searcher' mod='filterproductspro'}
                                    </button>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>
            {/if}
        {/foreach}
    </div>
</div>
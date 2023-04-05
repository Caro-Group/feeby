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

<style>
    {if isset($params_back.CONFIGS.FPP_THEME_TITLE_BACKGROUND_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_TITLE_BACKGROUND_COLOR)}
        .searcher-header {ldelim}
            background-color: {$params_back.CONFIGS.FPP_THEME_TITLE_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_TITLE_TEXT_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_TITLE_TEXT_COLOR)}
        .header-content > span {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_TITLE_TEXT_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_TITLE_ICON_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_TITLE_ICON_COLOR)}
        .header-icon {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_TITLE_ICON_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BACKGROUND_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BACKGROUND_COLOR)}
        [id^="reset_button_"], [id^="btn_selected_option_"] {ldelim}
            background-color: {$params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BORDER_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BORDER_COLOR)}
        [id^="reset_button_"], [id^="btn_selected_option_"] {ldelim}
            border-color: {$params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_BORDER_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_TEXT_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_TEXT_COLOR)}
        [id^="reset_button_"], [id^="btn_selected_option_"] {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_SELECTED_OPTION_TEXT_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_SEARCHER_BACKGROUND_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_SEARCHER_BACKGROUND_COLOR)}
        [id^="searcher_"], .searcher-body, .searcher-footer {ldelim}
            background-color: {$params_back.CONFIGS.FPP_THEME_SEARCHER_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_FILTER_NAME_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_FILTER_NAME_COLOR)}
        .filter-name, .min_price_label, .max_price_label {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_FILTER_NAME_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_OPTION_CHECK_RADIO_TEXT_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_OPTION_CHECK_RADIO_TEXT_COLOR)}
        .checkbox > label > span, .radio > label > span {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_OPTION_CHECK_RADIO_TEXT_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BACKGROUND_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BACKGROUND_COLOR)}
        [id ^= 'btn_searcher_'] {ldelim}
            background: {$params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BORDER_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BORDER_COLOR)}
        [id ^= 'btn_searcher_'] {ldelim}
            border-color: {$params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_BORDER_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_TEXT_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_TEXT_COLOR)}
        [id ^= 'btn_searcher_'] {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_BUTTON_SEARCH_TEXT_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_ICON_MOBILE_BACKGROUND_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_ICON_MOBILE_BACKGROUND_COLOR)}
        #icon-searchers-mobile {ldelim}
            background-color: {$params_back.CONFIGS.FPP_THEME_ICON_MOBILE_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_ICON_MOBILE_COLOR) and not empty($params_back.CONFIGS.FPP_THEME_ICON_MOBILE_COLOR)}
        #icon-searchers-mobile > i {ldelim}
            color: {$params_back.CONFIGS.FPP_THEME_ICON_MOBILE_COLOR|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_FONT_FAMILY) and not empty($params_back.CONFIGS.FPP_THEME_FONT_FAMILY)}
        .fpp_searchers * {ldelim}
            font-family: {$params_back.CONFIGS.FPP_THEME_FONT_FAMILY|escape:'htmlall':'UTF-8'}, FontAwesomePTS !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_FONT_SIZE) and not empty($params_back.CONFIGS.FPP_THEME_FONT_SIZE)}
        .fpp_searchers * {ldelim}
            font-size: {$params_back.CONFIGS.FPP_THEME_FONT_SIZE|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
    {if isset($params_back.CONFIGS.FPP_THEME_FONT_WEIGHT) and not empty($params_back.CONFIGS.FPP_THEME_FONT_WEIGHT)}
        .fpp_searchers * {ldelim}
            font-weight: {$params_back.CONFIGS.FPP_THEME_FONT_WEIGHT|escape:'htmlall':'UTF-8'} !important;
        {rdelim}
    {/if}
</style>
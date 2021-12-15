{*
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApBlockLink -->

{* mt-10 py-6 w-3/5 items-end flex-col-reverse tablet:hidden tablet:flex-row justify-start tablet:text-left tablet:items-center tablet:justify-start tablet:flex-col tablet:w-full px-6 tablet:px-6 tablet:py-20 case-normal justify-end *}

{if $hookName == 'displayNav1'}




    {if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
        {if isset($formAtts.lib_error) && $formAtts.lib_error}
            <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
        {/if}
    {else}
        {if !isset($formAtts.accordion_type) || $formAtts.accordion_type == 'full'}{* Default : always full *}
            <div class="ApLink {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
                {if isset($formAtts.title) && !empty($formAtts.title)}
                    <h4 class="title_block">
                        {$formAtts.title|escape:'html':'UTF-8'}
                    </h4>
                {/if}
                {if isset($formAtts.sub_title) && $formAtts.sub_title}
                    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
                {/if}

                {if isset($formAtts.links) && $formAtts.links|@count > 0}
                    <ul class="flex ">
                        {foreach from=$formAtts.links item=item}
                            {if $item.title && $item.link}
                                <li class="ml-6">
                                    <a class="text-main-dark hover:text-main transition" href="{$item.link}"
                                        target="{$item.target_type}">
                                        {if $item.link|strstr:'facebook'}
                                            <svg class="fill-current text-main-dark hover:text-main transition" width="13" height="20" viewBox="0 0 13 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M10.9038 11.25L11.4593 7.63047H7.98624V5.28164C7.98624 4.29141 8.47139 3.32617 10.0269 3.32617H11.6058V0.244531C11.6058 0.244531 10.173 0 8.80303 0C5.94288 0 4.07334 1.73359 4.07334 4.87187V7.63047H0.894043V11.25H4.07334V20H7.98624V11.25H10.9038Z"
                                                     />
                                            </svg>

                                        {/if}
                                        {if $item.link|strstr:'instagram'}
                                            <svg class="fill-current text-main-dark hover:text-main transition" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" clip-rule="evenodd"
                                                    d="M6.22075 0.888252C7.19825 0.843252 7.50992 0.833252 9.99992 0.833252C12.4899 0.833252 12.8016 0.844085 13.7782 0.888252C14.7549 0.932419 15.4216 1.08825 16.0049 1.31409C16.6157 1.54492 17.1699 1.90575 17.6282 2.37242C18.0949 2.82992 18.4549 3.38325 18.6849 3.99492C18.9116 4.57825 19.0666 5.24492 19.1116 6.21992C19.1566 7.19909 19.1666 7.51075 19.1666 9.99992C19.1666 12.4899 19.1557 12.8016 19.1116 13.7791C19.0674 14.7541 18.9116 15.4208 18.6849 16.0041C18.4549 16.6158 18.0943 17.1701 17.6282 17.6283C17.1699 18.0949 16.6157 18.4549 16.0049 18.6849C15.4216 18.9116 14.7549 19.0666 13.7799 19.1116C12.8016 19.1566 12.4899 19.1666 9.99992 19.1666C7.50992 19.1666 7.19825 19.1558 6.22075 19.1116C5.24575 19.0674 4.57908 18.9116 3.99575 18.6849C3.38402 18.4549 2.82977 18.0943 2.37159 17.6283C1.90524 17.1705 1.54435 16.6165 1.31409 16.0049C1.08825 15.4216 0.933252 14.7549 0.888252 13.7799C0.843252 12.8008 0.833252 12.4891 0.833252 9.99992C0.833252 7.50992 0.844085 7.19825 0.888252 6.22159C0.932419 5.24492 1.08825 4.57825 1.31409 3.99492C1.54469 3.38332 1.90585 2.82935 2.37242 2.37159C2.82995 1.90534 3.38365 1.54445 3.99492 1.31409C4.57825 1.08825 5.24492 0.933252 6.21992 0.888252H6.22075ZM13.7041 2.53825C12.7374 2.49409 12.4474 2.48492 9.99992 2.48492C7.55242 2.48492 7.26242 2.49409 6.29575 2.53825C5.40158 2.57909 4.91658 2.72825 4.59325 2.85409C4.16575 3.02075 3.85992 3.21825 3.53908 3.53909C3.23496 3.83496 3.0009 4.19515 2.85408 4.59325C2.72825 4.91659 2.57908 5.40159 2.53825 6.29575C2.49408 7.26242 2.48492 7.55242 2.48492 9.99992C2.48492 12.4474 2.49408 12.7374 2.53825 13.7041C2.57908 14.5983 2.72825 15.0833 2.85408 15.4066C3.00075 15.8041 3.23492 16.1649 3.53908 16.4608C3.83492 16.7649 4.19575 16.9991 4.59325 17.1458C4.91658 17.2716 5.40158 17.4208 6.29575 17.4616C7.26242 17.5058 7.55158 17.5149 9.99992 17.5149C12.4482 17.5149 12.7374 17.5058 13.7041 17.4616C14.5982 17.4208 15.0833 17.2716 15.4066 17.1458C15.8341 16.9791 16.1399 16.7816 16.4607 16.4608C16.7649 16.1649 16.9991 15.8041 17.1458 15.4066C17.2716 15.0833 17.4207 14.5983 17.4616 13.7041C17.5057 12.7374 17.5149 12.4474 17.5149 9.99992C17.5149 7.55242 17.5057 7.26242 17.4616 6.29575C17.4207 5.40159 17.2716 4.91659 17.1458 4.59325C16.9791 4.16575 16.7816 3.85992 16.4607 3.53909C16.1649 3.23498 15.8047 3.00093 15.4066 2.85409C15.0833 2.72825 14.5982 2.57909 13.7041 2.53825ZM8.82908 12.8258C9.48297 13.0979 10.2111 13.1347 10.889 12.9297C11.567 12.7247 12.1527 12.2907 12.5463 11.7018C12.9398 11.1129 13.1166 10.4056 13.0466 9.70084C12.9766 8.99603 12.6641 8.3374 12.1624 7.83742C11.8426 7.51782 11.4559 7.2731 11.0302 7.12087C10.6045 6.96865 10.1503 6.91272 9.70033 6.9571C9.25039 7.00148 8.81588 7.14507 8.42809 7.37753C8.0403 7.60999 7.70887 7.92554 7.45767 8.30146C7.20647 8.67738 7.04174 9.10433 6.97535 9.55155C6.90895 9.99878 6.94254 10.4552 7.0737 10.8878C7.20486 11.3205 7.43032 11.7188 7.73385 12.0539C8.03738 12.3889 8.41144 12.6526 8.82908 12.8258ZM6.66825 6.66825C7.10577 6.23073 7.62518 5.88367 8.19683 5.64689C8.76848 5.4101 9.38117 5.28823 9.99992 5.28823C10.6187 5.28823 11.2314 5.4101 11.803 5.64689C12.3747 5.88367 12.8941 6.23073 13.3316 6.66825C13.7691 7.10577 14.1162 7.62519 14.3529 8.19683C14.5897 8.76848 14.7116 9.38117 14.7116 9.99992C14.7116 10.6187 14.5897 11.2314 14.3529 11.803C14.1162 12.3747 13.7691 12.8941 13.3316 13.3316C12.448 14.2152 11.2495 14.7116 9.99992 14.7116C8.7503 14.7116 7.55186 14.2152 6.66825 13.3316C5.78464 12.448 5.28823 11.2495 5.28823 9.99992C5.28823 8.7503 5.78464 7.55187 6.66825 6.66825ZM15.7566 5.98992C15.865 5.88764 15.9518 5.76465 16.0118 5.62823C16.0719 5.49181 16.1039 5.34473 16.1061 5.19569C16.1083 5.04666 16.0805 4.89871 16.0245 4.76059C15.9685 4.62248 15.8853 4.49701 15.7799 4.39162C15.6745 4.28623 15.549 4.20305 15.4109 4.14702C15.2728 4.09098 15.1248 4.06323 14.9758 4.0654C14.8268 4.06758 14.6797 4.09963 14.5433 4.15967C14.4068 4.2197 14.2839 4.3065 14.1816 4.41492C13.9827 4.62578 13.8738 4.90585 13.878 5.19569C13.8822 5.48553 13.9992 5.76232 14.2042 5.96729C14.4092 6.17226 14.686 6.28928 14.9758 6.2935C15.2656 6.29773 15.5457 6.18883 15.7566 5.98992Z"
                                                     />
                                            </svg>

                                        {/if}
                                        {$item.title|escape:'html':'UTF-8'}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/if}
    {/if}

    





{elseif $hookName == 'displayFooter'}

    {if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
        {if isset($formAtts.lib_error) && $formAtts.lib_error}
            <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
        {/if}
    {else}
        {if !isset($formAtts.accordion_type) || $formAtts.accordion_type == 'full'}{* Default : always full *}
            <div class="ApLink {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
                {if isset($formAtts.title) && !empty($formAtts.title)}
                    <h4 class="mb-0 text-lg uppercase text-main-dark">
                        {$formAtts.title|escape:'html':'UTF-8'}
                    </h4>
                {/if}
                {if isset($formAtts.sub_title) && $formAtts.sub_title}
                    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
                {/if}

                {if isset($formAtts.links) && $formAtts.links|@count > 0}
                    <ul>
                        {foreach from=$formAtts.links item=item}
                            {if $item.title && $item.link}
                                <li><a class="text-main-dark" href="{$item.link}" target="{$item.target_type}">{$item.title|escape:'html':'UTF-8'}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {elseif isset($formAtts.accordion_type) && ($formAtts.accordion_type == 'accordion' || $formAtts.accordion_type == 'accordion_small_screen')}{* Case : full or accordion*}
            <div
                class="block-toggler ApLink {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}{if $formAtts.accordion_type == 'accordion_small_screen'} accordion_small_screen{/if}">
                {if isset($formAtts.title) && !empty($formAtts.title)}
                    <div class="title clearfix bg-white tablet:bg-transparent clearfix flex h-14 items-center px-6 tablet:px-0 border-0 border-b-2 border-solid border-gray-1000 tablet:border-b-0"
                        data-target="#footer-link-{$formAtts.form_id|escape:'html':'UTF-8'}" data-toggle="collapse">
                        <h4 class="mb-0 text-lg uppercase text-main-dark">
                            {$formAtts.title|escape:'html':'UTF-8'}
                        </h4>
                        <span class="float-xs-right">
                            <span class="navbar-toggler collapse-icons">
                                <i class="material-icons text-4xl add">&#xE313;</i>
                                <i class="material-icons text-4xl remove">&#xE316;</i>
                            </span>
                        </span>
                    </div>
                {/if}
                {if isset($formAtts.sub_title) && $formAtts.sub_title}
                    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
                {/if}
                {if isset($formAtts.links) && $formAtts.links|@count > 0}
                    <ul class="collapse" id="footer-link-{$formAtts.form_id|escape:'html':'UTF-8'}">
                        {foreach from=$formAtts.links item=item}
                            {if $item.title && $item.link}
                                <li
                                    class="border-0 border-b-2 border-solid border-white tablet:border-b-0 flex h-14 tablet:h-10 items-center px-6">
                                    <a class="text-main-dark" href="{$item.link}" target="{$item.target_type}">{$item.title|escape:'html':'UTF-8'}</a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/if}
    {/if}




{else}


    {if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
        {if isset($formAtts.lib_error) && $formAtts.lib_error}
            <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
        {/if}
    {else}
        {if !isset($formAtts.accordion_type) || $formAtts.accordion_type == 'full'}{* Default : always full *}
            <div class="block ApLink {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
                {if isset($formAtts.title) && !empty($formAtts.title)}
                    <h4 class="title_block">
                        {$formAtts.title|escape:'html':'UTF-8'}
                    </h4>
                {/if}
                {if isset($formAtts.sub_title) && $formAtts.sub_title}
                    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
                {/if}

                {if isset($formAtts.links) && $formAtts.links|@count > 0}
                    <ul>
                        {foreach from=$formAtts.links item=item}
                            {if $item.title && $item.link}
                                <li><a href="{$item.link}" target="{$item.target_type}">{$item.title|escape:'html':'UTF-8'}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {elseif isset($formAtts.accordion_type) && ($formAtts.accordion_type == 'accordion' || $formAtts.accordion_type == 'accordion_small_screen')}{* Case : full or accordion*}
            <div
                class="block block-toggler ApLink {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}{if $formAtts.accordion_type == 'accordion_small_screen'} accordion_small_screen{/if}">
                {if isset($formAtts.title) && !empty($formAtts.title)}
                    <div class="title clearfix" data-target="#footer-link-{$formAtts.form_id|escape:'html':'UTF-8'}"
                        data-toggle="collapse">
                        <h4 class="title_block">
                            {$formAtts.title|escape:'html':'UTF-8'}
                        </h4>
                        <span class="float-xs-right">
                            <span class="navbar-toggler collapse-icons">
                                <i class="material-icons add">&#xE313;</i>
                                <i class="material-icons remove">&#xE316;</i>
                            </span>
                        </span>
                    </div>
                {/if}
                {if isset($formAtts.sub_title) && $formAtts.sub_title}
                    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
                {/if}
                {if isset($formAtts.links) && $formAtts.links|@count > 0}
                    <ul class="collapse" id="footer-link-{$formAtts.form_id|escape:'html':'UTF-8'}">
                        {foreach from=$formAtts.links item=item}
                            {if $item.title && $item.link}
                                <li><a href="{$item.link}" target="{$item.target_type}">{$item.title|escape:'html':'UTF-8'}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/if}
    {/if}


{/if}

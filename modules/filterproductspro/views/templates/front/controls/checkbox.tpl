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
    <ul class="filter-options_container flex flex-wrap pb-[30px] {if $filter.id_filter == 23} gap-x-[30px] gap-y-5 items-end {else} gap-2.5 {/if}">
        {foreach $filter.options item=option}
            {if $option}
                <li class="max-w-full">
                    <label for="option_{$option.id_option|intval}" class="whitespace-nowrap !flex {if $filter.id_filter == 23} option-svg flex-col gap-2.5 {else} border-2 border-solid border-gray-2000 hover:border-gray-3000 {/if} items-center w-full cursor-pointer !mb-0 {if $option.selected } active {/if} rounded-[5px] transition duration-200 !p-[9px] tablet:!p-[13px] ">
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

                        {if $filter.id_filter == 18}
                        <div class="shrink-0 bg-gray-2000 clearfix float-left w-[25px] h-[25px] mr-2.5 rounded border border-solid" style="
                          {if $option.id_option == 824}
                            background-color: #FEF3DE;
                            border-color: #FEF3DE;
                          {elseif $option.id_option == 827}
                            background-color: #AA6D12;
                            border-color: #AA6D12;
                          {elseif $option.id_option == 829}
                            background: linear-gradient(270deg, #000000 50.51%, #FFFFFF 50.52%);
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 833}
                            background-color: #ED0000;
                            border-color: #ED0000;
                          {elseif $option.id_option == 834}
                            background-color: #C23D85;
                            border-color: #C23D85;
                          {elseif $option.id_option == 836}
                            background: linear-gradient( 90deg, rgba(255, 0, 0, 1) 0%, rgba(255, 154, 0, 1) 10%, rgba(208, 222, 33, 1) 20%, rgba(79, 220, 74, 1) 30%, rgba(63, 218, 216, 1) 40%, rgba(47, 201, 226, 1) 50%, rgba(28, 127, 238, 1) 60%, rgba(95, 21, 242, 1) 70%, rgba(186, 12, 248, 1) 80%, rgba(251, 7, 217, 1) 90%, rgba(255, 0, 0, 1) 100% );
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 838}
                            background-color: #005FB1;
                            border-color: #005FB1;
                          {elseif $option.id_option == 841}
                            background-color: #FF9A02;
                            border-color: #FF9A02;
                          {elseif $option.id_option == 843}
                            background-color: #FFB6C1;
                            border-color: #FFB6C1;
                          {elseif $option.id_option == 844}
                            background-color: #EAEAEA;
                            border-color: #EAEAEA;
                          {elseif $option.id_option == 845}
                            background-color: #848484;
                            border-color: #848484;
                          {elseif $option.id_option == 847}
                            background-color: #46932A;
                            border-color: #46932A;
                          {elseif $option.id_option == 851}
                            background-color: #DFCA80;
                            border-color: #DFCA80;
                          {elseif $option.id_option == 849}
                            background-color: #FFE233;
                            border-color: #FFE233;
                          {elseif $option.id_option == 826}
                            background: #FFFFFF;
                            border-color: #ADAFBA;
                          {elseif $option.id_option == 831}
                            background-color: #000000;
                            border-color: #000000;
                          {/if}">
                          </div>
                        {/if}


                        {if $filter.id_filter == 23}
                          <div class="shrink-0">
                            {if $option.id_option == 971}
                              <svg class="tablet:hidden" width="60" height="75" viewBox="0 0 60 75" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect x="0.5" y="0.5" width="59" height="74" rx="4.5">
                              </svg>

                            {elseif $option.id_option == 972}
                              <svg class="tablet:hidden" width="75" height="60" viewBox="0 0 75 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect x="0.5" y="0.5" width="74" height="59" rx="4.5"/>
                              </svg>

                            {elseif $option.id_option == 968}
                              <svg class="tablet:hidden" width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.96" x="0.5" y="0.5" width="59" height="59" rx="4.5"/>
                              </svg>
                              
                            {elseif $option.id_option == 973}
                              <svg class="tablet:hidden" width="74" height="53" viewBox="0 0 74 53" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.96" x="0.5" y="0.5" width="19" height="52" rx="4.5" />
                                <rect opacity="0.96" x="27.5" y="0.5" width="19" height="52" rx="4.5" />
                                <rect opacity="0.96" x="54.5" y="0.5" width="19" height="52" rx="4.5" />
                              </svg>

                            
                            {elseif $option.id_option == 311}
                              <svg class="tablet:hidden" width="73" height="60" viewBox="0 0 73 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.96" x="0.5" y="20.5" width="12" height="19" rx="3.5" />
                                <rect opacity="0.96" x="15.5" y="10.5" width="12" height="39" rx="3.5" />
                                <rect opacity="0.96" x="30.5" y="0.5" width="12" height="59" rx="3.5" />
                                <rect opacity="0.96" x="45.5" y="10.5" width="12" height="39" rx="3.5" />
                                <rect opacity="0.96" x="60.5" y="20.5" width="12" height="19" rx="3.5" />
                              </svg>
                              
                            {elseif $option.id_option == 969}
                              <svg class="tablet:hidden" width="75" height="37" viewBox="0 0 75 37" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.96" x="0.5" y="0.5" width="74" height="35.9231" rx="4.5" />
                              </svg>
                              
                            {elseif $option.id_option == 970}
                              <svg class="tablet:hidden" width="50" height="75" viewBox="0 0 50 75" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.96" x="0.5" y="0.5" width="49" height="74" rx="4.5" />
                              </svg>
                              
                            {/if}
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
                        <span class="block text-ellipsis overflow-hidden text-main-dark w-full font-body font-normal">{$option.name|escape:'htmlall':'UTF-8'}</span>
                        {/if}
                        {if $params_back.CONFIG_VARS.FPP_SHOW_TOTAL_PRODUCTS_OPTION eq 1 and $option.id_option != 0}
                            <span>({$option.total_products|intval})</span>
                        {/if}
                    </label>
                </li>
            {/if}
        {/foreach}
    </ul>
</div>
{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{if $displayedFacets|count}
  <div id="search_filters" class="flex flex-wrap">
    <div class="tablet:pl-5 w-full whitespace-nowrap">
      <div class="flex flex-col tablet:flex-wrap tablet:flex-row w-full">
        {foreach from=$displayedFacets item="facet"}
          <div class="tablet:pr-5 tablet:py-2.5">
            <section class="facet clearfix  border-0 border-b-2 tablet:border-b-0 border-solid border-gray-1000">
              {if isset($facet.properties["id_attribute_group"])}
                {assign var=_expand_id value="`$facet.type`_`$facet.properties['id_attribute_group']`"}
              {else if isset($facet.properties["id_feature"])}
                {assign var=_expand_id value="`$facet.type`_`$facet.properties['id_feature']`"}
              {else}
                {assign var=_expand_id value=10|mt_rand:100000}
              {/if}
              {assign var=_collapse value=true}
              {assign var=activeCount value=0}
              {foreach from=$facet.filters item="filter"}
                {if $filter.active}
                  {assign var=_collapse value=false}
                  {assign var=activeCount value=$activeCount+1}
                {/if}
              {/foreach}

              <div class="facet-container title cursor-pointer py-5 tablet:py-0 justify-between tablet:justify-start group collapse in"
                data-target="#facet_{$_expand_id}" data-toggle="collapse" 
                  aria-expanded="true" {if $_expand_id == 'attribute_group_18'}style="display: none;" {/if}>
                  <p class="facet-title m-0 text-base font-body font-normal group-hover:text-main transition">{$facet.label}
                  {if $activeCount>0}
                    <span class="tablet:hidden">({$activeCount})</span>
                  {/if} 
                  </p>
                  <svg class="facet-icon transition duration-300" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.6273 5L19.5 13.7596L19.5 13.7614L18.2454 15L9.99913 6.73966L1.7546 14.9982L0.5 13.7596L9.3727 5L10.6273 5Z" fill="#232322"/>
                  </svg>
                </div>

                {if in_array($facet.widgetType, ['radio', 'checkbox'])}
                  {block name='facet_item_other'}
                    <div id="facet_{$_expand_id}" class="overflow-hidden collapse in">
                    <ul
                      class="flex flex-wrap gap-2.5 pb-[30px]">
                      {foreach from=$facet.filters key=filter_key item="filter"}
                        {if !$filter.displayed}
                          {continue}
                        {/if}

                        {if $_expand_id == 'attribute_group_15'}
                          <li class="group {if !$_collapse && !$filter.active}opacity-40 hover:opacity-100{/if}
                          {if $filter.active} active {/if} transition duration-200 overflow-hidden rounded-md  ">
                            <label class="facet-label"
                              for="facet_input_{$_expand_id}_{$filter_key}">
                              <input id="facet_input_{$_expand_id}_{$filter_key}" data-search-url="{$filter.nextEncodedFacetsURL}"
                            type="checkbox" {if $filter.active }checked{/if} class="hidden">
                              <a href="{$filter.nextEncodedFacetsURL}" class="flex flex-col js-search-link" rel="nofollow">
                                <img class="object-cover w-[150px] h-24 tablet:w-44 tablet:h-28 " src="{$filter.properties.texture}" />
                                <h3
                                  class="text-main-dark group-hover:text-main transition duration-200 text-base tablet:text-lg font-normal font-body ml-[10px] tablet:ml-5 my-3">
                                  {$filter.label}</h3>
                              </a>
                            </label>
                          </li>
                        {else}
                          <li class="max-w-full">
                            <label class="facet-label whitespace-nowrap border-2 border-solid border-gray-2000 rounded-[5px] 
                              {if $filter.active} active {/if}
                              {if $facet.type == 'feature' && $facet.properties.id_feature == '4'}
                                !p-2.5 
                              {else}
                                !p-[15px]  
                              {/if}
                              "
                              for="facet_input_{$_expand_id}_{$filter_key}">
                              {if $facet.multipleSelectionAllowed}
                                <span class="custom-checkbox">
                                  <input id="facet_input_{$_expand_id}_{$filter_key}" data-search-url="{$filter.nextEncodedFacetsURL}"
                                    type="checkbox" {if $filter.active }checked{/if}>
                                  {if isset($filter.properties.color)}
                                    <i class="material-icons text-main -left-1 -top-[7px] text-lg relative">close</i>
                                  {elseif isset($filter.properties.texture)}
                                    <i class="material-icons text-main -left-1 -top-[7px] text-lg relative">close</i>
                                  {/if}
                                </span>
                              {else}
                                <span class="custom-radio border-0 bg-transparent">
                                  <input id="facet_input_{$_expand_id}_{$filter_key}" data-search-url="{$filter.nextEncodedFacetsURL}"
                                    type="radio" name="filter {$facet.label}" {if $filter.active }checked{/if}>
                                </span>
                              {/if}

                              <a href="{$filter.nextEncodedFacetsURL}"
                                class="!w-full text-main-dark text-base search-link js-search-link" rel="nofollow">
                                {if $facet.type == 'feature'}
                                  {if $facet.properties.id_feature == '4'}

                                    <div class="bg-gray-2000 clearfix float-left w-[25px] h-[25px] mr-2.5 rounded border border-solid" style="{if $filter.value == 36}
                                  background-color: #FEF3DE;
                                  border-color: #FEF3DE;
                                {elseif $filter.value == 37}
                                  background-color: #AA6D12;
                                  border-color: #AA6D12;
                                {elseif $filter.value == 38}
                                  background: linear-gradient(270deg, #000000 50.51%, #FFFFFF 50.52%);
                                  border-color: #ADAFBA;
                                {elseif $filter.value == 39}
                                  background-color: #ED0000;
                                  border-color: #ED0000;
                                {elseif $filter.value == 40}
                                  background-color: #C23D85;
                                  border-color: #C23D85;
                                {elseif $filter.value == 41}
                                  background: linear-gradient( 90deg, rgba(255, 0, 0, 1) 0%, rgba(255, 154, 0, 1) 10%, rgba(208, 222, 33, 1) 20%, rgba(79, 220, 74, 1) 30%, rgba(63, 218, 216, 1) 40%, rgba(47, 201, 226, 1) 50%, rgba(28, 127, 238, 1) 60%, rgba(95, 21, 242, 1) 70%, rgba(186, 12, 248, 1) 80%, rgba(251, 7, 217, 1) 90%, rgba(255, 0, 0, 1) 100% );
                                  border-color: #ADAFBA;
                                {elseif $filter.value == 42}
                                  background-color: #005FB1;
                                  border-color: #005FB1;
                                {elseif $filter.value == 43}
                                  background-color: #FF9A02;
                                  border-color: #FF9A02;
                                {elseif $filter.value == 44}
                                  background-color: #FFB6C1;
                                  border-color: #FFB6C1;
                                {elseif $filter.value == 45}
                                  background-color: #EAEAEA;
                                  border-color: #EAEAEA;
                                {elseif $filter.value == 46}
                                  background-color: #848484;
                                  border-color: #848484;
                                {elseif $filter.value == 47}
                                  background-color: #46932A;
                                  border-color: #46932A;
                                {elseif $filter.value == 48}
                                  background-color: #DFCA80;
                                  border-color: #DFCA80;
                                {elseif $filter.value == 49}
                                  background-color: #FFE233;
                                  border-color: #FFE233;
                                {elseif $filter.value == 50}
                                  background: #FFFFFF;
                                  border-color: #ADAFBA;
                                {elseif $filter.value == 51}
                                  background-color: #000000;
                                  border-color: #000000;
                                {elseif $filter.value == 180}
                                  background: #FFFFFF;
                                  border-color: #ADAFBA;
                                {elseif $filter.value == 253}
                                  background: #000000;
                                  border-color: #000000;
                                {/if}"></div>
                                  {/if}
                                {/if}
                                {$filter.label}
                              </a>
                            </label>
                          </li>
                        {/if}
                      {/foreach}
                    </ul>
                    </div>
                  {/block}

                {elseif $facet.widgetType == 'dropdown'}
                  {block name='facet_item_dropdown'}
                    <ul id="facet_{$_expand_id}"
                      class="collapse{if !$_collapse} in{/if} tablet:max-w-[350px] tablet:min-w-[260px] tablet:-ml-[19px] tablet:mt-[13px] bg-gray-1000 rounded-b-md">
                      <li class="border-0 border-b border-solid border-white px-5 py-2">
                        <div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
                          <a class="select-title text-main-dark text-base font-light" rel="nofollow" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            {$active_found = false}
                            <span>
                              {foreach from=$facet.filters item="filter"}
                                {if $filter.active}
                                  {$filter.label}
                                  {if $filter.magnitude and $show_quantities}
                                    ({$filter.magnitude})
                                  {/if}
                                  {$active_found = true}
                                {/if}
                              {/foreach}
                              {if !$active_found}
                                {l s='(no filter)' d='Shop.Theme.Global'}
                              {/if}
                            </span>
                            <i class="material-icons float-xs-right">&#xE5C5;</i>
                          </a>
                          <div class="dropdown-menu">
                            {foreach from=$facet.filters item="filter"}
                              {if !$filter.active}
                                <a rel="nofollow" href="{$filter.nextEncodedFacetsURL}"
                                  class="select-list text-main-dark text-base font-light js-search-link">
                                  {$filter.label}
                                  {if $filter.magnitude and $show_quantities}
                                    ({$filter.magnitude})
                                  {/if}
                                </a>
                              {/if}
                            {/foreach}
                          </div>
                        </div>
                      </li>
                    </ul>
                  {/block}

                {elseif $facet.widgetType == 'slider'}
                  {block name='facet_item_slider'}
                    {foreach from=$facet.filters item="filter"}
                      <ul id="facet_{$_expand_id}"
                        class="faceted-slider collapse{if !$_collapse} in{/if} tablet:max-w-[350px] tablet:min-w-[260px] tablet:-ml-[19px] tablet:mt-[13px] bg-gray-1000 rounded-b-md"
                        data-slider-min="{$facet.properties.min}" data-slider-max="{$facet.properties.max}"
                        data-slider-id="{$_expand_id}" data-slider-values="{$filter.value|@json_encode}"
                        data-slider-unit="{$facet.properties.unit}" data-slider-label="{$facet.label}"
                        data-slider-specifications="{$facet.properties.specifications|@json_encode}"
                        data-slider-encoded-url="{$filter.nextEncodedFacetsURL}">
                        <li class="border-0 border-b border-solid border-white px-5 py-2">
                          <p id="facet_label_{$_expand_id}">
                            {$filter.label}
                          </p>

                          <div id="slider-range_{$_expand_id}"></div>
                        </li>
                      </ul>
                    {/foreach}
                  {/block}
                {/if}
              </section>
            </div>
          {/foreach}
        </div>
      </div>
    </div>
  {/if}
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
  <div id="search_filters" class="flex flex-wrap pr-5 py-3 rounded-md bg-gray-1000 ">
    <div class="swiper-filters pl-5 pb-[250px] mb-[-250px]">
      <div class="swiper-wrapper">
      {foreach from=$displayedFacets item="facet"}
        <div class="swiper-slide w-auto">
          <section class="facet clearfix">
            {assign var=_expand_id value=10|mt_rand:100000}
            {assign var=_collapse value=true}
            {foreach from=$facet.filters item="filter"}
              {if $filter.active}{assign var=_collapse value=false}{/if}
            {/foreach}

            <div class="title mr-12  {if $_collapse}collapsed{/if}" data-parent="#search_filters" data-target="#facet_{$_expand_id}" data-toggle="collapse"{if !$_collapse} aria-expanded="true"{/if}>
              <p class="facet-title m-0 text-base font-body font-normal">{$facet.label}</p>
              <span class="pl-4 -top-1 relative">
                <i class="material-icons text-xl ">add</i>
              </span>
            </div>

            {if in_array($facet.widgetType, ['radio', 'checkbox'])}
              {block name='facet_item_other'}
                <ul id="facet_{$_expand_id}" class="collapse max-w-[350px] -ml-[19px] mt-[13px]">
                  {foreach from=$facet.filters key=filter_key item="filter"}
                    {if !$filter.displayed}
                      {continue}
                    {/if}

                    <li class="border-0 border-b border-solid border-white px-5 py-2">
                      <label class="facet-label{if $filter.active} active {/if}" for="facet_input_{$_expand_id}_{$filter_key}">
                        {if $facet.multipleSelectionAllowed}
                          <span class="custom-checkbox">
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="checkbox"
                              {if $filter.active }checked{/if}
                            >
                            {if isset($filter.properties.color)}
                              <span class="color" style="background-color:{$filter.properties.color}"></span>
                            {elseif isset($filter.properties.texture)}
                              <span class="color texture" style="background-image:url({$filter.properties.texture})"></span>
                            {else}
                              <span {if !$js_enabled} class="ps-shown-by-js" {/if}><i class="material-icons text-main -left-1 -top-[7px] text-lg relative">close</i></span>
                            {/if}
                          </span>
                        {else}
                          <span class="custom-radio border-0 bg-transparent">
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="radio"
                              name="filter {$facet.label}"
                              {if $filter.active }checked{/if}
                            >
                            <span {if !$js_enabled} class="ps-shown-by-js hidden" {/if}>
                              <i class="material-icons text-main -left-1 -top-[7px] text-lg relative">close</i></span>
                          </span>
                        {/if}

                        <a
                          href="{$filter.nextEncodedFacetsURL}"
                          class="text-main-dark text-base font-light search-link js-search-link"
                          rel="nofollow"
                        >
                          {$filter.label}
                          {if $filter.magnitude and $show_quantities}
                            <span class="magnitude text-sm">({$filter.magnitude})</span>
                          {/if}
                        </a>
                      </label>
                    </li>
                  {/foreach}
                </ul>
              {/block}

            {elseif $facet.widgetType == 'dropdown'}
              {block name='facet_item_dropdown'}
                <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if} max-w-[350px] -ml-[19px] mt-[13px]">
                  <li class="border-0 border-b border-solid border-white px-5 py-2">
                    <div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
                      <a class="select-title text-main-dark text-base font-light" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <a
                              rel="nofollow"
                              href="{$filter.nextEncodedFacetsURL}"
                              class="select-list text-main-dark text-base font-light js-search-link"
                            >
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
                    class="faceted-slider collapse{if !$_collapse} in{/if} max-w-[350px] -ml-[19px] mt-[13px]"
                    data-slider-min="{$facet.properties.min}"
                    data-slider-max="{$facet.properties.max}"
                    data-slider-id="{$_expand_id}"
                    data-slider-values="{$filter.value|@json_encode}"
                    data-slider-unit="{$facet.properties.unit}"
                    data-slider-label="{$facet.label}"
                    data-slider-specifications="{$facet.properties.specifications|@json_encode}"
                    data-slider-encoded-url="{$filter.nextEncodedFacetsURL}"
                  >
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

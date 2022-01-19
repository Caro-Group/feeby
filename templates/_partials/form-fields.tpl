{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}
  
{else if $field.name == "id_gender"}{else}

  {if $field.name == 'company'}

    <div id="company" class="pb-8 ">
      <a class="block mb-8 border-b text-main-dark w-full desktop-presta:ml-[220px] hover:text-main transition text-xs tablet:text-sm collapsed font-body" data-toggle="collapse" href="#collapseCompany" role="button" aria-expanded="false" aria-controls="collapseCompany">
        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="7" fill="none"><path fill="#181828" d="M0 3h7v1H0z"/><path fill="#181828" d="M4 0v7H3V0z"/></svg>
        {l s='Add tax identification number and company name' d='Shop.Theme.Checkout'}
      </a>
      <div class="collapse" id="collapseCompany">
       
  {/if}

  <div class="flex flex-auto {if isset($theme)}flex-col{else}flex-col desktop-presta:flex-row{/if} mb-form {if !empty($field.errors)}has-error{/if}" data-field="{$field.type}">
    <label class="font-body font-normal ml-5 mt-3 tablet-medium:ml-0 desktop-presta:w-[220px] text-base tablet:text-xl text-main-dark text-left {if $field.required && $field.type !== 'checkbox'} required{/if}">
      {if $field.type !== 'checkbox'}
        {$field.label}
      {/if}
    </label>
    <div class=" flex-1 {if ($field.type === 'radio-buttons')} form-control-valign{/if}">

      {if $field.type === 'select'}

        {block name='form_field_item_select'}
          <select class="form-select rounded-md border w-full form-control-select" name="{$field.name}" {if $field.required}required{/if}>
            <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}

      {elseif $field.type === 'countrySelect'}

        {block name='form_field_item_country'}
          <select
          class="form-select font-body font-medium border border-gray-1000 rounded-full pl-4 bg-gray-1000 w-full focus:border-gray-3000 focus:ring-0 w-full form-control-select font-medium js-country"
          name="{$field.name}"
          {if $field.required}required{/if}
          >
            <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}

      {elseif $field.type === 'radio-buttons'}

        {block name='form_field_item_radio'}
          {foreach from=$field.availableValues item="label" key="value"}
            <label class="radio-inline">
              <span >
                <input
                  name="{$field.name}"
                  type="radio"
                  value="{$value}"
                  class="after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5"
                  {if $field.required}required{/if}
                  {if $value eq $field.value} checked {/if}
                >
                <span></span>
              </span>
              {$label}
            </label>
          {/foreach}
        {/block}

      {elseif $field.type === 'checkbox'}

        {block name='form_field_item_checkbox'}
          <span>
            <label>
              <input name="{$field.name}" type="checkbox" class="form-checkbox  cursor-pointer bg-white border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
              <span></span>
              <span class="cursor-pointer pl-3">{$field.label nofilter}
                {if $field.required}<span class="text-require">*</span>{/if}
              </span>
            </label>
          </span>
        {/block}

      {elseif $field.type === 'date'}

        {block name='form_field_item_date'}
          <input name="{$field.name}" class="form-input" type="date" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
        {/block}

      {elseif $field.type === 'birthday'}

        {block name='form_field_item_birthday'}
          <div class="js-parent-focus ">
            {html_select_date
            field_order=DMY
            time={$field.value}
            field_array={$field.name}
            prefix=false
            reverse_years=true
            field_separator='<br>'
            day_extra='class="form-control form-control-select"'
            month_extra='class="form-control form-control-select"'
            year_extra='class="form-control form-control-select"'
            day_empty={l s='-- day --' d='Shop.Forms.Labels'}
            month_empty={l s='-- month --' d='Shop.Forms.Labels'}
            year_empty={l s='-- year --' d='Shop.Forms.Labels'}
            start_year={'Y'|date}-100 end_year={'Y'|date}
            }
          </div>
        {/block}

      {elseif $field.type === 'password'}

        {block name='form_field_item_password'}
          <div class="input-group js-parent-focus">
            <input
              class="form-input js-child-focus js-visible-password placeholder:italic text-sm font-body border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0"
              name="{$field.name}"
              title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
              type="password"
              placeholder="{l s='Enter the password' d='Shop.Forms.Help'}"
              value=""
              pattern=".{ldelim}5,{rdelim}"
              {if $field.required}required{/if}
            >
            <span class="input-group-btn group absolute right-0 top-0 w-auto">
              <button
                class="btn btn-outline"
                type="button"
                data-action="show-password"
                data-text-show="{l s='Show' d='Shop.Theme.Actions'}"
                data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}"
              >
                {l s='Show' d='Shop.Theme.Actions'}
              
              </button>
              <span class=" absolute bottom-3 group-hover:text-main-dark material-icons opacity-100 right-3 text-2xl text-gray-3000 transition duration-100 ">
                  visibility
                </span><span class="absolute bottom-3 material-icons opacity-0 right-3 text-2xl text-main-dark transition duration-100 z-10">
                  visibility_off
                </span>
            </span>
          </div>
        {/block}

      {else}

        {block name='form_field_item_other'}
          <input
            class="form-input font-body text-sm placeholder:italic border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0"
            name="{$field.name}"
            type="{$field.type}"
            value="{$field.value}"
            {if isset($field.availableValues.placeholder)}
              placeholder="{$field.availableValues.placeholder}"
            {else}
              placeholder="{l s=$field.name d='Shop.Forms.Help'}"
            {/if}
            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
            {if $field.required}required{/if}
          >
        {/block}

      {/if}

      {block name='form_field_errors'}
        {include file='_partials/form-errors.tpl' errors=$field.errors}
      {/block}

    </div>
  </div>

{/if}

{if $field.name == 'vat_number' }
  </div>
</div>

{/if}
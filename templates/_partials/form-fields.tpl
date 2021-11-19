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

    <div id="company" class="mb-8">
      <a class="block mb-8 border-b text-black w-full collapsed" data-toggle="collapse" href="#collapseCompany" role="button" aria-expanded="false" aria-controls="collapseCompany">
        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="7" fill="none"><path fill="#181828" d="M0 3h7v1H0z"/><path fill="#181828" d="M4 0v7H3V0z"/></svg>
        {l s='Add tax identification number and company name' d='Shop.Theme.Checkout'}
      </a>
      <div class="collapse" id="collapseCompany">
       
  {/if}

  <div class="flex flex-auto {if isset($theme)} flex-col {else} flex-col phablet:flex-row {/if} mb-form {if !empty($field.errors)}has-error{/if}" data-field="{$field.type}">
    <label class="min-w-label text-left {if $field.required && $field.type !== 'checkbox'} required{/if}">
      {if $field.type !== 'checkbox'}
        {$field.label}
      {/if}
    </label>
    <div class="{if ($field.type === 'radio-buttons')} form-control-valign{/if}">

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
          class="form-select rounded-md border w-full form-control-select js-country"
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
              <span class="custom-radio">
                <input
                  name="{$field.name}"
                  type="radio"
                  value="{$value}"
                  class="form-radio"
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
          <span class="custom-checkbox">
            <label>
              <input name="{$field.name}" type="checkbox" class="form-checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if}>
              <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              <span>{$field.label nofilter}
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
          <div class="js-parent-focus">
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
              class="form-input rounded-md border w-full js-child-focus js-visible-password"
              name="{$field.name}"
              title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
              type="password"
              value=""
              pattern=".{literal}{{/literal}5,{literal}}{/literal}"
              {if $field.required}required{/if}
            >
            <span class="input-group-btn">
              <button
                class="btn btn-outline"
                type="button"
                data-action="show-password"
                data-text-show="{l s='Show' d='Shop.Theme.Actions'}"
                data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}"
              >
                {l s='Show' d='Shop.Theme.Actions'}
              </button>
            </span>
          </div>
        {/block}

      {else}

        {block name='form_field_item_other'}
          <input
            class="form-input rounded-md border"
            name="{$field.name}"
            type="{$field.type}"
            value="{$field.value}"
            {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
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
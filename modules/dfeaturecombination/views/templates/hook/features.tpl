{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2019 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

    <div class="panel product-tab-features">
        <h3>{l s='Assign features to this combination' mod='dfeaturecombination'}</h3>
        <div class="form-group">
            {*<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="description_short" type="tinymce" multilang="true"}</span></div>*}
            <label class="control-label col-lg-12 required" for="name_{$default_form_language|escape:'quotes':'UTF-8'}">
			<span class="label-tooltip" data-toggle="tooltip">
				{l s='Name' mod='dfeaturecombination'}
			</span>
            </label>
            <div class="col-lg-12">
                {include
                file= "`$tpl_fields`input_lang.tpl"
                languages=$languages
                input_name="name_`$id_product_attribute`"
                class="form-control"
                input_value=$name
                max=5024}
            </div>
        </div>
        <div class="form-group">
            {*<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="description_short" type="tinymce" multilang="true"}</span></div>*}
            <label class="control-label col-lg-12 required" for="description_short_{$default_form_language|escape:'quotes':'UTF-8'}">
			<span class="label-tooltip" data-toggle="tooltip">
				{l s='Description short' mod='dfeaturecombination'}
			</span>
            </label>
            <div class="col-lg-12">
                {include
                file= "`$tpl_fields`textarea_lang.tpl"
                languages=$languages
                input_name="description_short_`$id_product_attribute`"
                class="autoload_rte_s"
                input_value=$description_short
                max=5024}
            </div>
        </div>
        <div class="form-group">
            {*<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="description" type="tinymce" multilang="true"}</span></div>*}
            <label class="control-label col-lg-12 required" for="description_{$default_form_language|escape:'quotes':'UTF-8'}">
			<span class="label-tooltip" data-toggle="tooltip">
				{l s='Description' mod='dfeaturecombination'}
			</span>
            </label>
            <div class="col-lg-12">
                {include
                file= "`$tpl_fields`textarea_lang.tpl"
                languages=$languages
                input_name="description_`$id_product_attribute`"
                class="autoload_rte_s"
                input_value=$description
                max=5024}
            </div>
        </div>
        {if Feature::isFeatureActive()}
        <table class="table">
            <thead>
            <tr>
                <th><span class="title_box">{l s='Feature' mod='dfeaturecombination'}</span></th>
                <th><span class="title_box">{l s='Pre-defined value' mod='dfeaturecombination'}</span></th>
                <th><span class="title_box"><u>{l s='or' mod='dfeaturecombination'}</u> {l s='Customized value' mod='dfeaturecombination'}</span></th>
            </tr>
            </thead>

            <tbody>
            {foreach from=$available_features item=available_feature}
                <tr>
                    <td>{$available_feature.name|escape:'quotes':'UTF-8'}</td>
                    <td>
                        {if sizeof($available_feature.featureValues)}
                            <select data-select2 id="feature_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_value" multiple name="feature_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_value[]"
                                    onchange="clearCustomValue(this, '[class^=custom_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_]');">
{*                                <option value="0">---</option>*}
                                {foreach from=$available_feature.featureValues item=value}
                                    <option value="{$value.id_feature_value|escape:'quotes':'UTF-8'}"{if in_array($value.id_feature_value, $available_feature.current_item)}selected="selected"{/if} >
                                        {$value.value|truncate:40|escape:'quotes':'UTF-8'}
                                    </option>
                                {/foreach}
                            </select>
                        {else}
                            <input type="hidden" name="feature_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_value" value="0" />
                            <span>{l s='N/A' mod='dfeaturecombination'} -
						<a href="{$link->getAdminLink('AdminFeatures')|escape:'html':'UTF-8'}&amp;addfeature_value&amp;id_feature={$available_feature.id_feature}"
                           class="confirm_leave btn btn-link"><i class="icon-plus-sign"></i> {l s='Add pre-defined values first' mod='dfeaturecombination'} <i class="icon-external-link-sign"></i></a>
					</span>
                        {/if}
                    </td>
                    <td>

                        <div class="row lang-0" style='display: none;'>
                            <div class="col-lg-9">
                                <textarea class="custom_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_ALL textarea-autosize"	name="custom_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_ALL"
                                          cols="40" style='background-color:#CCF'	rows="1" onkeyup="{foreach from=$languages key=k item=language}$('.custom_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_{$language.id_lang|escape:'quotes':'UTF-8'}').val($(this).val());{/foreach}" >{$available_feature.val[1].value|escape:'html':'UTF-8'|default:""}</textarea>

                            </div>
                            {if $languages|count > 1}
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        {l s='ALL' mod='dfeaturecombination'}
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        {foreach from=$languages item=language}
                                            <li>
                                                <a href="javascript:void(0);" onclick="dfc_restore_lng($(this),{$language.id_lang|escape:'quotes':'UTF-8'});">{$language.iso_code|escape:'quotes':'UTF-8'}</a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                            {/if}
                        </div>

                        {foreach from=$languages key=k item=language}
                            {if $languages|count > 1}
                                <div class="row translatable-field lang-{$language.id_lang|escape:'quotes':'UTF-8'}">
                                <div class="col-lg-9">
                            {/if}
                            <textarea
                                    class="custom_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_{$language.id_lang|escape:'quotes':'UTF-8'} textarea-autosize"
                                    name="custom_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_{$language.id_lang|escape:'quotes':'UTF-8'}"
                                    cols="40"
                                    rows="1"
                                    onkeyup="clearFeatureValue('#feature_{$id_product_attribute|escape:'quotes':'UTF-8'}_{$available_feature.id_feature|escape:'quotes':'UTF-8'}_value');" >{$available_feature.val[$k].value|escape:'html':'UTF-8'|default:""}</textarea>

                            {if $languages|count > 1}
                                </div>
                                <div class="col-lg-3">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        {$language.iso_code|escape:'quotes':'UTF-8'}
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        {*<li><a href="javascript:void(0);" onclick="dfc_all_languages($(this));">{l s='ALL'}</a></li>*}
                                        {foreach from=$languages item=language}
                                            <li>
                                                <a href="javascript:hideOtherLanguage({$language.id_lang|escape:'quotes':'UTF-8'});">{$language.iso_code|escape:'quotes':'UTF-8'}</a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                </div>
                            {/if}
                        {/foreach}
                    </td>

                </tr>
                {foreachelse}
                <tr>
                    <td colspan="3" style="text-align:center;"><i class="icon-warning-sign"></i> {l s='No features have been defined' mod='dfeaturecombination'}</td>
                </tr>
            {/foreach}
            </tbody>
        </table>

        <a href="{$link->getAdminLink('AdminFeatures')|escape:'html':'UTF-8'}&amp;addfeature" class="btn btn-link confirm_leave button">
            <i class="icon-plus-sign"></i> {l s='Add a new feature' mod='dfeaturecombination'} <i class="icon-external-link-sign"></i>
        </a>
        {/if}
        <div class="panel-footer">
            <a onclick="cancelEditFeatures(this)" class="btn btn-default"><i class="process-icon-cancel"></i> {l s='Cancel' mod='dfeaturecombination'}</a>
            <button onclick="saveFeatures({$id_product_attribute|escape:'quotes':'UTF-8'}, this, false)" type="button" class="btn btn-default pull-right"><i class="process-icon-save"></i> {l s='Save' mod='dfeaturecombination'}</button>
            <button onclick="saveFeatures({$id_product_attribute|escape:'quotes':'UTF-8'}, this, true)" type="button" name="submitAddproduct" class="btn btn-default pull-right"><i class="process-icon-save"></i> {l s='Save and stay' mod='dfeaturecombination'}</button>
        </div>
    </div>

<script type="text/javascript">
    hideOtherLanguage({$default_form_language|escape:'quotes':'UTF-8'});
    {literal}
    if (typeof $.fn.autosize != 'undefined') {
        $(".textarea-autosize").autosize();
    }

    function dfc_all_languages(pos)
    {
        {/literal}
        {foreach from=$languages key=k item=language}
        pos.parents('td').find('.lang-{$language.id_lang|escape:'quotes':'UTF-8'}').addClass('nolang-{$language.id_lang|escape:'quotes':'UTF-8'}').removeClass('lang-{$language.id_lang|escape:'quotes':'UTF-8'}');
        {/foreach}
        pos.parents('td').find('.translatable-field').hide();
        pos.parents('td').find('.lang-0').show();
        {literal}
    }

    function dfc_restore_lng(pos,i)
    {
        {/literal}
        {foreach from=$languages key=k item=language}
        pos.parents('td').find('.nolang-{$language.id_lang|escape:'quotes':'UTF-8'}').addClass('lang-{$language.id_lang|escape:'quotes':'UTF-8'}').removeClass('nolang-{$language.id_lang|escape:'quotes':'UTF-8'}');
        {/foreach}
        {literal}
        pos.parents('td').find('.lang-0').hide();
        hideOtherLanguage(i);
    }

    /**function initCombiFeaturesRte() {
        tinySetup({
            editor_selector :"autoload_rte_s",
            setup : function(ed) {
                ed.on('init', function(ed)
                {
                    if (
                        typeof ProductMultishop != 'undefined' &&
                        typeof ProductMultishop.load_tinymce[ed.id] != 'undefined'
                    ) {
                        if (typeof ProductMultishop.load_tinymce[ed.id])
                            ed.hide();
                        else
                            ed.show();
                    }
                });

                ed.on('keydown', function(ed, e) {
                    tinyMCE.triggerSave();
                    textarea = $('#'+tinymce.activeEditor.id);
                    var max = textarea.parent('div').find('span.counter').data('max');
                    if (max != 'none')
                    {
                        count = tinyMCE.activeEditor.getBody().textContent.length;
                        rest = max - count;
                        if (rest < 0)
                            textarea.parent('div').find('span.counter').html('<span style="color:red;">{/literal}{l s='Maximum' mod='dfeaturecombination'}{literal} ' + max + ' {/literal}{l s='characters' mod='dfeaturecombination'}{literal} : ' + rest + '</span>');
                    else
                        textarea.parent('div').find('span.counter').html(' ');
                    }
                });
            }
        });
    }**/
</script>
{/literal}
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

<script id="dfc_success_message" type="text/html">
    <div class="alert alert-success dfc_success_message">
        <button type="button" class="close" data-dismiss="alert">×</button>
        {l s='Settings update successfull' mod='dfeaturecombination'}
    </div>
</script>
<script>
    var link_ajax = "{$link_ajax|escape:'quotes':'UTF-8'}";
    var id_product = {$id_product|intval};
</script>
<div class="panel product-tab">
    <h3>{l s='Add features combination' mod='dfeaturecombination'}</h3>
{*    <div id="panel col-lg-12">*}
{*        <div class="form-group clearfix">*}
{*            <label class="control-label col-lg-4">{l s='Import by' mod='dfeaturecombination'}:</label>*}
{*            <div class="col-lg-4">*}
{*                <select name="import_by">*}
{*                    <option value="id_product_attribute" selected>{l s='ID combination' mod='dfeaturecombination'}</option>*}
{*                    <option value="reference">{l s='Reference' mod='dfeaturecombination'}</option>*}
{*                </select>*}
{*            </div>*}
{*        </div>*}
{*        <div class="form-group clearfix">*}
{*            <label class="control-label col-lg-4">{l s='Select file' mod='dfeaturecombination'}:</label>*}
{*            <div class="col-lg-4">*}
{*                <input type="file" name="file_import">*}
{*            </div>*}
{*        </div>*}
{*        <div class="form-group clearfix">*}
{*            <label class="control-label col-lg-12">{l s='Format' mod='dfeaturecombination'}:</label>*}
{*            <div class="col-lg-12">*}
{*                <table class="table">*}
{*                    <tr>*}
{*                        <td>{l s='Type key' mod='dfeaturecombination'}</td>*}
{*                        <td>{l s='description::en(::en add optional)' mod='dfeaturecombination'}</td>*}
{*                        <td>{l s='description_short::en(::en add optional)' mod='dfeaturecombination'}</td>*}
{*                        <td>{l s='Feature 1' mod='dfeaturecombination'}</td>*}
{*                        <td>{l s='Feature 2' mod='dfeaturecombination'}</td>*}
{*                        <td>{l s='... N' mod='dfeaturecombination'}</td>*}
{*                    </tr>*}
{*                    <tr>*}
{*                        <td>20|reference</td>*}
{*                        <td>description html</td>*}
{*                        <td>description short html</td>*}
{*                        <td>value1,value2,value3</td>*}
{*                        <td>value1,value2,value3</td>*}
{*                        <td>value1,value2,value3</td>*}
{*                    </tr>*}
{*                </table>*}
{*            </div>*}
{*        </div>*}
{*        <div class="form-group clearfix">*}
{*            <div class="col-lg-12">*}
{*                <button type="button" data-import-features class="btn btn-success">*}
{*                    {l s='Import' mod='dfeaturecombination'}*}
{*                </button>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
    <div id="panel col-lg-12">
        <div class="table-responsive clearfix">
            <table class="table configuration">
                <thead>
                    <th>{l s='ID' mod='dfeaturecombination'}</th>
                    <th>{l s='Attribute - value (pair)' mod='dfeaturecombination'}</th>
                    <th></th>
                </thead>
                <tbody>
                    {if isset($combinations) && count($combinations)}
                        {foreach from=$combinations item=combination}
                            <tr class="row_combination">
                                <td>{$combination.id_product_attribute|escape:'quotes':'UTF-8'}</td>
                                <td>{$combination.value_attribute|escape:'quotes':'UTF-8'}</td>
                                <td>
                                    <div class="btn-group-action">
                                        <div class="btn-group pull-right">
                                            <button type="button" onclick="loadFeatures({$combination.id_product_attribute|intval}, this)" title="{l s='Edit' mod='dfeaturecombination'}" class="edit btn btn-default">
                                                <i class="icon-pencil"></i> {l s='Edit' mod='dfeaturecombination'}
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        {/foreach}
                    {else}
                        <tr>
                            <td colspan="3">{l s='No combinations' mod='dfeaturecombination'}</td>
                        </tr>
                    {/if}
                </tbody>
            </table>
        </div>
    </div>
</div>
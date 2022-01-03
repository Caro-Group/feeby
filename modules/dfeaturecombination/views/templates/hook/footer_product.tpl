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

{if isset($combinations) && count($combinations)}
    <div class="dfc_features_section hidden">
        {foreach from=$combinations item=combination}
            {if $combination.features && count($combination.features)}
                <div class="dfc_features_{$combination.id_product_attribute|intval} product-features">
                    {if !$ps_17}
                        <table class="table-data-sheet dfc_table">
                            {foreach from=$combination.features item=feature}
                            <tr>
                                <td>{$feature.feature|escape:'quotes':'UTF-8'}</td>
                                <td>{$feature.feature_value|escape:'quotes':'UTF-8'}</td>
                            </tr>
                            {/foreach}
                        </table>
                    {else}
                        <dl class="data-sheet dfc_table">
                            {foreach from=$combination.features item=feature}
                                <dt class="name">{$feature.feature|escape:'quotes':'UTF-8'}</dt>
                                <dd class="value">{$feature.feature_value|escape:'htmlall':'UTF-8'|nl2br nofilter}</dd>
                            {/foreach}
                        </dl>
                    {/if}
                </div>
            {/if}
        {/foreach}
    </div>
    <div class="dfc_description_section hidden">
        {foreach from=$combinations item=combination}
            {if $combination.description|strlen}
                <section class="dfc_description_{$combination.id_product_attribute|intval}">
                    {html_entity_decode($combination.description|escape:'htmlall':'UTF-8') nofilter}
                </section>
            {/if}
        {/foreach}
    </div>
    <div class="dfc_description_short_section hidden">
        {foreach from=$combinations item=combination}
            {if $combination.description_short|strlen}
                <section class="dfc_short_description_{$combination.id_product_attribute|intval}">
                    {html_entity_decode($combination.description_short|escape:'htmlall':'UTF-8') nofilter}
                </section>
            {/if}
        {/foreach}
    </div>
    <style>
        .dfc_not_visible
        {
            padding: 0;
            margin: 0;
            width: 0;
            height: 0;
            overflow: hidden;
        }
    </style>
    <script>
        var names = {
            'base': "{$product_name|escape:'htmlall':'UTF-8'}"
        };
        {foreach from=$combinations item=combination}
            names[{$combination.id_product_attribute|intval}] = "{$combination.name|escape:'htmlall':'UTF-8'}";
        {/foreach}
    </script>
{/if}
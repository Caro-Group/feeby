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

{if $options}
    <section class="page-product-box card">
        {if $show_title}
        <h3 class="page-product-heading">{l s='Data' mod='filterproductspro'}</h3>
        <hr>
        {/if}
        <div class="row">
            {foreach $options as $id_searcher => $options_name}
                <div class="searcher-tab-{$id_searcher|intval} col-xs-12 {if count($options) > 1} col-md-6 col-lg-6{else} col-md-12 col-lg-12{/if}" id="container_fpp_tab">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    {foreach $headers.$id_searcher as $header}
                                        <th class="text-center">{$header|escape:'htmlall':'UTF-8'}</th>
                                    {/foreach}
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $options_name as $content}
                                    <tr>
                                        {foreach $headers.$id_searcher as $id_filter => $header}
                                            {if isset($content.$id_filter) }
                                                <td>{$content.$id_filter|escape:'htmlall':'UTF-8'}</td>
                                            {else}
                                                <td>---</td>
                                            {/if}
                                        {/foreach}
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            {/foreach}
        </div>
    </section>
{/if}
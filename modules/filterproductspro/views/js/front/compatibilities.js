/**
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
 */

$(function(){
    $(document).on('fpp-executeSearch-success', function() {
        //compatibilidades con modulos y plantillas
        //---------------------------------------------------------------
        if ($('.ApMegamenu .popup-menu').length > 0) {
            $('.ApMegamenu .popup-menu').addClass('active');
        }

        if ($("#grid a").length > 0 && $("#list a").length > 0 && typeof setCookie !== typeof undefined && typeof getCookie !== typeof undefined) {
            $("#grid a").click(function(e) {
                $("#products").removeClass("active_list");
                $("#products").addClass("active_grid");
                setCookie('status_list_product', 'active_grid', 1);
            });
            $("#list a").click(function(e) {
                $("#products").removeClass("active_grid");
                $("#products").addClass("active_list");
                setCookie('status_list_product', 'active_list', 1);
            });
            if (getCookie('status_list_product')!=="" && getCookie('status_list_product') !== "active_grid") {
                $("#products").removeClass("active_grid");
                $("#products").addClass("active_list");
            }
        }

        //module supported: flsproducthoverinfo - v1.3.0 - FlicoSoft
        if (typeof load_products_data !== typeof undefined) {
            load_products_data();
        }

        if (typeof prestashop.stlazyloading !== typeof undefined) {
            prestashop.stlazyloading($('img.stlazyloadthis'));
        }

        if (typeof prestashop.prolazy !== typeof undefined) {
            prestashop.prolazy();
        }

        //theme supported: warehouse - v4.3.2
        if (typeof prestashop.iqitLazyLoad !== typeof undefined) {
            prestashop.iqitLazyLoad.update();
        }

        if (typeof $.LeoCustomAjax !== typeof undefined && $.isFunction($.LeoCustomAjax)) {
            var leoCustomAjax = new $.LeoCustomAjax();
            leoCustomAjax.processAjax();
        }

        if (typeof observer !== typeof undefined && typeof observer.observe !== undefined) {
            observer.observe();
        }

        if ($('.display').find('li.selected').length > 0 && typeof display !== typeof undefined) {
            display($('.display').find('li.selected').attr('id'));
        }
        //---------------------------------------------------------------
    });
});

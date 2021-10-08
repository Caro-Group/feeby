/**
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
 * @author    Goryachev Dmitry <dariusakafest@gmail.com>
 * @copyright 2012-2019 Goryachev Dmitry
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

window.oldFindCombination = window.findCombination;

window.findCombination = function(firstTime)
{
    oldFindCombination(firstTime);
    displayFeature();
    displayDescription();
    displayName();
    displayDescriptionShort();
};

if (typeof prestashop != 'undefined') {
    prestashop.on('updatedProduct', function (e) {
        initFeatures();
        displayFeature(e.id_product_attribute);
        displayDescription(e.id_product_attribute);
        displayName(e.id_product_attribute);
        displayDescriptionShort(e.id_product_attribute);
    });
}

function displayFeature(id_product_attribute)
{
    if (typeof id_product_attribute == 'undefined') {
        id_product_attribute = $('#idCombination').val();
    }

    $('[class^="dfc_features_"]').hide();
    var combination_feature = $('.dfc_features_'+id_product_attribute);

    var $elem_features = getElementBaseFeatures();

    if ($elem_features) {
        if (combination_feature.length) {
            combination_feature.show();
            $elem_features.closest('.product-features.dfc_feature_inited').show();
            $elem_features.not('.dfc_table').hide();
            $('.dfc_not_visible').removeClass('dfc_not_visible');
        } else {
            var table = $elem_features.not('.dfc_table');
            table.show();
            var td = table.find('tr td:first');
            if (String(td.text()).trim() == '{0}') {
                $elem_features.addClass('dfc_not_visible');

                var box = $elem_features.closest('.page-product-box');
                if (box.length) {
                    box.addClass('dfc_not_visible');
                }
            }

            var list = $elem_features.parent().find('.dfc_feature_inited');
            if (String(list.find('dt:first').text()).trim() == '{0}') {
                list.hide();
                list.closest('.product-features').hide();
            }
        }
    }

    $('.dfc_feature_inited').children('dt').filter(function() {
       return !$(".product-features .product-features .dfc_table dt:contains('" + $.trim($(this).text()) + "')").length
    }).each( function( ind, obj ) {
     $($( obj ).next().clone()).insertAfter(
      $($( obj ).clone()).insertAfter($(".product-features .product-features .dfc_table dd:last-child"))
     );
    });
}

function displayDescription(id_product_attribute)
{
    if (typeof id_product_attribute == 'undefined') {
        id_product_attribute = $('#idCombination').val();
    }

    $('[class^="dfc_description_"]').hide();

    var combination_description = $('.dfc_description_' + id_product_attribute);
    if (combination_description.length) {
        $('.dfc_description_base').hide();
        combination_description.show();
        $('[href="#description"]').parent().show().find('a').click();
    } else {
        if ($('.dfc_description_base').length) {
            if ($('.dfc_description_base').html()) {
                $('.dfc_description_base').show();
            } else {
                $('.dfc_description_base').hide();
                $('[href="#description"]').parent().hide().parent().find('li:visible a').click();
            }
        }
    }
}

function displayName(id_product_attribute) {
    if (typeof id_product_attribute == 'undefined') {
        id_product_attribute = $('#idCombination').val();
    }
    if (typeof names == 'undefined') {
        return;
    }

    if (typeof names[id_product_attribute] != 'undefined' && names[id_product_attribute]) {
        $('h1[itemprop="name"]').html(names[id_product_attribute]);
    } else {
        $('h1[itemprop="name"]').html(names['base']);
    }
}

function displayDescriptionShort(id_product_attribute)
{
    if (typeof id_product_attribute == 'undefined') {
        id_product_attribute = $('#idCombination').val();
    }

    $('[class^="dfc_short_description_"]').hide();

    var combination_description_short = $('.dfc_short_description_' + id_product_attribute);
    if (combination_description_short.length) {
        $('.dfc_description_short_base').hide();
        combination_description_short.show();
    } else {
        $('.dfc_description_short_base').show();
    }
}

function initFeatures() {
    var $elem_features = getElementBaseFeatures();
    if ($elem_features) {
        if ($elem_features.is('.dfc_feature_inited')) {
            return false;
        }
        $elem_features.after($('.dfc_features_section').html());
        $elem_features.addClass('dfc_feature_inited');
    }
    //$('.dfc_features_section').remove();
}

function getElementBaseFeatures() {
    var $elem_features = $('.page-product-box .table-data-sheet');
    if (!$elem_features.length) {
        //For ps 1.7
        $elem_features = $('.product-information .product-features .data-sheet');
    }

    if (!$elem_features.length) {
        //For 1.7
        $elem_features = $('#product-details .product-features .data-sheet')
    }
    if (!$elem_features.length) {
        //For 1.7
        $elem_features = $('#product-detail .product-features .data-sheet')
    }

    if (!$elem_features.length) {
        //For invalid theme in ps 1.7
        $elem_features = $('#main-product-wrapper .product-features .data-sheet');
    }

    if (!$elem_features.length) {
        //For invalid theme in ps 1.7
        $elem_features = $('.tab_content > .table-data-sheet');
    }

    if (!$elem_features.length) {
        //For ps 1.5 - 1.6
        if (!$('.dfc_tab_pane').length) {
            $elem_features = $('#tab-sheet');
            var id = $elem_features.attr('id');
            $elem_features.removeAttr('id');
            $elem_features.removeClass('tab-pane');
            var tab = $('<div id="'+id+'" class="tab-pane dfc_tab_pane"></div>');
            tab.html($elem_features.clone(true, true));
            $elem_features.replaceWith(tab);
            $elem_features = $('#tab-sheet > table');
        } else {
            $elem_features = $('#tab-sheet > table');
        }
    }

    return ($elem_features.length ? $elem_features : false);
}

$(document).ready(function () {
    $('.dfc_description_base').after($('.dfc_description_section').html());
    $('.dfc_description_section').remove();

    $('.dfc_description_short_base').after($('.dfc_description_short_section').html());
    $('.dfc_description_short_section').remove();

    initFeatures();

    if (!$('[data-product]').length && typeof prestashop == 'undefined') {
        displayDescription();
        displayFeature();
        displayDescriptionShort();
        displayName();
    } else {
        var product = $('[data-product]').data('product');
        displayDescription(product.id_product_attribute);
        displayFeature(product.id_product_attribute);
        displayDescriptionShort(product.id_product_attribute);
        displayName(product.id_product_attribute);
    }
});
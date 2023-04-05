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

var FPPInfScroll = {
    searching: false,
    page: false,
    id_product: false,
    pages_count: false,
    selectorProductList: '.products',
    observer_infinite_scroll: {},
    init: function() {
        FPPInfScroll.id_product = FPPInfScroll.getIdProduct();
        FPPInfScroll.page = FPPInfScroll.getPage();

        if (FPPInfScroll.page > 1) {
            FPPInfScroll.search({'page': 2});
        }

        FPPInfScroll.initEventsAfterSearching();
    },
    initEventsAfterSearching: function() {
        $('.js-search-link').unbind('click').on('click', FPPInfScroll.linkClick);

        $('#js-product-list ' + FPPInfScroll.selectorProductList + ' a:not(.quick-view)').on('click', function(e) {
            var id_product = $(e.currentTarget).parents('.js-product-miniature').data('idProduct');
            FPPInfScroll.setIdProduct(id_product);
            FPPInfScroll.setPage(FPPInfScroll.page);
        });

        if ($('#js-product-list-bottom').length > 0) {
            let options = {
                root: null,
                rootMargin: '0px',
                threshold: 1.0
            }
            FPPInfScroll.observer_infinite_scroll = new IntersectionObserver(
                FPPInfScroll.onObserverInfiniteScroll,
                options
            );
            FPPInfScroll.observer_infinite_scroll.observe(document.querySelector('#js-product-list-bottom'));
        }

        if (FPPInfScroll.id_product !== false && $('#js-product-list .js-product-miniature[data-id-product='+FPPInfScroll.id_product+']').length > 0) {
            $('html, body').animate({scrollTop: $('#js-product-list .js-product-miniature[data-id-product='+FPPInfScroll.id_product+']').offset().top }, 1000);
            FPPInfScroll.id_product = false;
        }
    },
    onObserverInfiniteScroll: function(entries, observer) {
        if (!FPPInfScroll.searching) {
            $.each(entries, function(i, entry) {
                if (entry.intersectionRatio > 0) {
                    var number_page = FPPInfScroll.page + 1;

                    if (FPPInfScroll.pages_count === false || number_page <= FPPInfScroll.pages_count) {
                        FPPInfScroll.page = number_page;
                        FPPInfScroll.search();
                    } else {
                        FPPInfScroll.observer_infinite_scroll.unobserve(entry.target);
                    }
                };
            });
        }
    },
    getPage: function() {
        var name_cookie = 'fpp_current_page_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        var fpp_current_page = $.totalStorageFPP(name_cookie);
        if (!$.isEmpty(fpp_current_page)) {
            $.totalStorageFPP.deleteItem(name_cookie);

            return fpp_current_page;
        }

        return 1;
    },
    setPage: function(page) {
        var name_cookie = 'fpp_current_page_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        $.totalStorageFPP(name_cookie, page);
        FPPInfScroll.page = page;
    },
    getIdProduct: function() {
        var name_cookie = 'fpp_id_product_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        var fpp_id_product = $.totalStorageFPP(name_cookie);
        if (!$.isEmpty(fpp_id_product)) {
            $.totalStorageFPP.deleteItem(name_cookie);

            return fpp_id_product;
        }

        return false;
    },
    setIdProduct: function(id_product) {
        var name_cookie = 'fpp_id_product_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        $.totalStorageFPP(name_cookie, id_product);
        FPPInfScroll.id_product = id_product;
    },
    linkClick: function(event) {
        event.stopPropagation();
        event.preventDefault();

        FPPInfScroll.page = 1;

        var params = {};

        var url = $(event.currentTarget).attr('href');
        if (!$.isEmpty(url)) {
            var url_split = url.split('?');
            if (url_split.length === 2) {
                var url_split_params = url_split[1].split('&');

                url_split_params.forEach( function(url_params) {
                    var params_tmp = url_params.split('=');
                    if (params_tmp.length === 2) {
                        var name = params_tmp[0];
                        var value = params_tmp[1];

                        if (name === 'productListView') {
                            params['from-xhr'] = true;
                        }

                        params[name] = value;
                    }
                });
            }
        }

        FPPInfScroll.search(params);
    },
    search: function(params) {
        var param = $.extend({}, {
            'token': prestashop.token,
            'url_call': prestashop.urls.current_url,
            'dataType': 'json',
            'page': FPPInfScroll.page,
            'order': false,
            'from-xhr': true
        }, params);

        if (param.order === false) {
            if ($('.js-search-link.current').length > 0) {
                var url = $('.js-search-link.current').attr('href');
                if (!$.isEmpty(url)) {
                    var url_split = url.split('?');
                    if (url_split.length === 2) {
                        var url_split_params = url_split[1].split('&');

                        url_split_params.forEach( function(url_params) {
                            var params_tmp = url_params.split('=');
                            if (params_tmp.length === 2) {
                                var name = params_tmp[0];
                                var value = params_tmp[1];

                                if (name === 'order') {
                                    param.order = value;
                                }
                            }
                        });
                    }
                }
            }
        }

        var pageOk = false;

        var _json = {
            data: param,
            beforeSend: function() {
                FPPInfScroll.searching = true;

                AppFPP.loading_big(true, FilterProductsPro.CONFIGS.FPP_COLUMN_NAME);
            },
            success: function(response) {
                //no se usa response.pagination.pages_count pues no es soporta en ciertas versiones de 1.7
                if (typeof response.pagination !== typeof undefined) {
                    pageOk = true;

                    var is_next_page = false;
                    $.each(response.pagination.pages, function(i, page){
                        if (page.type == 'page') {
                            FPPInfScroll.pages_count = page.page;
                            is_next_page = true;
                        }
                    });
                    if (is_next_page === false) {
                        FPPInfScroll.pages_count = 1;
                    }

                    if (typeof response.products !== typeof undefined && response.products.length > 0) {
                        var html = $('<div></div>').html(response.rendered_products).children();
                        $('#js-product-list-top').replaceWith(response.rendered_products_top);
                        if (param.page == 1) {
                            $('#js-product-list ' + FPPInfScroll.selectorProductList).html(html.find(FPPInfScroll.selectorProductList).html());
                        } else {
                            $('#js-product-list ' + FPPInfScroll.selectorProductList).append(html.find(FPPInfScroll.selectorProductList).html());
                        }
                        $('#js-product-list-bottom').replaceWith(response.rendered_products_bottom);
                        $('#js-product-list .pagination').hide();
                        $('#js-product-list-top .pagination').hide();
                        $('#js-product-list-bottom .pagination').hide();

                        FPPInfScroll.initEventsAfterSearching();
                    }
                }

                $(document).trigger('fpp-executeSearch-success', {});
            },
            complete: function() {
                if (pageOk) {
                    if (FPPInfScroll.page > param.page) {
                        FPPInfScroll.search({'page': param.page + 1});
                    }

                    FPPInfScroll.searching = false;
                }

                AppFPP.loading_big(false, FilterProductsPro.CONFIGS.FPP_COLUMN_NAME);

                $(document).trigger('fpp-executeSearch-complete', {});
            }
        };
        $.makeRequest(_json);
    }
};

$(function(){
    if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
        if (typeof AppFPP !== typeof undefined && !AppFPP.existsCookie()) {
            if ($('#js-product-list .js-product-miniature').length > 0) {
                FPPInfScroll.init();
            }
        }
    }
});
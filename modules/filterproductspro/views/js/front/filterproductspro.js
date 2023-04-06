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

$.expr[":"].icontains = $.expr.createPseudo(function(arg) {
    return function( elem ) {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
});

document.addEventListener("DOMContentLoaded", function(event) {
    if (history.scrollRestoration && FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
        history.scrollRestoration = 'manual';
    }
});

 var AppFPP = {
    searching: false,
    page: false,
    id_product: false,
    pages_count: false,
    button_mobile: true,
    current_controller: '',
    id_current_controller: 0,
    last_id_searcher: 0,
    optionsSelected: {},
    filterDependsOptions: {},
    observer_infinite_scroll: false,
    limiter_url: '#',
    $loading: '<div class="loading_big">'
        +'<div class="loader">'
        +'</div>'
    +'</div>',
    init: function (){
        AppFPP.current_controller = FilterProductsPro.current_controller;
        AppFPP.id_current_controller = FilterProductsPro.id_current_controller;
        AppFPP.page_name = FilterProductsPro.page_name;

        if (FilterProductsPro.CONFIGS.FPP_SHOW_FLOAT_BUTTON_MOBILE === "0"
            || (FilterProductsPro.CONFIGS.FPP_SHOW_FLOAT_BUTTON_MOBILE === "1"
                && FilterProductsPro.CONFIGS.FPP_DISABLE_FLOAT_BUTTON_MOBILE_HOME === "1"
                && typeof $('#index')[0] !== typeof undefined)
        ) {
            AppFPP.button_mobile = false;
        }

        if (!AppFPP.button_mobile) {
            $('.content-permanent-mobile').removeClass('content-permanent-mobile');
        }

        if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
            AppFPP.id_product = AppFPP.getIdProduct();
            AppFPP.page = AppFPP.getPage();
        }
    },
    initEvents: function(){
        $('.searcher-content[data-id_searcher]').each(function(key, searcher){
            var id_searcher = $(searcher).data().id_searcher;

            AppFPP.optionsSelected[id_searcher] = {'id_searcher': id_searcher};

            AppFPP.getSearcher({
                'id_searcher': id_searcher
            });
        });

        AppFPP.getSearcherButtonsMobile();
    },
    initEventsSearcher: function(params) {
        var param = $.extend({}, {
            id_searcher: false,
        }, params);

        if (param.id_searcher !== false) {
            $(document)
                .off('click', '.btn-selected-option')
                .on('click', '.btn-selected-option', AppFPP.removeOptionSelected);

            $('#btn_searcher_'+param.id_searcher).unbind('click').on('click', AppFPP.clickSearchButton);

            $(document)
                .off('click', '.btn-reset-filter')
                .on('click', '.btn-reset-filter', AppFPP.resetSearcher);

            $('#refresh_searcher_'+param.id_searcher).unbind('click').on('click', AppFPP.onClickRefresh);

            $('.searcher-content[data-id_searcher='+param.id_searcher+']').find('div[data-id_filter]').each(function(key, filter) {
                var filter_data = $(filter).data();
                var id_filter = filter_data.id_filter;
                var control_type = filter_data.control_type;

                switch(control_type) {
                    case FilterProductsPro.control_types.LIST:
                        $('select#filter_'+id_filter).unbind('change').on('change', AppFPP.clickOption);
                    break;
                    case FilterProductsPro.control_types.RADIO:
                    case FilterProductsPro.control_types.CHECK:
                        $('input[name="filter_'+id_filter+'"]')
                            .unbind('click')
                            .on('click', AppFPP.clickOption);
                        if (typeof $('#filter_'+id_filter).find('.filter-options-box')[0] !== typeof undefined) {
                            $('#filter_'+id_filter).find('.filter-options-box')
                                .on(
                                    'keyup',
                                    'input',
                                    {$parent: $('#filter_'+id_filter), type: control_type, filter: filter_data},
                                    AppFPP.onFilterOptions
                                );
                        }
                    break;
                    case FilterProductsPro.control_types.INPUT:
                        $('input[name="filter_'+id_filter+'"]').unbind('change').on('change', AppFPP.textInputChange)
                    break;
                    case FilterProductsPro.control_types.SLIDER:
                        var $priceFilter = $('#filter_price_'+id_filter);
                        if ($priceFilter.length > 0) {
                            AppFPP.initSlider($priceFilter, param.id_searcher, id_filter);
                        }
                    break;
                }
            });

            $(document).undelegate('#btn_view_results','click');
            $(document).on('click', '#btn_view_results' , function() {
                AppFPP.toggleSearcher('#content_permanent_mobile_'+$(this).data('togglesearcher'));

                if ($('#content-searchers-mobile').is(':visible')) {
                    AppFPP.toggleSearcher('#content-searchers-mobile');
                }

                window.scrollTo(0, $(FilterProductsPro.CONFIGS.FPP_COLUMN_NAME).offset().top);
            });
            $('.close-mobile-searcher').unbind('click').on('click', function() {
                AppFPP.toggleSearcher('#content_permanent_mobile_'+$(this).data('toggleSearcher'));
            });
        }
    },
    initEventsAfterSearching: function() {
        $('.js-search-link, .custom_pagination_span').unbind('click').on('click', AppFPP.linkClick);
        $('#select-sort-order').unbind('change').on('change', AppFPP.linkClick);

        $('#js-product-list .products a:not(.quick-view)').on('click', function(e) {
            if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
                var id_product = $(e.currentTarget).parents('.js-product-miniature').data('idProduct');
                AppFPP.setIdProduct(id_product);
                AppFPP.setPage(AppFPP.page);
            }
            if (FilterProductsPro.CONFIGS.FPP_ENABLE_COOKIES) {
                AppFPP.setCookie();
            }
        });

        if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
            if ($('#js-product-list-bottom').length > 0) {
                let options = {
                    root: null,
                    rootMargin: '0px',
                    threshold: 1.0
                }
                AppFPP.observer_infinite_scroll = new IntersectionObserver(
                    AppFPP.onObserverInfiniteScroll,
                    options
                );
                AppFPP.observer_infinite_scroll.observe(document.querySelector('#js-product-list-bottom'));
            }
            if (AppFPP.id_product !== false && $('#js-product-list .js-product-miniature[data-id-product='+AppFPP.id_product+']').length > 0) {
                $("html, body").animate({scrollTop: $('#js-product-list .js-product-miniature[data-id-product='+AppFPP.id_product+']').offset().top}, 1000);
                AppFPP.id_product = false;
            }
        } else {
            var $product_list = $(FilterProductsPro.CONFIGS.FPP_COLUMN_NAME+' #products');
            if ($product_list.length > 0) {
                $("html, body").animate({scrollTop: $product_list.offset().top}, 1000);
            }
        }
    },
    getPage: function() {
        var name_cookie = 'fpp_result_current_page_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        var fpp_current_page = $.totalStorageFPP(name_cookie);
        if (!$.isEmpty(fpp_current_page)) {
            $.totalStorageFPP.deleteItem(name_cookie);

            return fpp_current_page;
        }

        return 1;
    },
    setPage: function(page) {
        var name_cookie = 'fpp_result_current_page_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        $.totalStorageFPP(name_cookie, page);
        AppFPP.page = page;
    },
    getIdProduct: function() {
        var name_cookie = 'fpp_result_id_product_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        var fpp_id_product = $.totalStorageFPP(name_cookie);
        if (!$.isEmpty(fpp_id_product)) {
            $.totalStorageFPP.deleteItem(name_cookie);

            return fpp_id_product;
        }

        return false;
    },
    setIdProduct: function(id_product) {
        var name_cookie = 'fpp_result_id_product_' + FilterProductsPro.current_controller + '_' + FilterProductsPro.id_current_controller;
        $.totalStorageFPP(name_cookie, id_product);
        AppFPP.id_product = id_product;
    },
    onObserverInfiniteScroll: function(entries, observer) {
        if (!AppFPP.searching) {
            $.each(entries, function(i, entry) {
                if (entry.intersectionRatio > 0) {
                    var number_page = AppFPP.page + 1;

                    if (AppFPP.pages_count === false || number_page <= AppFPP.pages_count) {
                        AppFPP.page = number_page;
                        AppFPP.executeSearch({
                            'id_searcher': AppFPP.last_id_searcher,
                            'page': number_page
                        });
                    } else {
                        AppFPP.observer_infinite_scroll.unobserve(entry.target);
                    }
                };
            });
        }
    },
    onClickRefresh: function(event) {
        var id_searcher = parseInt($(event.currentTarget).data('id_searcher'));
        if (id_searcher > 0) {
            if (FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL) {
                AppFPP.generateSearcherUrl(id_searcher);
            }
            AppFPP.executeSearch({'id_searcher': id_searcher});
            // if ($(window).width() <= 992) {
            //     AppFPP.toggleSearcher('#content_permanent_mobile_'+parseInt($(event.currentTarget).data('id_searcher')));
            // }
        }
    },
    initSlider: function (container,id_searcher,id_filter){
        var min_price = parseInt($(container).data('min'));
        var max_price = parseInt($(container).data('max'));
        var min_selected = parseInt($('#min_price_' + id_filter).val());
        var max_selected = parseInt($('#max_price_' + id_filter).val());
        var slider = container[0];

        if (min_price === max_price){
            max_price += 1;
        }

        noUiSlider.create(slider,{
            start: [min_selected,max_selected],
            step: 1,
            margin: 1,
            range: {
                min: min_price,
                max: max_price
            }
        });

        slider.noUiSlider.on('update',function (values, handle){
            $('#min_price_' + id_filter).val(parseInt(values[0]));
            $('#max_price_' + id_filter).val(parseInt(values[1]));
        });

        slider.noUiSlider.on('change',function (values, handle){
            AppFPP.setSliderValues(id_searcher, id_filter, values[0], values[1]);
        });

        $('#min_price_' + id_filter).on('blur', function (event) {
            var min_value = parseInt($(event.currentTarget).val());
            var max_value = parseInt($('#max_price_' + id_filter).val());

            if (min_value > max_value){
                slider.noUiSlider.set([max_value - 1,null]);
            } else {
                slider.noUiSlider.set([min_value,null]);
            }
            if (!AppFPP.optionsSelected.hasOwnProperty(id_searcher)){
                AppFPP.optionsSelected[id_searcher] = {id_searcher: id_searcher,filter_depends: {}};
            }
            AppFPP.setSliderValues(id_searcher,id_filter,slider.noUiSlider.get()[0],slider.noUiSlider.get()[1]);
        });

        $('#max_price_' + id_filter).on('blur', function (event) {
            var max_value = parseInt($(event.currentTarget).val());
            var min_value = parseInt($('#min_price_' + id_filter).val());

            if (max_value < min_value){
                slider.noUiSlider.set([null,min_value + 1]);
            } else {
                slider.noUiSlider.set([null,max_value]);
            }
            AppFPP.setSliderValues(id_searcher,id_filter,slider.noUiSlider.get()[0],slider.noUiSlider.get()[1]);
        });
    },
    setSliderValues: function(id_searcher, id_filter, min_value, max_value) {
        if (!AppFPP.optionsSelected.hasOwnProperty(id_searcher)) {
            AppFPP.optionsSelected[id_searcher] = {id_searcher: id_searcher, filter_depends:{}};
        }

        AppFPP.last_id_searcher = id_searcher;
        AppFPP.optionsSelected[id_searcher][id_filter] = {
            min_value: min_value,
            max_value: max_value
        };

        AppFPP.getSearcher({
            'id_searcher' : id_searcher,
            'execute_searcher': FilterProductsPro.instant_search[id_searcher] == 1 ? true : false
        });
    },
    textInputChange: function(event){
        var data = $(event.currentTarget).data();

        if (!AppFPP.optionsSelected.hasOwnProperty(data.id_searcher)) {
            AppFPP.optionsSelected[data.id_searcher] = {id_searcher: data.id_searcher, filter_depends:{}};
        }

        if (!AppFPP.optionsSelected[data.id_searcher].hasOwnProperty(data.id_filter)) {
            AppFPP.optionsSelected[data.id_searcher][data.id_filter] = {};
        }

        AppFPP.processOptionSelected({
            'id_searcher': data.id_searcher,
            'id_filter': data.id_filter,
            'id_option': '',
            'control_type': FilterProductsPro.control_types.INPUT
        });
    },
    linkClick: function(event) {
        if (AppFPP.last_id_searcher == 0){
            return;
        }

        event.stopPropagation();
        event.preventDefault();

        AppFPP.page = 1;

        var params = {
            'id_searcher': AppFPP.last_id_searcher,
        }

        var url = $(event.currentTarget).attr('href');

        if ($(event.currentTarget).is('select')) {
            url = $(event.currentTarget).val();
        }

        if (!$.isEmpty(url)) {
            var url_split = url.split('?');
            if (url_split.length === 2) {
                var url_split_params = url_split[1].split('&');

                url_split_params.forEach( function(url_params) {
                    var params_tmp = url_params.split('=');
                    if (params_tmp.length === 2) {
                        var name = params_tmp[0];
                        var value = params_tmp[1];

                        if (name === 'page') {
                            if (value > 0) {
                                params.page = value;
                            }
                        } else {
                            if (name === 'productListView') {
                                params['from-xhr'] = true;
                            }

                            params[name] = value;
                        }
                    }
                });
            }
        }

        AppFPP.executeSearch(params);
    },
    removeOptionSelected: function(event) {
        var option_data = $(event.currentTarget).data();
        var input;
        if (option_data.control_type == FilterProductsPro.control_types.CHECK) {
            input = $('input[value="'+option_data.id_option+'"]');
            if (input.length > 0 && input.is(':checked')) {
                input.trigger('click');
                return;
            }
        } else if (option_data.control_type == FilterProductsPro.control_types.LIST) {
            $('select#filter_'+option_data.id_filter).val('-1').trigger('change');
            return;
        }

        //como los radio button no se pueden des-seleccionar, lo forzamos.
        if (option_data.control_type == FilterProductsPro.control_types.RADIO || option_data.control_type == FilterProductsPro.control_types.SLIDER) {
            option_data.id_option = '-1';
        }

        AppFPP.processOptionSelected({
            'id_searcher': option_data.id_searcher,
            'id_filter': option_data.id_filter,
            'id_option': option_data.id_option,
            'control_type': option_data.control_type
        });
    },
    clickSearchButton: function(event) {
        var id_searcher = $(event.currentTarget).data('id_searcher');
        /* Ocultar buscador y contenedor al buscar */
        // if ($(window).width() < 992 && AppFPP.button_mobile) {
        //     AppFPP.toggleSearcher('#content_permanent_mobile_'+id_searcher);

        //     if ($('#content-searchers-mobile').is(':visible')) {
        //         AppFPP.toggleSearcher('#content-searchers-mobile');
        //     }
        // }
        /* Fin Ocultar buscador y contenedor al buscar */

        AppFPP.executeSearch({
            'id_searcher': id_searcher,
            'page': 1
        });
    },
    onFilterOptions: function(event) {
        var expr = $(event.currentTarget).val();
        if ($.isEmpty(expr))
            event.data.$parent.find('.filter-options-content > .content-to-scroll > div').show();
        else {
            event.data.$parent.find('.filter-options-content > .content-to-scroll > div > label:icontains('+expr+')').parent().show();
            event.data.$parent.find('.filter-options-content > .content-to-scroll > div > label:not(:icontains('+expr+'))').parent().hide();
        }
    },
    clickOption: function(event){
        var option_data = $(event.currentTarget).data();
        var option_val = $(event.currentTarget).val();
        var filter_depends = 0;
        var sort = -1;

        if (!AppFPP.optionsSelected.hasOwnProperty(option_data.id_searcher)) {
            AppFPP.optionsSelected[option_data.id_searcher] = {id_searcher: option_data.id_searcher, filter_depends:{}};
        }
        if (!AppFPP.optionsSelected[option_data.id_searcher].hasOwnProperty(option_data.id_filter)) {
            AppFPP.optionsSelected[option_data.id_searcher][option_data.id_filter] = {};
        }

        if ($(event.currentTarget).is('select')) {
            filter_depends = parseInt(option_data.filter_depends);
            sort = parseInt(option_data.sort);
        }

        AppFPP.page = 1;

        AppFPP.processOptionSelected({
            'id_searcher': option_data.id_searcher,
            'id_filter': option_data.id_filter,
            'id_option': option_val,
            'control_type': option_data.control_type,
            'filter_depends': filter_depends,
            'sort': sort
        });
    },
    getSearcher: function(params) {
        var param = $.extend({}, {
            id_searcher: 0,
            execute_searcher: false
        }, params);

        var data = {};

        var url_options = '';
        if (FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL) {
            var url = document.URL;
            if (url.indexOf(AppFPP.limiter_url) !== -1){
                var parts_url = url.split(AppFPP.limiter_url);
                if (parts_url.length > 0){
                    url_options = decodeURIComponent(parts_url[1]);
                }
            }
        }
        data.url_options = url_options;

        if (FilterProductsPro.CONFIGS.FPP_ENABLE_COOKIES && $.isEmpty(url_options)) {
            if (AppFPP.existsCookie()) {
                param.execute_searcher = true;
            }
            AppFPP.setSearchersFromCookie();
        }

        var searcher = AppFPP.optionsSelected[param.id_searcher];

        data.searcher = searcher;
        if (AppFPP.filterDependsOptions.hasOwnProperty(param.id_searcher)) {
            data.filter_depends_options = AppFPP.filterDependsOptions[param.id_searcher];
        }
        data.current_controller = FilterProductsPro.current_controller;
        data.id_current_controller = FilterProductsPro.id_current_controller;
        data.page_name = FilterProductsPro.page_name;
        data.query = FilterProductsPro.query;
        data.store = AppFPP.getMarketPlaceStore();

        var params_request = {
            action: 'getSearcherRequest',
            token: FilterProductsPro.fpp_static_token,
            url_call: FilterProductsPro.actions_filterproductspro + AppFPP.getExtraParamsURL(FilterProductsPro.actions_filterproductspro),
            dataType: 'json',
            params: data
        };
        $.makeRequest({
            data: params_request,
            beforeSend: function (){
                AppFPP.loading_big(true, '#searcher_'+param.id_searcher);
            },
            success: function (response) {
                if (response.options_selected) {
                    AppFPP.optionsSelected = response.options_selected;
                    param.execute_searcher = true;

                    AppFPP.last_id_searcher = param.id_searcher;
                }

                var $tmp_searcher = $('<div>').append(response.html).find('#searcher_'+param.id_searcher);
                $('#searcher_'+param.id_searcher).replaceWith($tmp_searcher);

                var selector = '#searcher_'+param.id_searcher+' select[id^="filter_"][data-filter_depends="1"]';
                if ($(selector).length > 0) {
                    while(true){
                        var last_enabled = $(selector + ':enabled').last();
                        if (last_enabled.val() != '-1'){
                            var first_disabled = $(selector + ':not(:enabled)').first();
                            if (first_disabled.length == 0) {
                                break;
                            } else {
                                first_disabled.prop('disabled', false);
                            }
                        } else {
                            break;
                        }
                    }
                }
                if (FilterProductsPro.instant_search[param.id_searcher] == 0) {
                    if (AppFPP.hasOptionsSelected(param.id_searcher)) {
                        $('#btn_searcher_'+param.id_searcher).removeAttr("disabled");
                    } else {
                        AppFPP.disableSearchButtons();
                    }
                }
            },
            complete: function (){
                AppFPP.initEventsSearcher({'id_searcher': param.id_searcher});
                var option_selected = false;

                // if ($(window).width() < 992) {
                //     for (var id_searcher in AppFPP.optionsSelected) {
                //         if (!AppFPP.optionsSelected.hasOwnProperty(id_searcher)) continue;
                //         for (var id_filter in AppFPP.optionsSelected[id_searcher]) {
                //             if (!AppFPP.optionsSelected[id_searcher].hasOwnProperty(id_filter)) continue;
                //             if (id_filter == 'filter_depends' || id_filter == 'id_searcher') continue;
                //             option_selected = true;
                //         }
                //     }

                //     var $searcher = $('#searcher_' + param.id_searcher);

                //     if (option_selected){
                //         $searcher.find('.searcher-footer').show();
                //     } else {
                //         $searcher.find('.searcher-footer').hide();
                //     }
                // }

                if (FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL && FilterProductsPro.CONFIGS.FPP_ENABLE_COOKIES && AppFPP.hasOptionsSelected(param.id_searcher)) {
                    AppFPP.generateSearcherUrl(param.id_searcher);
                }

                if (param.execute_searcher) {
                    AppFPP.executeSearch({'id_searcher': param.id_searcher, 'loading': false, 'page': 1});
                }

                $(document).trigger('fpp-loaded', {})

                // if (!AppFPP.button_mobile && $(window).width() < 992) {
                //     AppFPP.addCollapseToSearcherWithoutFloatButton(param.id_searcher);

                //     if (option_selected){
                //         $('#searcher_'+param.id_searcher).find('.searcher-header').trigger('click');
                //     }
                // }
            },
            error: function (err){
                window.console.log(err);
            }
        });
    },
    getSearcherButtonsMobile: function () {
        if (AppFPP.button_mobile) {
            var searchers = new Array();
            $('div.fpp_searchers div[id^=searcher_]').each(function(){
                searchers.push({
                    "id_searcher": $(this).data('id_searcher'),
                    "name": $(this).find('.searcher-header span').text()
                });
            });

            if (searchers.length < 1) {
                return false;
            } else {
                var icon_searchers = $('<div id="icon-searchers-mobile" class="hidden-dt">');
                icon_searchers.append('<i class="fa-pts fa-pts-filter"></i>');

                if (searchers.length == 1) {
                    icon_searchers.attr('data-id_searcher', searchers[0].id_searcher)
                } else {
                    var params = {
                        action: 'getSearcherButtonsMobile',
                        token: FilterProductsPro.fpp_static_token,
                        url_call: FilterProductsPro.actions_filterproductspro,
                        dataType: 'json',
                        params: searchers
                    };
                    $.makeRequest({
                        data: params,
                        success: function (response){
                            $('#content-searchers-mobile .searcher-body').append(response.html);

                            $('.btn-toggle-searcher').unbind('click').on('click', function() {
                                AppFPP.toggleSearcher('#content_permanent_mobile_'+$(this).data('toggleSearcher'));
                            });
                        }
                    });
                }

                icon_searchers.insertBefore('#content-searchers-mobile');

                $('#icon-searchers-mobile, .close-content-searcher-mobile').unbind('click').on('click', function() {
                    if (typeof $(this).attr('data-id_searcher') !== typeof undefined && $(this).attr('data-id_searcher') !== '') {
                        AppFPP.toggleSearcher('#content_permanent_mobile_'+$(this).attr('data-id_searcher'));
                    } else {
                        AppFPP.toggleSearcher('#content-searchers-mobile');
                    }
                });
            }
        }
    },
    addCollapseToSearcherWithoutFloatButton: function(id_searcher) {
        var searcher = $('#searcher_'+id_searcher);

        searcher.find('.close-mobile-searcher, .refresh-mobile-searcher').hide();
        searcher.find('.icon-collapse').show();
        searcher.find('.searcher-header')
            .attr('data-toggle','collapse')
            .attr('data-target', '#searcher_body_'+id_searcher)
            .attr('aria-expanded', 'false');

        searcher.find('.searcher-body')
            .prop('id', 'searcher_body_'+id_searcher)
            .addClass('collapse');

        if (FilterProductsPro.instant_search[id_searcher] == 1) {
            searcher.find('.searcher-footer').hide();
        }

        searcher.on('click','.searcher-header', function() {
            if (searcher.find('.icon-collapse').hasClass('fa-pts-angle-down')) {
                searcher.find('.icon-collapse')
                    .removeClass('fa-pts-angle-down')
                    .addClass('fa-pts-angle-up');
                if (AppFPP.button_mobile) {
                    searcher.find('.searcher-footer').slideDown(100);
                }
            } else {
                searcher.find('.icon-collapse')
                    .removeClass('fa-pts-angle-up')
                    .addClass('fa-pts-angle-down');
                searcher.find('.searcher-footer')
                    .slideUp(100);
            }
        });
    },
    executeSearch: function(params){
        var param = $.extend({}, {
            'token': FilterProductsPro.fpp_static_token,
            'dataType': 'json',
            'fpp_params': {},
            'id_searcher': 0,
            'url_call': FilterProductsPro.search_filterproductspro + AppFPP.getExtraParamsURL(FilterProductsPro.actions_filterproductspro),
            'loading': true,
            'page': AppFPP.page,
            'order': false
        }, params);

        if (AppFPP.optionsSelected.hasOwnProperty(param.id_searcher)){
            param.fpp_params.searcher = AppFPP.optionsSelected[param.id_searcher];
        } else {
            return;
        }

        if (FilterProductsPro.instant_search[param.id_searcher] == 0 && FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL && FilterProductsPro.CONFIGS.FPP_SEARCH_RESULTS_APAGE && !$.strpos(window.location.search, 'FPPSRA')) {
            var url_new_page = window.location.origin + window.location.pathname + '?FPPSRA=1' + window.location.hash;
            var win = window.open(url_new_page, '_blank');
            win.focus();
            return;
        }

        param.fpp_params.current_controller = FilterProductsPro.current_controller;
        param.fpp_params.page_name = FilterProductsPro.page_name;
        param.fpp_params.id_current_controller = FilterProductsPro.id_current_controller;
        param.fpp_params.query = FilterProductsPro.query;
        param.fpp_params.store = AppFPP.getMarketPlaceStore();

        if (param.order === false) {
            var url = $('.js-search-link.current.select-list').attr('href');
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

        $.makeRequest({
            data: param,
            beforeSend: function () {
                AppFPP.searching = true;

                if (param.loading) {
                    AppFPP.loading_big(true, '#searcher_'+param.id_searcher);
                }
                AppFPP.loading_big(true, FilterProductsPro.CONFIGS.FPP_COLUMN_NAME);

                $(document).trigger('fpp-executeSearch-beforeSend', {});
            },
            success: function (response) {
                //no se usa response.pagination.pages_count pues no es soporta en ciertas versiones de 1.7
                if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
                    var is_next_page = false;
                    $.each(response.pagination.pages, function(i, page){
                        if (page.type == 'page') {
                            AppFPP.pages_count = page.page;
                            is_next_page = true;
                        }
                    });
                    if (is_next_page === false) {
                        AppFPP.pages_count = 1;
                    }
                }

                if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL && param.page > 1) {
                    if (AppFPP.id_product === false) {
                        $('html, body').animate({
                            scrollTop: $(window).scrollTop(),
                        }, {
                            duration: 1000,
                            start: function(){
                                $('body').addClass('overflow-hidden');
                            },
                            complete: function(){
                                $('body').removeClass('overflow-hidden');
                            }
                        });
                    }

                    var html = $('<div></div>').html(response.rendered_products).children();
                    $('#js-product-list-top').replaceWith(response.rendered_products_top);
                    $('#js-product-list .products').append(html.find('.products').html());
                    $('#js-product-list-bottom').replaceWith(response.rendered_products_bottom);
                    $('#js-product-list .pagination').hide();
                    $('#js-product-list-top .pagination').hide();
                    $('#js-product-list-bottom .pagination').hide();

                    AppFPP.initEventsAfterSearching();

                    $(document).trigger('fpp-executeSearch-success', {});

                    return;
                }

                if (FilterProductsPro.CONFIGS.FPP_THEME_COMPATIBILITY || $('#js-product-list').length <= 0 ||
                    !(FilterProductsPro.current_controller == 'category'
                        || FilterProductsPro.current_controller == 'supplier'
                        || FilterProductsPro.current_controller == 'manufacturer'
                        || FilterProductsPro.current_controller == 'bestsales'
                        || FilterProductsPro.current_controller == 'newproducts'
                        || FilterProductsPro.current_controller == 'pricesdrop'
                    )
                ) {
                    AppFPP.removeSections();
                    var container = $(FilterProductsPro.CONFIGS.FPP_COLUMN_NAME).children();
                    if (container.length == 1 && container.is('div')) {
                        container = container.children();
                    }

                    var placed_filter = false;

                    $.each(container, function(i, item){
                        if ($(item).find('.fpp_searchers').length > 0) {
                            var sections = $(item).children();
                            $.each(sections, function(j, section){
                                if (!$(section).find('.fpp_searchers') || $(section).find('.searcher-content').data('id_searcher') != param.id_searcher) {
                                    $(section).remove();
                                }
                            });
                            $(item).append(response.rendered_products);
                            placed_filter = true;
                        } else {
                            if (!$(item).find('.fpp_searchers') || $(item).find('.searcher-content').data('id_searcher') != param.id_searcher) {
                                $(item).remove();
                            }
                        }
                    });

                    if (!placed_filter) {
                        $(FilterProductsPro.CONFIGS.FPP_COLUMN_NAME).append(response.render);
                    }
                }

                prestashop.emit('updateProductList', response);

                AppFPP.initEventsAfterSearching();

                $(document).trigger('fpp-executeSearch-success', {});
            },
            complete: function() {
                if (FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
                    if (param.page !== false && AppFPP.page > param.page) {
                        param.page += 1;
                        AppFPP.executeSearch(param);

                        return;
                    }
                }

                AppFPP.searching = false;

                AppFPP.loading_big(false, $('#searcher_'+param.id_searcher));
                AppFPP.loading_big(false, FilterProductsPro.CONFIGS.FPP_COLUMN_NAME);

                /*if (!FilterProductsPro.CONFIGS.FPP_INFINITE_SCROLL) {
                    $("html, body").animate({scrollTop: $(FilterProductsPro.CONFIGS.FPP_COLUMN_NAME).offset().top}, 500);
                }*/

                AppFPP.removeSections();
                // if ($(document).width() < 992 && AppFPP.button_mobile) {
                //     if (AppFPP.hasOptionsSelected(param.id_searcher)) {
                //         $('#mobile_selected_option').remove();
                //         $('<div\>')
                //             .attr('id', 'mobile_selected_option')
                //             .addClass('pts row')
                //             .insertBefore('#js-product-list-top');
                //         /*Eliminar opciones seleccionadas para poner las nuevas clonandolas*/
                //         $('#mobile_selected_option').children().remove();
                //         $('#options_selected_' + param.id_searcher).clone().appendTo('#mobile_selected_option');
                //     } else {
                //         $('#mobile_selected_option').remove();
                //     }
                // }

                $(document).trigger('fpp-executeSearch-complete', {});
            }
        });
    },
    processOptionSelected: function (params){
        var param = $.extend({}, {
            id_searcher: 0,
            id_filter: 0,
            id_option: 0,
            control_type: '',
            filter_depends: 0,
            sort: -1
        }, params);

        var index_selected;
        var add_option = false;
        var input;
        if (param.control_type == FilterProductsPro.control_types.CHECK) {
            index_selected = AppFPP.generateIndex(param.id_searcher, param.id_filter, param.id_option);
            input = $('input[value="'+param.id_option+'"]');
            if (input.length > 0) {
                add_option = $('input[value="'+param.id_option+'"]').is(':checked');
            } else {
                add_option = false;
            }
        } else if (param.control_type == FilterProductsPro.control_types.INPUT) {
            index_selected = AppFPP.generateIndex(param.id_searcher, param.id_filter, 0);
            input = $('input#filter_'+param.id_filter);
            if (input.val() == '') {
                add_option = false;
            } else {
                param.id_option = input.val();
                add_option = true;
            }
        } else {
            index_selected = AppFPP.generateIndex(param.id_searcher, param.id_filter, 0);
            if (param.filter_depends == 1) {
                if (param.id_option == '-1') {
                    Object.keys(AppFPP.optionsSelected[param.id_searcher]['filter_depends']).forEach(function(key) {
                        if (AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key]['sort'] >= param.sort) {
                            AppFPP.deleteOptionSelected({
                                'id_searcher': param.id_searcher,
                                'id_filter': param.id_filter,
                                'index_selected': AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key]['index'],
                                'is_depend': true
                            });
                            delete AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key];
                        }
                    });
                } else {
                    if (AppFPP.optionsSelected[param.id_searcher].hasOwnProperty('filter_depends')) {
                        Object.keys(AppFPP.optionsSelected[param.id_searcher]['filter_depends']).forEach(function(key) {
                            if (AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key]['sort'] > param.sort) {
                                AppFPP.deleteOptionSelected({
                                    'id_searcher': param.id_searcher,
                                    'id_filter': param.id_filter,
                                    'index_selected': AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key]['index'],
                                    'is_depend': true
                                });
                                delete AppFPP.optionsSelected[param.id_searcher]['filter_depends'][key];
                            }
                        });
                    } else {
                        AppFPP.optionsSelected[param.id_searcher]['filter_depends'] = {};
                    }
                    AppFPP.optionsSelected[param.id_searcher]['filter_depends'][param.id_filter] = {
                        'id_option': param.id_option,
                        'sort': param.sort,
                        'index': index_selected,
                    };
                }
            }
            add_option = (param.id_option == '-1') ? false : true;
        }
        if (add_option){
            if (param.control_type == FilterProductsPro.control_types.INPUT) {
                AppFPP.optionsSelected[param.id_searcher][param.id_filter][index_selected] = param.id_option;
            } else {
                AppFPP.optionsSelected[param.id_searcher][param.id_filter][index_selected] = parseInt(param.id_option);
            }
        } else {
            AppFPP.deleteOptionSelected({
                'id_searcher': param.id_searcher,
                'id_filter': param.id_filter,
                'index_selected': index_selected
            });
        }

        if (FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL) {
            AppFPP.generateSearcherUrl(param.id_searcher);
        }

        AppFPP.last_id_searcher = param.id_searcher;

        var execute_searcher = false;
        if (FilterProductsPro.instant_search[param.id_searcher] == 1) {
            execute_searcher = true;
        }

        AppFPP.getSearcher({
            'id_searcher' : param.id_searcher,
            'execute_searcher': execute_searcher
        });
    },
    generateIndex: function(id_searcher, id_filter, id_option) {
        return id_searcher + '_' + id_filter + '_' + id_option;
    },
    deleteOptionSelected: function(params) {
        var param = $.extend({}, {
            id_searcher: 0,
            id_filter: 0,
            index_selected: 0,
            is_depend: false,
        }, params);

        if (param.is_depend) {
            /* Se asume que los filtros dependientes solamente podrian tener una opcion por eso se elimina de esta forma*/
            Object.keys(AppFPP.optionsSelected[param.id_searcher]).forEach(function(key){
                if(key != 'id_searcher' && AppFPP.optionsSelected[param.id_searcher][key].hasOwnProperty(param.index_selected)){
                    delete AppFPP.optionsSelected[param.id_searcher][key][param.index_selected];
                }
            });
        } else if (AppFPP.optionsSelected[param.id_searcher][param.id_filter].hasOwnProperty(param.index_selected)) {
            delete AppFPP.optionsSelected[param.id_searcher][param.id_filter][param.index_selected];
            if (Object.keys(AppFPP.optionsSelected[param.id_searcher][param.id_filter]).length === 0) {
                delete AppFPP.optionsSelected[param.id_searcher][param.id_filter];
            }
        } else if (AppFPP.optionsSelected[param.id_searcher][param.id_filter].hasOwnProperty('min_value') && AppFPP.optionsSelected[param.id_searcher][param.id_filter].hasOwnProperty('max_value')) {
            delete AppFPP.optionsSelected[param.id_searcher][param.id_filter];
        }
    },
    loading_big: function(show, content){
        if (show) {
            if ($(content).find('.loading_big').length <= 0) {
                $(content).append(AppFPP.$loading);
                $(content).find('.loading_big').fadeIn(200);
            }
        } else {
            $(content).find('.loading_big').fadeIn(200)
            setTimeout(function () {
                $(content).find('.loading_big').remove();
            },200);
        }
    },
    resetSearcher: function(event) {
        var id_searcher = $(event.currentTarget).data('id_searcher');
        AppFPP.optionsSelected[id_searcher] = {id_searcher: id_searcher};

        if (FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL) {
            AppFPP.generateSearcherUrl(id_searcher);
        }

        AppFPP.getSearcher({
            'id_searcher' : id_searcher,
            'execute_searcher': true
        });

        AppFPP.page = 1;
    },
    generateSearcherUrl: function(id_searcher) {
        var searcher_name = $('#searcher_'+id_searcher).data('name');
        var searcher_url = '';
        var text = '';
        if (AppFPP.optionsSelected.hasOwnProperty(id_searcher)) {
            var options_selected = AppFPP.optionsSelected[id_searcher];
            for (var key_filter in options_selected) {

                if (key_filter != 'id_searcher' && key_filter != 'filter_depends' && $('div#filter_'+key_filter).length > 0) {
                    var filter_data = $('div#filter_'+key_filter).data();
                    var filter_name = filter_data.name;
                    var hidden_filter = typeof filter_data === 'undefined';
                    if (!jQuery.isEmptyObject(options_selected[key_filter])) {
                        if (!hidden_filter) {
                            searcher_url += 'f/' + filter_name + ':';
                        } else {
                            var first_time = true;
                        }
                        for (var key_option in options_selected[key_filter]) {
                            var control_type;

                            if (hidden_filter) {
                                var selected_option = $('button#btn_selected_option_'+options_selected[key_filter][key_option]).data();
                                control_type = selected_option.control_type;

                                if (first_time) {
                                    searcher_url += searcher_url += 'f/' + filter_name + ':';
                                    first_time = false;
                                }
                            } else {
                                control_type = filter_data.control_type;
                            }

                            switch(control_type) {
                                case FilterProductsPro.control_types.LIST:
                                    if (hidden_filter) {
                                        text = selected_option.option_name;
                                    } else if (typeof $('select#filter_'+key_filter+' option[value="'+options_selected[key_filter][key_option]+'"]')[0] !== typeof undefined) {
                                        text = $('select#filter_'+key_filter+' option[value="'+options_selected[key_filter][key_option]+'"]').data('option-name').toString();
                                    }

                                    if (text !== '') {
                                        searcher_url += text + '/';
                                    }

                                    break;
                                case FilterProductsPro.control_types.RADIO:
                                case FilterProductsPro.control_types.CHECK:
                                    if (hidden_filter) {
                                        text = selected_option.option_name;
                                    } else if (typeof $('div#filter_'+key_filter+' input[value="'+options_selected[key_filter][key_option]+'"]')[0] !== 'undefined') {
                                        text = $('div#filter_'+key_filter+' input[value="'+options_selected[key_filter][key_option]+'"]').data('option-name').toString();
                                    }

                                    if (text !== '') {
                                        searcher_url += text + '/';
                                    }

                                    break;
                                case FilterProductsPro.control_types.INPUT:
                                    searcher_url += encodeURI(options_selected[key_filter][key_option]) + '/';
                                    break;
                                case FilterProductsPro.control_types.SLIDER:
                                    if (key_option == 'min_value') {
                                        searcher_url += options_selected[key_filter][key_option] + '-';
                                    } else {
                                        searcher_url += options_selected[key_filter][key_option] + '/';
                                    }
                                    break;
                            }
                        }
                    }
                }
            }
        }

        var url = document.URL;
        if (url.indexOf(AppFPP.limiter_url) !== -1){
            var parts_url = url.split(AppFPP.limiter_url);
            if (parts_url.length > 0){
                url = parts_url.shift();
            }
        }

        if (searcher_url !== '') {
            searcher_url = searcher_url.slice(0, -1);
            url += AppFPP.limiter_url + '/s/' + searcher_name + '/' + searcher_url;
        }

        history.pushState('', 'page', url);
    },
    removeSections: function (){
        $.each($(FilterProductsPro.CONFIGS.FPP_SECTIONS_REMOVE), function(i, item){
            if (!$(item).hasClass('filterproductspro')) {
                if ($(item).find('.filterproductspro').length <= 0) {
                    $(item).remove();
                }
            }
        });
    },
    toggleSearcher: function (content_toggle) {
        if ($(content_toggle).is(':visible')){
            $(content_toggle).css({
                'transform': 'translateX(200%)'
            });
            $('body').removeClass('fpp_popup');
            setTimeout(function(){
                $(content_toggle).hide();
            },250);
        } else {
            $(content_toggle).show();
            $('body').addClass('fpp_popup');
            setTimeout(function(){
                $(content_toggle).css({
                    'transform': 'translateX(0%)'
                });
            },50);
        }
    },
    disableSearchButtons: function() {
        $.each(FilterProductsPro.instant_search, function(key, value){
            if (FilterProductsPro.instant_search[key] == 0) {
                $('#btn_searcher_'+ key).attr('disabled', true);
            }
        });
    },
    hasOptionsSelected: function(id_searcher) {
        id_searcher = parseInt(id_searcher);
        var has_selected = false;
        if (AppFPP.optionsSelected.hasOwnProperty(id_searcher)) {
            $('#searcher_'+id_searcher+' .filter-content div[data-id_filter]').each(function (key,searcher){
                if (AppFPP.optionsSelected[id_searcher].hasOwnProperty($(searcher).data('id_filter'))) {
                    if (JSON.stringify(AppFPP.optionsSelected[id_searcher][parseInt($(searcher).data('id_filter'))]) != "{}") {
                        has_selected = true;
                        return;
                    }
                }
            });
        }

        return has_selected;
    },
    getMarketPlaceStore: function() {
        if (!FilterProductsPro.CONFIGS.FPP_SHOW_FILTER_IN_URL) {
            var url = window.location.href;
            var store = url.split('/');
            store = store[store.length -1];
            store = store.split('?');
            store = store[0];
            return store;
        }

        return '';
    },
    validateCookie: function(){
        if (AppFPP.existsCookie()) {
            AppFPP.optionsSelected = $.totalStorageFPP(AppFPP.getCookieName());
            for (var searcher in AppFPP.optionsSelected) {
                if (!AppFPP.optionsSelected.hasOwnProperty(searcher)) continue;
                for (var filter in AppFPP.optionsSelected[searcher]) {
                    if (!AppFPP.optionsSelected[searcher].hasOwnProperty(filter)) continue;
                    if (filter == 'filter_depends' || filter == 'id_searcher') continue;
                    for (var option in AppFPP.optionsSelected[searcher][filter]) {
                        if (!AppFPP.optionsSelected[searcher][filter].hasOwnProperty(option)) continue;
                        return true;
                    }
                }
            }
            return false;
        } else {
            return false;
        }
    },
    setCookie: function() {
        var cookie = AppFPP.optionsSelected;

        $.totalStorageFPP(
            AppFPP.getCookieName(),
            cookie
        );
        $.totalStorageFPP(
            'last_id_searcher', AppFPP.last_id_searcher
        );
    },
    getCookieName: function() {
        return 'options-selected_'
            + AppFPP.current_controller
            +'_'+AppFPP.id_current_controller
            +'_'+FilterProductsPro.CONFIGS.FPP_COOKIE_TIMESTAMP;
    },
    existsCookie: function() {
        if ($.totalStorageFPP(AppFPP.getCookieName())) {
            return true;
        } else {
            return false;
        }
    },
    setSearchersFromCookie: function() {
        if (AppFPP.existsCookie()) {
            var optionsSelected = $.totalStorageFPP(AppFPP.getCookieName());

            AppFPP.optionsSelected = optionsSelected;
            for (var searcher in AppFPP.optionsSelected) {
                if (!AppFPP.optionsSelected.hasOwnProperty(searcher)) continue;

                AppFPP.last_id_searcher = searcher;

                $.totalStorageFPP.deleteItem(AppFPP.getCookieName());
                $.totalStorageFPP.deleteItem('last_id_searcher');
            }
        }
    },
    getExtraParamsURL: function(url) {
        var extra_params = '';
        var send_params = false;

        //jxsearch - v1.3.1 - de Zemez (Alexander Grosul)
        if ($('#jxsearchbox').length > 0) {
            send_params = true;
        //weadvancedsearch - v1.0.0 - WECOMM SOLUTIONS
        } else if ($('body#results').length > 0) {
            send_params = true;
        //leopartsfilter - v2.2.0 - LeoTheme
        } else if ($('body#module-leopartsfilter-search').length > 0) {
            send_params = true;
        }

        if (send_params) {
            $.each(document.location.search.substr(1).split('&'), function (c, q) {
                if (q != undefined && q != '') {
                    var i = q.split('=');
                    if ($.isArray(i)) {
                        if (!$.isEmpty(extra_params)) {
                            extra_params += '&';
                        }
                        extra_params += i[0].toString();
                        if (typeof i[1] !== "undefined" && i[1].toString() != undefined)
                            extra_params += '=' + i[1].toString();
                    }
                }
            });
        }

        if (!$.isEmpty(extra_params)) {
            if ($.strpos(url, '?') === false) {
                return '?' + extra_params;
            } else {
                return '&' + extra_params;
            }
        }

        return extra_params;
    }
 };

$(function(){
    if ($('div[id^="searcher_"]').length > 0) {
        AppFPP.init();
        AppFPP.initEvents();
    }
});
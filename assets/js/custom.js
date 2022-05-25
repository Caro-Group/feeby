/*
 *  @Website: apollotheme.com - prestashop template provider
 *  @author Apollotheme <apollotheme@gmail.com>
 *  @copyright Apollotheme
 *  @description: ApPageBuilder is module help you can build content for your shop
 */
/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */
//MODAL TRIGGER
$(document).ready(function () {
  $('.product-base-info').click(function () {
    $('.product-base-modal-background').show()
  })

  $('.product-base-modal button').click(function () {
    $('.product-base-modal-background').hide()
  })

  $('.product-dimension-info').click(function () {
    $('.product-dimension-modal-background').show()
  })

  $('.product-dimension-modal button').click(function () {
    $('.product-dimension-modal-background').hide()
  })
})

$(window).resize(function () {
  //DONGND:: fix zoom, only work at product page
  if (prestashop.page.page_name == 'product') restartElevateZoom()
})

$(document).ready(function () {
  floatHeader()
  //check page product only
  if (prestashop.page.page_name == 'product') {
    restartElevateZoom()
  }
  if (prestashop.page.page_name == 'category') {
    setDefaultListGrid()
  }

  if (typeof products_list_functions != 'undefined') {
    for (var i = 0; i < products_list_functions.length; i++) {
      products_list_functions[i]()
    }
  }

  //DONGND:: update for order page - tab adress, when change adress, block adress change class selected
  $('.address-item .radio-block').click(function () {
    if (!$(this).parents('.address-item').hasClass('selected')) {
      $('.address-item.selected').removeClass('selected')
      $(this).parents('.address-item').addClass('selected')
    }
  })

  prestashop.on('updatedProduct', function () {
    if ($('.product-detail .product-thumb-images').length) {
      //DONGND:: re-call setup slick when change attribute at product page
      restartElevateZoom()
    }
  })
})

function restartElevateZoom() {
  $('.zoomContainer').remove()
  applyElevateZoom()
}

function applyElevateZoom() {
  if (
    $(window).width() <= 991 ||
    $('#content').data('templatezoomtype') == 'none'
  ) {
    //DONGND:: remove elevateZoom on mobile
    if ($('#main').hasClass('product-image-gallery')) {
      if ($('img.js-thumb').data('elevateZoom')) {
        var ezApi = $('img.js-thumb').data('elevateZoom')
        ezApi.changeState('disable')
        $('img.js-thumb').unbind('touchmove')
      }
    } else {
      if ($('#zoom_product').data('elevateZoom')) {
        var ezApi = $('#zoom_product').data('elevateZoom')
        ezApi.changeState('disable')
        $('#zoom_product').unbind('touchmove')
      }
    }
    return false
  }

  //check if that is gallery, zoom all thumb
  //DONGND:: fix zoom, create config
  var zt = $('#content').data('templatezoomtype')
  var zoom_cursor
  var zoom_type
  var scroll_zoom = false
  var lens_FadeIn = 200
  var lens_FadeOut = 200
  var zoomWindow_FadeIn = 200
  var zoomWindow_FadeOut = 200
  var zoom_tint = false
  var zoomWindow_Width = 400
  var zoomWindow_Height = 400
  var zoomWindow_Position = 1

  if (zt == 'in') {
    zoom_cursor = 'crosshair'
    zoom_type = 'inner'
    lens_FadeIn = false
    lens_FadeOut = false
  } else {
    zoom_cursor = 'default'
    zoom_type = 'window'
    zoom_tint = true
    zoomWindow_Width = $('#content').data('zoomwindowwidth')
    zoomWindow_Height = $('#content').data('zoomwindowheight')

    if ($('#content').data('zoomposition') == 'right') {
      //DONGND:: update position of zoom window with ar language
      if (prestashop.language.is_rtl == 1) {
        zoomWindow_Position = 11
      } else {
        zoomWindow_Position = 1
      }
    }
    if ($('#content').data('zoomposition') == 'left') {
      //DONGND:: update position of zoom window with ar language
      if (prestashop.language.is_rtl == 1) {
        zoomWindow_Position = 1
      } else {
        zoomWindow_Position = 11
      }
    }
    if ($('#content').data('zoomposition') == 'top') {
      zoomWindow_Position = 13
    }
    if ($('#content').data('zoomposition') == 'bottom') {
      zoomWindow_Position = 7
    }

    if (zt == 'in_scrooll') {
      //DONGND:: scroll to zoom does not work on IE
      var ua = window.navigator.userAgent
      var old_ie = ua.indexOf('MSIE ')
      var new_ie = ua.indexOf('Trident/')
      if (old_ie > 0 || new_ie > 0) {
        // If Internet Explorer, return version number
        scroll_zoom = false
      } // If another browser, return 0
      else {
        scroll_zoom = true
      }
    }
  }

  if ($('#main').hasClass('product-image-gallery')) {
    lens_FadeIn = false
    lens_FadeOut = false
    zoomWindow_FadeIn = false
    zoomWindow_FadeOut = false
  }

  var zoom_config = {
    responsive: true,
    zoomResponsive: true,
    cursor: zoom_cursor,
    scrollZoom: scroll_zoom,
    scrollZoomIncrement: 0.1,
    zoomLevel: 1,
    zoomType: zoom_type,
    gallery: 'thumb-gallery',
    lensFadeIn: lens_FadeIn,
    lensFadeOut: lens_FadeOut,
    zoomWindowFadeIn: zoomWindow_FadeIn,
    zoomWindowFadeOut: zoomWindow_FadeOut,
    zoomWindowWidth: zoomWindow_Width,
    zoomWindowHeight: zoomWindow_Height,
    borderColour: '#888',
    borderSize: 2,
    zoomWindowOffetx: 0,
    zoomWindowOffety: 0,
    zoomWindowPosition: zoomWindow_Position,
    tint: zoom_tint,
  }

  if ($('#main').hasClass('product-image-gallery')) {
    $('img.js-thumb').each(function () {
      var parent_e = $(this).parent()
      $(this).attr('src', parent_e.data('image'))
      $(this).data('type-zoom', parent_e.data('zoom-image'))
    })

    if ($.fn.elevateZoom !== undefined) {
      $('img.js-thumb').elevateZoom(zoom_config)
      //DONGND:: fix click a thumb replace all image and add fancybox
      $('img.js-thumb').bind('click', function (e) {
        var ez = $(this).data('elevateZoom')
        $.fancybox(ez.getGalleryList())
        return false
      })
    }
  } else {
    if ($.fn.elevateZoom !== undefined) {
      $('[data-zoom-container]').elevateZoom({ gallery: 'thumb-gallery' })

      //pass the images to Fancybox
      $('[data-zoom-container]').bind('click', function (e) {
        var ez = $(this).data('elevateZoom')
        $.fancybox(ez.getGalleryList())
        return false
      })
    }
  }
}

$(document).on('click', '.leo_grid', function (e) {
  e.preventDefault()
  $('#js-product-list .product_list').removeClass('list')
  $('#js-product-list .product_list').addClass('grid')

  $(this).parent().find('.leo_list').removeClass('selected')
  $(this).addClass('selected')

  var configName = LEO_COOKIE_THEME + '_grid_list'
  $.cookie(configName, 'grid', { expires: 1, path: '/' })
})

$(document).on('click', '.leo_list', function (e) {
  e.preventDefault()
  $('#js-product-list .product_list').removeClass('grid')
  $('#js-product-list .product_list').addClass('list')

  $(this).parent().find('.leo_grid').removeClass('selected')
  $(this).addClass('selected')

  var configName = LEO_COOKIE_THEME + '_grid_list'
  $.cookie(configName, 'list', { expires: 1, path: '/' })
})

function setDefaultListGrid() {
  if ($.cookie(LEO_COOKIE_THEME + '_grid_list') == 'grid') {
    $('.leo_grid').trigger('click')
  }
  if ($.cookie(LEO_COOKIE_THEME + '_grid_list') == 'list') {
    $('.leo_list').trigger('click')
  }
}

function processFloatHeader(headerAdd, scroolAction) {
  //DONGND:: hide search result when enable float header
  if ($('.ac_results').length) {
    $('.ac_results').hide()
  }

  if (headerAdd) {
    $('#header').addClass('navbar-fixed-top')
    var hideheight = $('#header').height() + 120
    $('#page').css('padding-top', $('#header').height())
    setTimeout(function () {
      $('#page').css('padding-top', $('#header').height())
    }, 200)
  } else {
    $('#header').removeClass('navbar-fixed-top')
    $('#page').css('padding-top', '')
  }

  var pos = $(window).scrollTop()
  if (scroolAction && pos >= hideheight) {
    $('.header-nav').addClass('hide-bar')
    $('.hide-bar').css('margin-top', -$('.header-nav').height())
    $('#header').addClass('mini-navbar')
  } else {
    $('.header-nav').removeClass('hide-bar')
    $('.header-nav').css('margin-top', 0)
    $('#header').removeClass('mini-navbar')
  }
}

//Float Menu
function floatHeader() {
  if (!$('body').hasClass('keep-header') || $(window).width() <= 990) {
    return
  }

  $(window).resize(function () {
    if ($(window).width() <= 990) {
      processFloatHeader(0, 0)
    } else if ($(window).width() > 990) {
      if ($('body').hasClass('keep-header')) processFloatHeader(1, 1)
    }
  })
  var headerScrollTimer

  $(window).scroll(function () {
    if (headerScrollTimer) {
      window.clearTimeout(headerScrollTimer)
    }

    headerScrollTimer = window.setTimeout(function () {
      if (!$('body').hasClass('keep-header')) return
      if ($(window).width() > 990) {
        processFloatHeader(1, 1)
      }
    }, 100)
  })
}

//DONGND: fix base prestashop

//Fix translate button choose file to upload: change "Choose file" to choosefile_text
//Fix filter (category page) does not work on IE change dataset.searchUrl to getAttribute('data-search-url')

$().ready(function () {
  $('#leo_search_block_top .title_block').click(function () {
    $(this).parent().toggleClass('active')
    setTimeout(function () {
      jQuery('#leo_search_block_top.active input.form-control').focus()
    }, 100)
  })

  $(document).keydown(function (e) {
    // ESCAPE key pressed
    if (e.keyCode == 27) {
      $('#leo_search_block_top').removeClass('active')
    }
  })

  $(document).click(function (event) {
    if (!$(event.target).closest('#leo_search_block_top').length) {
      $('#leo_search_block_top').removeClass('active')
    }
  })

  $(document).ajaxComplete(function () {
    $('.p-reference .product-reference').html(
      $('#product-details .product-reference').clone(),
    )
    $('.p-reference .product-quantities').html(
      $('#product-details .product-quantities').clone(),
    )
  })
})
;(function ($) {
  $(function () {
    var $myGroup = $('#search_filters .facet')
    $myGroup.on('show.bs.collapse', '.collapse', function () {
      $myGroup.find('.collapse.in').collapse('hide')
    })
  })

  $(document).click(function (event) {
    if ($(window).width() >= 769) {
      $('#search_filters .facet .collapse').collapse('hide')
    }
  })

  $(document).ready(function () {
    if (prestashop.page.page_name === 'category') {
      const aboveFiltersContainer = '[data-container="additional-filters"]'
      const currentFilterContainer = '[data-target="#facet_attribute_group_18"]'

      $(document).ajaxComplete(function () {
        if ($(currentFilterContainer).length !== 0) {
          moveFilters($(currentFilterContainer), $(aboveFiltersContainer))
        } else {
          $(aboveFiltersContainer).empty()
        }
      })

      if ($(currentFilterContainer).length !== 0) {
        moveFilters($(currentFilterContainer), $(aboveFiltersContainer))
      } else {
        $(aboveFiltersContainer).empty()
      }

      $(document).on(
        'click',
        aboveFiltersContainer + ' a.js-search-link',
        function (e) {
          e.preventDefault()
          $(document)
            .find(
              currentFilterContainer +
                ' a[href^="' +
                e.currentTarget.href +
                '"].js-search-link',
            )
            .trigger('click')
        },
      )
    }
  })

  function moveFilters(current, target) {
    const elements = current.next().children()
    target.empty()
    target.append(elements.clone())
  }

  //Filters custom move-end

  $(window).load(function () {
    $('.category-top-menu a').each(function (t, el) {
      $(this).data('link', $(el).attr('href'))
    })

    jQuery('.category-top-menu a').each(function (t, el) {
      jQuery(el).attr(
        'href',
        jQuery(el).data('link') +
          window.location.href.replace(prestashop.page.canonical, ''),
      )
    })

    prestashop.on('updateFacets', (param) => {
      jQuery('.category-top-menu a').each(function (t, el) {
        jQuery(el).attr(
          'href',
          jQuery(el).data('link') +
            '?' +
            param.substring(param.indexOf('?') + 1),
        )
      })
    })

    if ($('#cart').length) {
      $('#cart [data-toggle="popover"]').popover()

      $('[data-sticky-height-target').attr(
        'style',
        'top: ' + $('[data-sticky-height-source]').outerHeight(true) + 'px',
      )
    }
  })

  if (
    $('#checkout-guest-form [data-field="password"]').value !== '' &&
    prestashop.customer.is_logged
  ) {
    prestashop.customer.is_guest_logged = true
  }
  $('body').on(
    'change',
    '#checkout-guest-form [data-field="password"]',
    function (e) {
      if (this.value !== '' && prestashop.customer.is_logged) {
        prestashop.customer.is_guest_logged = true
      }
    },
  )

  $('body').on('change', '#delivery_message', function () {
    $.post(
      $('#js-summary').attr('[data-url-update]'),
      $('#js-summary').serialize(),
      null,
      'json',
    )
  })

  $('body').on('click', '#payment-confirmation button', function () {
    $.post(
      $('#js-summary').attr('[data-url-update]'),
      $('#js-summary').serialize(),
      null,
      'json',
    )
  })

  $('body').on(
    'click',
    '[href="#checkout-guest-form"], [href="#checkout-register-form"]',
    function (e) {
      e.preventDefault()
      $('[data-login-panel]').hide()
      $('[data-js-elem="cart"]').removeClass('hidden')
    },
  )

  $('body').on('click', '[href="#checkout-register-form"]', function (e) {
    e.preventDefault()
    if (!prestashop.customer.is_guest_logged) {
      $('#checkout-guest-form [data-field="password"]').show()
      // $('[data-js-elem="cart"]').removeClass('hidden')
    }
  })

  $('body').on('click', '[href="#checkout-login-panel"]', function (e) {
    e.preventDefault()
    $('[data-login-panel]').show()
    $('[data-js-elem="cart"]').addClass('hidden')
  })

  $('body').on('click', '[href="#checkout-guest-form"]', function (e) {
    e.preventDefault()
    $('#checkout-guest-form [data-field="password"]').hide()
  })

  $('body').on('click', '.js-edit-addresses', (event) => {
    event.stopPropagation()
    $('#checkout-delivery-step').trigger('click')
    prestashop.emit('editAddress')
  })

  if (
    $('#checkout-payment-step').find('[name="payment-option"]:checked').length
  ) {
    $('[data-checkout-payment]').attr('disabled', false)
  }

  $('body').on('change', '[name="payment-option"]', function (e) {
    if (
      $('#checkout-payment-step').find('[name="payment-option"]:checked').length
    ) {
      $('[data-checkout-payment]').attr('disabled', false)
    }
  })

  $('body').on('click', '[data-checkout-payment]', function (e) {
    e.preventDefault()
    var formButton = $('#checkout-payment-step')
      .find("input[name='payment-option']:checked")
      .parent()
      .parent()
      .find('form button')
    if (formButton.length) {
      $('#checkout-payment-step')
        .find("input[name='payment-option']:checked")
        .parent()
        .parent()
        .find('form button')
        .trigger('click')
    } else {
      $('#checkout-summary-step').trigger('click')
    }
  })

  $('body').on('click', '[data-checkout-back]', function (e) {
    e.preventDefault()
    $($(this).data('checkoutBack')).trigger('click')
    window.scrollTo(0, 0)
  })
})(jQuery)

//Top bar swiper
$(document).ready(function () {
  if ($('[data-swiper-blog]').length != 0) {
    new Swiper('[data-swiper-blog]', {
      speed: 300,
      slidesPerView: 'auto',
      spaceBetween: 0,
      loop: true,
      navigation: {
        nextEl: '[data-swiper-blog-next]',
        prevEl: '[data-swiper-blog-prev]',
      },
    })
  }

  if ($('[data-about-swiper]').length != 0) {
    new Swiper('[data-about-swiper]', {
      speed: 300,
      slidesPerView: 'auto',
      resistanceRatio: 0.5,
      breakpoints: {
        768: {
          slidesPerView: 3,
          slidesPerGroup: 3,
          slidesPerColumn: 2,
          slidesPerColumnFill: 'row',
          allowTouchMove: false,
        },
      },
      on: {
        reachEnd: function () {
          this.snapGrid = [...this.slidesGrid]
        },
      },
    })
  }
})

function openMenuWithCategory(id) {
  var menu_el = $('.off-canvas-nav-megamenu')
    .find('[data-category-id=' + id + ']')
    .first()
  if (!menu_el.length) {
    menu_el = $('.off-canvas-nav-megamenu [data-menu-type="category"].active')
      .first()
      .addClass('open')
    if (!menu_el.hasClass('open-sub')) {
      menu_el.children('.dropdown-toggle').click()
    }
  }
  var menu_id = menu_el.parents('[data-megamenu-id]').data('megamenu-id')

  if (menu_el.length) {
    if (
      $(menu_el).parent().hasClass('level2') &&
      !$(menu_el).parent().hasClass('open-sub')
    ) {
      $(menu_el).next('.caret').click()
    }

    if (
      $(menu_el).parent().hasClass('level3') &&
      !$(menu_el).parent().hasClass('open-sub')
    ) {
      if ($(menu_el).parent().parent().hasClass('level2')) {
        $(menu_el).parent().parent().find('.caret').click()
      }
      if ($(menu_el).parent().parent().parent().hasClass('level2')) {
        $(menu_el).parent().parent().parent().find('.caret').click()
      }
    }
  }
  if (
    menu_el.parents('.dropdown').each(function (i, item) {
      if (!$(item).hasClass('open-sub')) {
        $(item).children('.dropdown-toggle').click()
      }
    })
  );

  $('[data-target=".megamenu-off-canvas-' + menu_id + '"]')
    .first()
    .click()

  var currentCatId = $('[data-current-category-id]')
    .first()
    .data('currentCategoryId')
  menu_el = $('.off-canvas-nav-megamenu')
    .find('[data-category-id=' + currentCatId + ']')
    .first()
    .addClass('text-main')
  if ($(menu_el).parent().hasClass('level2')) {
    $(menu_el)
      .next('.caret')
      .removeClass('text-main-dark')
      .addClass('text-main')
  }

  if (
    $(menu_el).parent().hasClass('level2') ||
    $(menu_el).parent().hasClass('level3')
  ) {
    $(menu_el).removeClass('text-main-dark').addClass('text-main')

    if ($(menu_el).parent().parent().hasClass('level2')) {
      $(menu_el)
        .parent()
        .parent()
        .children('a')
        .removeClass('text-main-dark')
        .addClass('text-main')
    }
    if ($(menu_el).parent().parent().parent().hasClass('level2')) {
      $(menu_el)
        .parent()
        .parent()
        .parent()
        .children('a')
        .removeClass('text-main-dark')
        .addClass('text-main')
    }
  }
}

$(document).ready(function () {
  if ($('.swiper-banner').length != 0) {
    var delayValue = $('.swiper-banner .swiper-slide').attr('data-pausetime')
    if (delayValue == undefined || delayValue == '') {
      delayValue = 2000
    }

    const swiperBanner = new Swiper('.swiper-banner', {
      speed: 800,
      slidesPerView: 1,
      spaceBetween: 0,
      loop: true,
      autoplay: {
        delay: delayValue,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        prevEl: '.swiper_banner-button-prev',
        nextEl: '.swiper_banner-button-next',
      },
    })
  }
})

$(document).ready(function () {
  if ($('.swiper-popular').length != 0) {
    new Swiper('.swiper-popular', {
      speed: 300,
      slidesPerView: 2,
      spaceBetween: 20,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        dynamicBullets: true,
        dynamicMainBullets: 1,
      },
      breakpoints: {
        576: {
          slidesPerView: 3,
        },
        922: {
          slidesPerView: 4,
        },
      },
    })
  }
})

$(document).ready(function () {
  if (prestashop.page.page_name === 'product') {
    let productSwiper = new Swiper('[data-swiper-product]', {
      slidesPerView: 1,
      spaceBetween: 20,
      loop: true,
      navigation: {
        nextEl: '[data-swiper-product-next]',
        prevEl: '[data-swiper-product-prev]',
      },
      pagination: {
        el: '.product-thumb-images-pag',
        clickable: true,
        dynamicBullets: true,
        dynamicMainBullets: 1,
      },
    })

    handleUpdateZoom(productSwiper)

    if (typeof prestashop !== 'undefined') {
      window.addEventListener('resize', () => {
        productSwiper.slideTo(1, 300, false)
      })

      prestashop.on('updatedProduct', function (event) {
        let productSwiper = new Swiper('[data-swiper-product]', {
          slidesPerView: 1,
          spaceBetween: 20,
          loop: true,
          navigation: {
            nextEl: '[data-swiper-product-next]',
            prevEl: '[data-swiper-product-prev]',
          },
          pagination: {
            el: '.product-thumb-images-pag',
            clickable: true,
            dynamicBullets: true,
            dynamicMainBullets: 1,
          },
        })
        handleUpdateZoom(productSwiper)
      })
    }
  }
})

function handleUpdateZoom(mainSwiper) {
  window.addEventListener('resize', () => {
    mainSwiper.slideTo(1, 300, false)
  })

  mainSwiper.on('activeIndexChange', function () {
    // replace zoom realIndex
    let activeElement = $(mainSwiper.wrapperEl)
      .find(`[data-swiper-slide-index=${mainSwiper.realIndex}]`)
      .eq(0)
    let activeImageUrl = activeElement.attr('src')
    $('.zoomWindowContainer div').css(
      'background-image',
      `url(${activeImageUrl})`,
    )

    //set zoomGallery active slide
    $('#thumb-gallery')
      .find('.swiper-custom-slide a')
      .eq(mainSwiper.realIndex)
      .trigger('click')
  })
}

$(document).ready(function () {
  if (prestashop.page.page_name === 'category') {
    $(document).on('click.pageUp', '.page-list a', function () {
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
    })
  }
})

$(document).ready(function () {
  if ($('#checkout').length != 0) {
    let currentStep = $('.js-current-step .step-number').text()
    if (currentStep == 1) {
      if ($('[data-login-panel]').is(':visible')) {
        $('[data-js-elem="cart"]').addClass('hidden')
        $('#checkout-guest-form').addClass('hidden')
      }
    } else {
      $('[data-js-elem="cart"]').removeClass('hidden')
      $('#checkout-guest-form').removeClass('hidden')
    }

    prestashop.on('changedCheckoutStep', function () {
      currentStep = $('.js-current-step .step-number').text()
      if (currentStep == 1) {
        if ($('[data-login-panel]').is(':visible')) {
          $('[data-js-elem="cart"]').addClass('hidden')
          $('#checkout-guest-form').addClass('hidden')
        }
      } else {
        $('[data-js-elem="cart"]').removeClass('hidden')
        $('#checkout-guest-form').removeClass('hidden')
      }
    })
  }
})

$(document).ready(function () {
  if ($('#checkout [name="postcode"]').length != 0) {
    $('#checkout [name="postcode"]').mask('99-999')
  }
})

$(document).ready(function () {
  if ($('[data-swiper-carousel]').length != 0) {
    new Swiper('[data-swiper-carousel]', {
      speed: 400,
      spaceBetween: 20,
      slidesPerView: 'auto',
      rewind: true,
      slideClass: 'slide',
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        dynamicBullets: true,
        dynamicMainBullets: 1,
      },
      breakpoints: {
        1200: {
          slidesPerView: 4,
        },
      },
    })
  }
})

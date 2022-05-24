/*!
 * jQuery throttle / debounce - v1.1 - 3/7/2010
 * http://benalman.com/projects/jquery-throttle-debounce-plugin/
 *
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */

// Script: jQuery throttle / debounce: Sometimes, less is more!
//
// *Version: 1.1, Last updated: 3/7/2010*
//
// Project Home - http://benalman.com/projects/jquery-throttle-debounce-plugin/
// GitHub       - http://github.com/cowboy/jquery-throttle-debounce/
// Source       - http://github.com/cowboy/jquery-throttle-debounce/raw/master/jquery.ba-throttle-debounce.js
// (Minified)   - http://github.com/cowboy/jquery-throttle-debounce/raw/master/jquery.ba-throttle-debounce.min.js (0.7kb)
//
// About: License
//
// Copyright (c) 2010 "Cowboy" Ben Alman,
// Dual licensed under the MIT and GPL licenses.
// http://benalman.com/about/license/
//
// About: Examples
//
// These working examples, complete with fully commented code, illustrate a few
// ways in which this plugin can be used.
//
// Throttle - http://benalman.com/code/projects/jquery-throttle-debounce/examples/throttle/
// Debounce - http://benalman.com/code/projects/jquery-throttle-debounce/examples/debounce/
//
// About: Support and Testing
//
// Information about what version or versions of jQuery this plugin has been
// tested with, what browsers it has been tested in, and where the unit tests
// reside (so you can test it yourself).
//
// jQuery Versions - none, 1.3.2, 1.4.2
// Browsers Tested - Internet Explorer 6-8, Firefox 2-3.6, Safari 3-4, Chrome 4-5, Opera 9.6-10.1.
// Unit Tests      - http://benalman.com/code/projects/jquery-throttle-debounce/unit/
//
// About: Release History
//
// 1.1 - (3/7/2010) Fixed a bug in <jQuery.throttle> where trailing callbacks
//       executed later than they should. Reworked a fair amount of internal
//       logic as well.
// 1.0 - (3/6/2010) Initial release as a stand-alone project. Migrated over
//       from jquery-misc repo v0.4 to jquery-throttle repo v1.0, added the
//       no_trailing throttle parameter and debounce functionality.
//
// Topic: Note for non-jQuery users
//
// jQuery isn't actually required for this plugin, because nothing internal
// uses any jQuery methods or properties. jQuery is just used as a namespace
// under which these methods can exist.
//
// Since jQuery isn't actually required for this plugin, if jQuery doesn't exist
// when this plugin is loaded, the method described below will be created in
// the `Cowboy` namespace. Usage will be exactly the same, but instead of
// $.method() or jQuery.method(), you'll need to use Cowboy.method().

;(function (window, undefined) {
  '$:nomunge' // Used by YUI compressor.

  // Since jQuery really isn't required for this plugin, use `jQuery` as the
  // namespace only if it already exists, otherwise use the `Cowboy` namespace,
  // creating it if necessary.
  var $ = window.jQuery || window.Cowboy || (window.Cowboy = {}),
    // Internal method reference.
    jq_throttle

  // Method: jQuery.throttle
  //
  // Throttle execution of a function. Especially useful for rate limiting
  // execution of handlers on events like resize and scroll. If you want to
  // rate-limit execution of a function to a single time, see the
  // <jQuery.debounce> method.
  //
  // In this visualization, | is a throttled-function call and X is the actual
  // callback execution:
  //
  // > Throttled with `no_trailing` specified as false or unspecified:
  // > ||||||||||||||||||||||||| (pause) |||||||||||||||||||||||||
  // > X    X    X    X    X    X        X    X    X    X    X    X
  // >
  // > Throttled with `no_trailing` specified as true:
  // > ||||||||||||||||||||||||| (pause) |||||||||||||||||||||||||
  // > X    X    X    X    X             X    X    X    X    X
  //
  // Usage:
  //
  // > var throttled = jQuery.throttle( delay, [ no_trailing, ] callback );
  // >
  // > jQuery('selector').bind( 'someevent', throttled );
  // > jQuery('selector').unbind( 'someevent', throttled );
  //
  // This also works in jQuery 1.4+:
  //
  // > jQuery('selector').bind( 'someevent', jQuery.throttle( delay, [ no_trailing, ] callback ) );
  // > jQuery('selector').unbind( 'someevent', callback );
  //
  // Arguments:
  //
  //  delay - (Number) A zero-or-greater delay in milliseconds. For event
  //    callbacks, values around 100 or 250 (or even higher) are most useful.
  //  no_trailing - (Boolean) Optional, defaults to false. If no_trailing is
  //    true, callback will only execute every `delay` milliseconds while the
  //    throttled-function is being called. If no_trailing is false or
  //    unspecified, callback will be executed one final time after the last
  //    throttled-function call. (After the throttled-function has not been
  //    called for `delay` milliseconds, the internal counter is reset)
  //  callback - (Function) A function to be executed after delay milliseconds.
  //    The `this` context and all arguments are passed through, as-is, to
  //    `callback` when the throttled-function is executed.
  //
  // Returns:
  //
  //  (Function) A new, throttled, function.

  $.throttle = jq_throttle = function (
    delay,
    no_trailing,
    callback,
    debounce_mode,
  ) {
    // After wrapper has stopped being called, this timeout ensures that
    // `callback` is executed at the proper times in `throttle` and `end`
    // debounce modes.
    var timeout_id,
      // Keep track of the last time `callback` was executed.
      last_exec = 0

    // `no_trailing` defaults to falsy.
    if (typeof no_trailing !== 'boolean') {
      debounce_mode = callback
      callback = no_trailing
      no_trailing = undefined
    }

    // The `wrapper` function encapsulates all of the throttling / debouncing
    // functionality and when executed will limit the rate at which `callback`
    // is executed.
    function wrapper() {
      var that = this,
        elapsed = +new Date() - last_exec,
        args = arguments

      // Execute `callback` and update the `last_exec` timestamp.
      function exec() {
        last_exec = +new Date()
        callback.apply(that, args)
      }

      // If `debounce_mode` is true (at_begin) this is used to clear the flag
      // to allow future `callback` executions.
      function clear() {
        timeout_id = undefined
      }

      if (debounce_mode && !timeout_id) {
        // Since `wrapper` is being called for the first time and
        // `debounce_mode` is true (at_begin), execute `callback`.
        exec()
      }

      // Clear any existing timeout.
      timeout_id && clearTimeout(timeout_id)

      if (debounce_mode === undefined && elapsed > delay) {
        // In throttle mode, if `delay` time has been exceeded, execute
        // `callback`.
        exec()
      } else if (no_trailing !== true) {
        // In trailing throttle mode, since `delay` time has not been
        // exceeded, schedule `callback` to execute `delay` ms after most
        // recent execution.
        //
        // If `debounce_mode` is true (at_begin), schedule `clear` to execute
        // after `delay` ms.
        //
        // If `debounce_mode` is false (at end), schedule `callback` to
        // execute after `delay` ms.
        timeout_id = setTimeout(
          debounce_mode ? clear : exec,
          debounce_mode === undefined ? delay - elapsed : delay,
        )
      }
    }

    // Set the guid of `wrapper` function to the same of original callback, so
    // it can be removed in jQuery 1.4+ .unbind or .die by using the original
    // callback as a reference.
    if ($.guid) {
      wrapper.guid = callback.guid = callback.guid || $.guid++
    }

    // Return the wrapper function.
    return wrapper
  }

  // Method: jQuery.debounce
  //
  // Debounce execution of a function. Debouncing, unlike throttling,
  // guarantees that a function is only executed a single time, either at the
  // very beginning of a series of calls, or at the very end. If you want to
  // simply rate-limit execution of a function, see the <jQuery.throttle>
  // method.
  //
  // In this visualization, | is a debounced-function call and X is the actual
  // callback execution:
  //
  // > Debounced with `at_begin` specified as false or unspecified:
  // > ||||||||||||||||||||||||| (pause) |||||||||||||||||||||||||
  // >                          X                                 X
  // >
  // > Debounced with `at_begin` specified as true:
  // > ||||||||||||||||||||||||| (pause) |||||||||||||||||||||||||
  // > X                                 X
  //
  // Usage:
  //
  // > var debounced = jQuery.debounce( delay, [ at_begin, ] callback );
  // >
  // > jQuery('selector').bind( 'someevent', debounced );
  // > jQuery('selector').unbind( 'someevent', debounced );
  //
  // This also works in jQuery 1.4+:
  //
  // > jQuery('selector').bind( 'someevent', jQuery.debounce( delay, [ at_begin, ] callback ) );
  // > jQuery('selector').unbind( 'someevent', callback );
  //
  // Arguments:
  //
  //  delay - (Number) A zero-or-greater delay in milliseconds. For event
  //    callbacks, values around 100 or 250 (or even higher) are most useful.
  //  at_begin - (Boolean) Optional, defaults to false. If at_begin is false or
  //    unspecified, callback will only be executed `delay` milliseconds after
  //    the last debounced-function call. If at_begin is true, callback will be
  //    executed only at the first debounced-function call. (After the
  //    throttled-function has not been called for `delay` milliseconds, the
  //    internal counter is reset)
  //  callback - (Function) A function to be executed after delay milliseconds.
  //    The `this` context and all arguments are passed through, as-is, to
  //    `callback` when the debounced-function is executed.
  //
  // Returns:
  //
  //  (Function) A new, debounced, function.

  $.debounce = function (delay, at_begin, callback) {
    return callback === undefined
      ? jq_throttle(delay, at_begin, false)
      : jq_throttle(delay, callback, at_begin !== false)
  }
})(this)

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

//DONGND:: create option for slick slider of modal popup at product page
var options_modal_product_page = {
  speed: 300,
  dots: false,
  infinite: false,
  slidesToShow: 4,
  slidesToScroll: 1,
  vertical: true,
  verticalSwiping: true,
  responsive: [
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 400,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      },
    },
  ],
}

//DONGND:: create option for slick slider of quickview
var options_quickview = {
  speed: 300,
  dots: false,
  infinite: false,
  slidesToShow: 4,
  slidesToScroll: 1,
  vertical: true,
  verticalSwiping: true,
  responsive: [
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
      },
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
      },
    },
  ],
}

$(window).resize(function () {
  //DONGND:: fix zoom, only work at product page
  if (prestashop.page.page_name == 'product') restartElevateZoom()

  //DONGND:: fix lost slider of modal when resize
  if (
    $('#product-modal .product-images').hasClass('slick-initialized') &&
    $('#product-modal .product-images').height() == 0
  ) {
    //DONGND:: setup slide for product thumb (modal)
    $('#product-modal .product-images').slick('unslick')
    $('#product-modal .product-images').hide()
    initSlickProductModal()
  }
})

$(document).ready(function () {
  floatHeader()
  //check page product only
  if (prestashop.page.page_name == 'product') {
    innitSlickandZoom()
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

  //DONGND:: loading quickview
  actionQuickViewLoading()

  prestashop.on('updateProductList', function () {
    actionQuickViewLoading()
  })

  prestashop.on('updatedProduct', function () {
    if ($('.quickview.modal .product-thumb-images').length) {
      //DONGND:: run slick slider for product thumb - quickview
      initSlickProductQuickView()
    } else if ($('.product-detail .product-thumb-images').length) {
      //DONGND:: re-call setup slick when change attribute at product page
      innitSlickandZoom()
    }
  })

  //DONGND:: display modal by config
  if (typeof $('#content').data('templatemodal') != 'undefined') {
    if (!$('#content').data('templatemodal')) {
      $('div[data-target="#product-modal"]').hide()
    }
  }

  //DONGND:: create demo product detail from megamenu
  $('.demo-product-detail a').click(function (e) {
    if (!$(this).hasClass('updated')) {
      e.preventDefault()
      var current_url = window.location.href
      if (
        prestashop.page.page_name == 'product' &&
        current_url.indexOf('.html') >= 0
      ) {
        var link_href = $(this).attr('href')
        var layout_key_index = link_href.indexOf('?layout=')
        var layout_key_value = link_href.substring(layout_key_index)
        current_url = current_url.substring(0, current_url.indexOf('.html'))
        var new_url = current_url + '.html' + layout_key_value
        window.location.href = new_url
      }
    }
  })
})

function innitSlickandZoom() {
  if ($('#main').hasClass('product-image-thumbs')) {
    //DONGND:: setup slide for product thumb (main)
    $('.product-detail .product-thumb-images').imagesLoaded(function () {
      if (typeof check_loaded_main_product != 'undefined') {
        clearInterval(check_loaded_main_product)
      }

      check_loaded_main_product = setInterval(function () {
        if ($('.product-detail .product-thumb-images').height() > 0) {
          $('.product-detail .product-thumb-images').fadeIn()

          clearInterval(check_loaded_main_product)
          postion = $('#content').data('templateview')
          //DONGND:: add config for over 1200 extra large
          numberimage = $('#content').data('numberimage')
          numberimage1200 = $('#content').data('numberimage1200')
          numberimage992 = $('#content').data('numberimage992')
          numberimage768 = $('#content').data('numberimage768')
          numberimage576 = $('#content').data('numberimage576')
          numberimage480 = $('#content').data('numberimage480')
          numberimage360 = $('#content').data('numberimage360')

          if (postion !== 'undefined') {
            initSlickProductThumb(
              postion,
              numberimage,
              numberimage1200,
              numberimage992,
              numberimage768,
              numberimage576,
              numberimage480,
              numberimage360,
            )
          }
        }
      }, 300)
    })

    //DONGND:: setup slide for product thumb (modal)
    initSlickProductModal()
  }
  //call action zoom
  applyElevateZoom()
}

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

function initSlickProductThumb(
  postion,
  numberimage,
  numberimage1200,
  numberimage992,
  numberimage768,
  numberimage576,
  numberimage480,
  numberimage360,
) {
  var vertical = true
  var verticalSwiping = true
  //DONGND:: update for rtl
  var slick_rtl = false

  if (postion == 'bottom') {
    vertical = false
    verticalSwiping = false
  }

  if (postion == 'none') {
    vertical = false
    verticalSwiping = false
    numberimage = numberimage1200 = numberimage992 = numberimage768 = numberimage576 = numberimage480 = numberimage360 = 1
  }

  //DONGND:: update for rtl
  if (!vertical && prestashop.language.is_rtl == 1) {
    slick_rtl = true
  }

  var slider = $('#thumb-gallery')

  slider.slick({
    speed: 300,
    dots: false,
    infinite: false,
    slidesToShow: numberimage,
    vertical: vertical,
    verticalSwiping: verticalSwiping,
    slidesToScroll: 1,
    rtl: slick_rtl,
    responsive: [
      {
        breakpoint: 1200,
        settings: {
          slidesToShow: numberimage1200,
          slidesToScroll: 1,
        },
      },
      {
        breakpoint: 992,
        settings: {
          slidesToShow: numberimage992,
          slidesToScroll: 1,
        },
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow: numberimage768,
          slidesToScroll: 1,
        },
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: numberimage576,
          slidesToScroll: 1,
        },
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: numberimage480,
          slidesToScroll: 1,
        },
      },
      {
        breakpoint: 360,
        settings: {
          slidesToShow: numberimage360,
          slidesToScroll: 1,
        },
      },
    ],
  })
  $('#thumb-gallery').show()

  if (postion == 'none') {
    var slickInstance = slider[0]
    var slides = $(slickInstance.slick.$slides)
    var positionStart = findPosition(slides)
    var slideCount = slickInstance.slick.slideCount

    //DONGND:: update slick for case without thubms
    if (positionStart + 1 == slideCount) {
      $('.arrows-product-fake .slick-next').addClass('slick-disabled')
    } else if (positionStart == 0) {
      $('.arrows-product-fake .slick-prev').addClass('slick-disabled')
    }

    // active image first load
    slider.slick('slickGoTo', positionStart)

    $('.arrows-product-fake .slick-next').on('click', function () {
      if (!$(this).hasClass('slick-disabled')) {
        $('.arrows-product-fake .slick-prev').removeClass('slick-disabled')
        var positionCurrent = findPosition(slides)
        if (positionCurrent + 1 < slideCount) {
          $(slides[positionCurrent]).removeClass('active')
          $(slides[positionCurrent + 1]).addClass('active')
          $(slides[positionCurrent + 1])
            .find('img')
            .trigger('click')
          slider.slick('slickNext')
          if (positionCurrent + 1 == slideCount - 1) {
            $(this).addClass('slick-disabled')
          }
        }
      }
    })

    $('.arrows-product-fake .slick-prev').on('click', function () {
      if (!$(this).hasClass('slick-disabled')) {
        $('.arrows-product-fake .slick-next').removeClass('slick-disabled')
        var positionCurrent = findPosition(slides)
        if (positionCurrent > 0) {
          $(slides[positionCurrent]).removeClass('active')
          $(slides[positionCurrent - 1]).addClass('active')
          $(slides[positionCurrent - 1])
            .find('img')
            .trigger('click')
          slider.slick('slickPrev')
          if (positionCurrent - 1 == 0) {
            $(this).addClass('slick-disabled')
          }
        }
      }
    })
  }
}

function findPosition(slides) {
  var position
  for (var i = 0; i < slides.length; i++) {
    if ($(slides[i]).hasClass('active')) {
      position = $(slides[i]).data('slick-index')
      return position
    }
  }
}

//DONGND:: loading quickview
function actionQuickViewLoading() {
  $('.quick-view').click(function () {
    if (!$(this).hasClass('active')) {
      $(this).addClass('active')
      $(this).find('.leo-quickview-bt-loading').css({ display: 'block' })
      $(this).find('.leo-quickview-bt-content').hide()
      if (typeof check_active_quickview != 'undefined') {
        clearInterval(check_active_quickview)
      }

      check_active_quickview = setInterval(function () {
        if ($('.quickview.modal').length) {
          $('.quickview.modal').on('hide.bs.modal', function (e) {
            $('.quick-view.active').find('.leo-quickview-bt-loading').hide()
            $('.quick-view.active').find('.leo-quickview-bt-content').show()
            $('.quick-view.active').removeClass('active')
          })
          clearInterval(check_active_quickview)

          //DONGND:: run slick for product thumb - quickview
          initSlickProductQuickView()
        }
      }, 300)
    }
  })
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

//DONGND:: build slick slider for quickview
function initSlickProductQuickView() {
  $('.quickview.modal .product-thumb-images').imagesLoaded(function () {
    if (typeof check_loaded_thumb_quickview != 'undefined') {
      clearInterval(check_loaded_thumb_quickview)
    }
    check_loaded_thumb_quickview = setInterval(function () {
      if ($('.quickview.modal .product-thumb-images').height() > 0) {
        $('.quickview.modal .product-thumb-images').fadeIn()

        clearInterval(check_loaded_thumb_quickview)
        $('.quickview.modal .product-thumb-images').slick(options_quickview)
      }
    }, 300)
  })
}

//DONGND:: build slick slider for modal - product page
function initSlickProductModal() {
  $('#product-modal .product-images').imagesLoaded(function () {
    if (typeof check_loaded_thumb_modal != 'undefined') {
      clearInterval(check_loaded_thumb_modal)
    }
    check_loaded_thumb_modal = setInterval(function () {
      if ($('#product-modal .product-images').height() > 0) {
        $('#product-modal .product-images').fadeIn()

        clearInterval(check_loaded_thumb_modal)
        $('#product-modal .product-images').slick(options_modal_product_page)
      }
    }, 300)
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

  /*
	  // fix bug module Amazzingfilter
	if ($('body#category').hasClass("page-category")){
		customThemeActions.updateContentAfter = function (jsonData) {
			if (typeof $.LeoCustomAjax == 'function') {
				var leoCustomAjax = new $.LeoCustomAjax();
				leoCustomAjax.processAjax();
			}
			if ($('.af_pl_wrapper').find('.product_list').hasClass('list')) {
				$('.leo_list').addClass('selected').siblings().removeClass('selected');
			}    
		}
		$( document ).ajaxComplete(function() {
			actionQuickViewLoading();
			leoBtCart();
			LeoWishlistButtonAction();
			LeoCompareButtonAction();
		});
	}
	*/

  if ($('.list-images-mobile').length != 0) {
    $('.list-images-mobile').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      dots: true,
      infinite: true,
      //centerMode: true,
      //fade: true,
      customPaging: function (slick, index) {
        var targetImage = slick.$slides.eq(index).find('img').attr('src')
        return '<span><img src=" ' + targetImage + ' "/></span>'
      },
    })
  }

  $(document).ajaxComplete(function (event, xhr, settings) {
    if (settings.url.indexOf('controller=product') > 0) {
      $('.list-images-mobile').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        dots: true,
        infinite: true,
        //centerMode: true,
        //fade: true,
        customPaging: function (slick, index) {
          var targetImage = slick.$slides.eq(index).find('img').attr('src')
          return '<span><img src=" ' + targetImage + ' "/></span>'
        },
      })
    }
  })

  //customSticky();

  $(document).ajaxComplete(function () {
    $('.p-reference .product-reference').html(
      $('#product-details .product-reference').clone(),
    )
    $('.p-reference .product-quantities').html(
      $('#product-details .product-quantities').clone(),
    )
  })
})

function customSticky() {
  var s = $('.header-top > .inner')
  var pos = s.offset()
  var alreadySticky = false

  $(window).scroll(function () {
    var windowpos = $(window).scrollTop()
    if (s.length) {
      if (!alreadySticky) {
        if (windowpos >= pos.top) {
          alreadySticky = true
          s.parent().height(s.height())
          s.removeClass('cus-nosticky')
          s.addClass('cus-sticky')
          $('body').removeClass('body-nosticky')
          $('body').addClass('body-sticky')
        }
      }
      if (alreadySticky) {
        if (windowpos < pos.top) {
          alreadySticky = false
          s.removeClass('cus-sticky')
          s.addClass('cus-nosticky')
          s.parent().removeAttr('style')
          $('body').addClass('body-nosticky')
          $('body').removeClass('body-sticky')
        }
      }
    }
  })
}

function onResize() {
  if ($(window).width() >= 769) {
    $('#search_filters_wrapper').collapse('show')
  }
}

;(function ($) {
  $(function () {
    var $myGroup = $('#search_filters .facet')
    $myGroup.on('show.bs.collapse', '.collapse', function () {
      $myGroup.find('.collapse.in').collapse('hide')
    })

    onResize()
  })

  $(window).resize($.debounce(250, onResize))

  $(document).click(function (event) {
    if ($(window).width() >= 769) {
      $('#search_filters .facet .collapse').collapse('hide')
    }
  })

  $(document).ready(function () {
    const aboveFiltersContainer = '[data-container="additional-filters"]'
    const currentFilterContainer = '[data-target="#facet_attribute_group_15"]'

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
  const swiperBlog = new Swiper('[data-swiper-blog]', {
    speed: 300,
    slidesPerView: 'auto',
    spaceBetween: 0,
    loop: true,
    navigation: {
      nextEl: '[data-swiper-blog-next]',
      prevEl: '[data-swiper-blog-prev]',
    },
  })

  const swiperAbout = new Swiper('[data-about-swiper]', {
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
})

$(document).ready(function () {
  const swiperPopular = new Swiper('.swiper-popular', {
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
})

$(document).ready(function () {
  // if(jQuery('.swiper-filters').length != 0){
  // 	const breakpoint = window.matchMedia('(max-width:768px)')

  // 	let swiperFilters;

  // 	const breakpointCheck = function () {
  // 		if (breakpoint.matches == true) {
  // 			if (typeof swiperFilters !== 'undefined') swiperFilters.destroy(true,true);
  // 		}
  // 		else if (breakpoint.matches == false) {
  // 			return enableSwiperFilter();

  // 		}
  // 	};

  // 	const enableSwiperFilter =function () {
  // 		swiperFilters = new Swiper('.swiper-filters', {
  // 			speed: 150,
  // 			roundLengths: true,
  // 			slidesPerView: 'auto',
  // 			freeMode: {
  // 				enabled: true,
  // 			},
  // 		});
  // 	}

  // 	breakpoint.addListener(breakpointCheck);
  // 	breakpointCheck();
  // }

  // prestashop.on("updateProductList", function(t) {
  // 	window.dispatchEvent(new Event('resize'));
  // 	enableSwiperFilter();
  // })

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

  window.addEventListener('resize', () => {
    productSwiper.slideTo(1, 300, false)
  })

  if (typeof prestashop !== 'undefined') {
    prestashop.on('updatedProduct', function (event) {
      let thumbSwiper = new Swiper('[data-swiper-product-thumb]', {
        slidesPerView: 'auto',
        spaceBetween: 0,
        slideClass: 'swiper-custom-slide',
        freeMode: true,
        watchSlidesProgress: true,
        navigation: {
          nextEl: '[data-swiper-product-thumb-next]',
          prevEl: '[data-swiper-product-thumb-prev]',
        },
      })

      let productSwiper = new Swiper('[data-swiper-product]', {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        navigation: {
          nextEl: '[data-swiper-product-next]',
          prevEl: '[data-swiper-product-prev]',
        },
        thumbs: {
          swiper: thumbSwiper,
        },
      })
      handleUpdateZoom(productSwiper)
    })
  }
})

function handleUpdateZoom(mainSwiper) {
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

function paginationGoTop() {
  $('.page-list a').click(function () {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    })
  })
}

$(document).ready(function () {
  paginationGoTop()
  prestashop.on('updateProductList', paginationGoTop)
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

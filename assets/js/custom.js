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
// $(document).ready(function () {
//   $("form#leosearchtopbox").on("submit", function (e) {
//     e.preventDefault();
//     var value = $(e.target).find("[name=search_query]").val();
//     $('#search_widget input[name="s"]').val(value);
//     $("#search_widget form").submit();
//   });
// });

//MODAL TRIGGER
$(document).ready(function () {
  $(".product-base-info").on("click", function () {
    $(".product-base-modal-background").show();
  });

  $(".product-base-modal button").on("click", function () {
    $(".product-base-modal-background").hide();
  });

  $(".product-dimension-info").on("click", function () {
    $(".product-dimension-modal-background").show();
  });

  $(".product-dimension-modal button").on("click", function () {
    $(".product-dimension-modal-background").hide();
  });
});

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
};

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
};

$(window).on("resize", function () {
  //DONGND:: fix zoom, only work at product page
  if (prestashop.page.page_name == "product") restartElevateZoom();

  //DONGND:: fix lost slider of modal when resize
  if (
    $("#product-modal .product-images").hasClass("slick-initialized") &&
    $("#product-modal .product-images").height() == 0
  ) {
    //DONGND:: setup slide for product thumb (modal)
    $("#product-modal .product-images").slick("unslick");
    $("#product-modal .product-images").hide();
    initSlickProductModal();
  }
});

$(document).ready(function () {
  floatHeader();
  //check page product only
  if (prestashop.page.page_name == "product") {
    innitSlickandZoom();
  }
  if (prestashop.page.page_name == "category") {
    setDefaultListGrid();
  }

  if (typeof products_list_functions != "undefined") {
    for (var i = 0; i < products_list_functions.length; i++) {
      products_list_functions[i]();
    }
  }

  //DONGND:: update for order page - tab adress, when change adress, block adress change class selected
  $(".address-item .radio-block").on("click", function () {
    if (!$(this).parents(".address-item").hasClass("selected")) {
      $(".address-item.selected").removeClass("selected");
      $(this).parents(".address-item").addClass("selected");
    }
  });

  //DONGND:: loading quickview
  actionQuickViewLoading();

  prestashop.on("updateProductList", function () {
    actionQuickViewLoading();
  });

  prestashop.on("updatedProduct", function () {
    if ($(".quickview.modal .product-thumb-images").length) {
      //DONGND:: run slick slider for product thumb - quickview
      initSlickProductQuickView();
    } else if ($(".product-detail .product-thumb-images").length) {
      //DONGND:: re-call setup slick when change attribute at product page
      innitSlickandZoom();
    }
  });

  //DONGND:: display modal by config
  if (typeof $("#content").data("templatemodal") != "undefined") {
    if (!$("#content").data("templatemodal")) {
      $('div[data-target="#product-modal"]').hide();
    }
  }
});

function innitSlickandZoom() {
  if ($("#main").hasClass("product-image-thumbs")) {
    //DONGND:: setup slide for product thumb (main)
    $(".product-detail .product-thumb-images").imagesLoaded(function () {
      if (typeof check_loaded_main_product != "undefined") {
        clearInterval(check_loaded_main_product);
      }

      check_loaded_main_product = setInterval(function () {
        if ($(".product-detail .product-thumb-images").height() > 0) {
          $(".product-detail .product-thumb-images").fadeIn();

          clearInterval(check_loaded_main_product);
          postion = $("#content").data("templateview");
          //DONGND:: add config for over 1200 extra large
          numberimage = $("#content").data("numberimage");
          numberimage1200 = $("#content").data("numberimage1200");
          numberimage992 = $("#content").data("numberimage992");
          numberimage768 = $("#content").data("numberimage768");
          numberimage576 = $("#content").data("numberimage576");
          numberimage480 = $("#content").data("numberimage480");
          numberimage360 = $("#content").data("numberimage360");

          if (postion !== "undefined") {
            initSlickProductThumb(
              postion,
              numberimage,
              numberimage1200,
              numberimage992,
              numberimage768,
              numberimage576,
              numberimage480,
              numberimage360
            );
          }
        }
      }, 300);
    });

    //DONGND:: setup slide for product thumb (modal)
    initSlickProductModal();
  }
  //call action zoom
  restartElevateZoom();
}

function restartElevateZoom() {
  $(".zoomContainer").remove();
  applyElevateZoom();
}

function applyElevateZoom() {
  if (
    $(window).width() <= 991 ||
    $("#content").data("templatezoomtype") == "none"
  ) {
    //DONGND:: remove elevateZoom on mobile
    if ($("#main").hasClass("product-image-gallery")) {
      if ($("img.js-thumb").data("elevateZoom")) {
        var ezApi = $("img.js-thumb").data("elevateZoom");
        ezApi.changeState("disable");
        $("img.js-thumb").unbind("touchmove");
      }
    } else {
      if ($("#zoom_product").data("elevateZoom")) {
        var ezApi = $("#zoom_product").data("elevateZoom");
        ezApi.changeState("disable");
        $("#zoom_product").unbind("touchmove");
      }
    }
    return false;
  }

  //check if that is gallery, zoom all thumb
  //DONGND:: fix zoom, create config
  var zt = $("#content").data("templatezoomtype");
  var zoom_cursor;
  var zoom_type;
  var scroll_zoom = false;
  var lens_FadeIn = 200;
  var lens_FadeOut = 200;
  var zoomWindow_FadeIn = 200;
  var zoomWindow_FadeOut = 200;
  var zoom_tint = false;
  var zoomWindow_Width = 400;
  var zoomWindow_Height = 400;
  var zoomWindow_Position = 1;

  if (zt == "in") {
    zoom_cursor = "crosshair";
    zoom_type = "inner";
    lens_FadeIn = false;
    lens_FadeOut = false;
  } else {
    zoom_cursor = "default";
    zoom_type = "window";
    zoom_tint = true;
    zoomWindow_Width = $("#content").data("zoomwindowwidth");
    zoomWindow_Height = $("#content").data("zoomwindowheight");

    if ($("#content").data("zoomposition") == "right") {
      //DONGND:: update position of zoom window with ar language
      if (prestashop.language.is_rtl == 1) {
        zoomWindow_Position = 11;
      } else {
        zoomWindow_Position = 1;
      }
    }
    if ($("#content").data("zoomposition") == "left") {
      //DONGND:: update position of zoom window with ar language
      if (prestashop.language.is_rtl == 1) {
        zoomWindow_Position = 1;
      } else {
        zoomWindow_Position = 11;
      }
    }
    if ($("#content").data("zoomposition") == "top") {
      zoomWindow_Position = 13;
    }
    if ($("#content").data("zoomposition") == "bottom") {
      zoomWindow_Position = 7;
    }

    if (zt == "in_scrooll") {
      //DONGND:: scroll to zoom does not work on IE
      var ua = window.navigator.userAgent;
      var old_ie = ua.indexOf("MSIE ");
      var new_ie = ua.indexOf("Trident/");
      if (old_ie > 0 || new_ie > 0) {
        // If Internet Explorer, return version number
        scroll_zoom = false;
      } // If another browser, return 0
      else {
        scroll_zoom = true;
      }
    }
  }

  if ($("#main").hasClass("product-image-gallery")) {
    lens_FadeIn = false;
    lens_FadeOut = false;
    zoomWindow_FadeIn = false;
    zoomWindow_FadeOut = false;
  }

  var zoom_config = {
    responsive: true,
    zoomResponsive: true,
    cursor: zoom_cursor,
    scrollZoom: scroll_zoom,
    scrollZoomIncrement: 0.1,
    zoomLevel: 1,
    zoomType: zoom_type,
    gallery: "thumb-gallery",
    lensFadeIn: lens_FadeIn,
    lensFadeOut: lens_FadeOut,
    zoomWindowFadeIn: zoomWindow_FadeIn,
    zoomWindowFadeOut: zoomWindow_FadeOut,
    zoomWindowWidth: zoomWindow_Width,
    zoomWindowHeight: zoomWindow_Height,
    borderColour: "#888",
    borderSize: 2,
    zoomWindowOffetx: 0,
    zoomWindowOffety: 0,
    zoomWindowPosition: zoomWindow_Position,
    tint: zoom_tint,
  };

  if ($("#main").hasClass("product-image-gallery")) {
    $("img.js-thumb").each(function () {
      var parent_e = $(this).parent();
      $(this).attr("src", parent_e.data("image"));
      $(this).data("type-zoom", parent_e.data("zoom-image"));
    });

    if ($.fn.elevateZoom !== undefined) {
      $("img.js-thumb").elevateZoom(zoom_config);
      //DONGND:: fix click a thumb replace all image and add fancybox
      $("img.js-thumb").on("click", function (e) {
        var ez = $(this).data("elevateZoom");
        $.fancybox(ez.getGalleryList());
        return false;
      });
    }
  } else {
    if ($.fn.elevateZoom !== undefined) {
      $("[data-zoom-container]").elevateZoom({ gallery: "thumb-gallery" });

      //pass the images to Fancybox
      $("[data-zoom-container]").on("click", function (e) {
        var ez = $(this).data("elevateZoom");
        $.fancybox(ez.getGalleryList());
        return false;
      });
    }
  }

  prestashop.on("updatedProduct", function (event) {
    if ($("#main").hasClass("product-image-gallery")) {
      $("img.js-thumb").each(function () {
        var parent_e = $(this).parent();
        $(this).attr("src", parent_e.data("image"));
        $(this).data("type-zoom", parent_e.data("zoom-image"));
      });

      if ($.fn.elevateZoom !== undefined) {
        $("img.js-thumb").elevateZoom(zoom_config);
        //DONGND:: fix click a thumb replace all image and add fancybox
        $("img.js-thumb").on("click", function (e) {
          var ez = $(this).data("elevateZoom");
          $.fancybox(ez.getGalleryList());
          return false;
        });
      }
    } else {
      if ($.fn.elevateZoom !== undefined) {
        $("[data-zoom-container]").elevateZoom({ gallery: "thumb-gallery" });

        //pass the images to Fancybox
        $("[data-zoom-container]").on("click", function (e) {
          var ez = $(this).data("elevateZoom");
          $.fancybox(ez.getGalleryList());
          return false;
        });
      }
    }
  });
}

function initSlickProductThumb(
  postion,
  numberimage,
  numberimage1200,
  numberimage992,
  numberimage768,
  numberimage576,
  numberimage480,
  numberimage360
) {
  var vertical = true;
  var verticalSwiping = true;
  //DONGND:: update for rtl
  var slick_rtl = false;

  if (postion == "bottom") {
    vertical = false;
    verticalSwiping = false;
  }

  if (postion == "none") {
    vertical = false;
    verticalSwiping = false;
    numberimage =
      numberimage1200 =
      numberimage992 =
      numberimage768 =
      numberimage576 =
      numberimage480 =
      numberimage360 =
        1;
  }

  //DONGND:: update for rtl
  if (!vertical && prestashop.language.is_rtl == 1) {
    slick_rtl = true;
  }

  var slider = $("#thumb-gallery");

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
  });
  $("#thumb-gallery").show();

  if (postion == "none") {
    var slickInstance = slider[0];
    var slides = $(slickInstance.slick.$slides);
    var positionStart = findPosition(slides);
    var slideCount = slickInstance.slick.slideCount;

    //DONGND:: update slick for case without thubms
    if (positionStart + 1 == slideCount) {
      $(".arrows-product-fake .slick-next").addClass("slick-disabled");
    } else if (positionStart == 0) {
      $(".arrows-product-fake .slick-prev").addClass("slick-disabled");
    }

    // active image first load
    slider.slick("slickGoTo", positionStart);

    $(".arrows-product-fake .slick-next").on("click", function () {
      if (!$(this).hasClass("slick-disabled")) {
        $(".arrows-product-fake .slick-prev").removeClass("slick-disabled");
        var positionCurrent = findPosition(slides);
        if (positionCurrent + 1 < slideCount) {
          $(slides[positionCurrent]).removeClass("active");
          $(slides[positionCurrent + 1]).addClass("active");
          $(slides[positionCurrent + 1])
            .find("img")
            .trigger("click");
          slider.slick("slickNext");
          if (positionCurrent + 1 == slideCount - 1) {
            $(this).addClass("slick-disabled");
          }
        }
      }
    });

    $(".arrows-product-fake .slick-prev").on("click", function () {
      if (!$(this).hasClass("slick-disabled")) {
        $(".arrows-product-fake .slick-next").removeClass("slick-disabled");
        var positionCurrent = findPosition(slides);
        if (positionCurrent > 0) {
          $(slides[positionCurrent]).removeClass("active");
          $(slides[positionCurrent - 1]).addClass("active");
          $(slides[positionCurrent - 1])
            .find("img")
            .trigger("click");
          slider.slick("slickPrev");
          if (positionCurrent - 1 == 0) {
            $(this).addClass("slick-disabled");
          }
        }
      }
    });
  }
}

function findPosition(slides) {
  var position;
  for (var i = 0; i < slides.length; i++) {
    if ($(slides[i]).hasClass("active")) {
      position = $(slides[i]).data("slick-index");
      return position;
    }
  }
}

//DONGND:: loading quickview
function actionQuickViewLoading() {
  $(".quick-view").on("click", function () {
    if (!$(this).hasClass("active")) {
      $(this).addClass("active");
      $(this).find(".leo-quickview-bt-loading").css({ display: "block" });
      $(this).find(".leo-quickview-bt-content").hide();
      if (typeof check_active_quickview != "undefined") {
        clearInterval(check_active_quickview);
      }

      check_active_quickview = setInterval(function () {
        if ($(".quickview.modal").length) {
          $(".quickview.modal").on("hide.bs.modal", function (e) {
            $(".quick-view.active").find(".leo-quickview-bt-loading").hide();
            $(".quick-view.active").find(".leo-quickview-bt-content").show();
            $(".quick-view.active").removeClass("active");
          });
          clearInterval(check_active_quickview);

          //DONGND:: run slick for product thumb - quickview
          initSlickProductQuickView();
        }
      }, 300);
    }
  });
}

$(document).on("click", ".leo_grid", function (e) {
  e.preventDefault();
  $("#js-product-list .product_list").removeClass("list");
  $("#js-product-list .product_list").addClass("grid");

  $(this).parent().find(".leo_list").removeClass("selected");
  $(this).addClass("selected");

  var configName = LEO_COOKIE_THEME + "_grid_list";
  $.cookie(configName, "grid", { expires: 1, path: "/" });
});

$(document).on("click", ".leo_list", function (e) {
  e.preventDefault();
  $("#js-product-list .product_list").removeClass("grid");
  $("#js-product-list .product_list").addClass("list");

  $(this).parent().find(".leo_grid").removeClass("selected");
  $(this).addClass("selected");

  var configName = LEO_COOKIE_THEME + "_grid_list";
  $.cookie(configName, "list", { expires: 1, path: "/" });
});

function setDefaultListGrid() {
  if ($.cookie(LEO_COOKIE_THEME + "_grid_list") == "grid") {
    $(".leo_grid").trigger("click");
  }
  if ($.cookie(LEO_COOKIE_THEME + "_grid_list") == "list") {
    $(".leo_list").trigger("click");
  }
}

function processFloatHeader(headerAdd, scroolAction) {
  //DONGND:: hide search result when enable float header
  if ($(".ac_results").length) {
    $(".ac_results").hide();
  }

  if (headerAdd) {
    $("#header").addClass("navbar-fixed-top");
    var hideheight = $("#header").height() + 120;
    $("#page").css("padding-top", $("#header").height());
    setTimeout(function () {
      $("#page").css("padding-top", $("#header").height());
    }, 200);
  } else {
    $("#header").removeClass("navbar-fixed-top");
    $("#page").css("padding-top", "");
  }

  var pos = $(window).scrollTop();
  if (scroolAction && pos >= hideheight) {
    $(".header-nav").addClass("hide-bar");
    $(".hide-bar").css("margin-top", -$(".header-nav").height());
    $("#header").addClass("mini-navbar");
  } else {
    $(".header-nav").removeClass("hide-bar");
    $(".header-nav").css("margin-top", 0);
    $("#header").removeClass("mini-navbar");
  }
}

//Float Menu
function floatHeader() {
  if (!$("body").hasClass("keep-header") || $(window).width() <= 990) {
    return;
  }

  $(window).resize(function () {
    if ($(window).width() <= 990) {
      processFloatHeader(0, 0);
    } else if ($(window).width() > 990) {
      if ($("body").hasClass("keep-header")) processFloatHeader(1, 1);
    }
  });
  var headerScrollTimer;

  $(window).on("scroll", function () {
    if (headerScrollTimer) {
      window.clearTimeout(headerScrollTimer);
    }

    headerScrollTimer = window.setTimeout(function () {
      if (!$("body").hasClass("keep-header")) return;
      if ($(window).width() > 990) {
        processFloatHeader(1, 1);
      }
    }, 100);
  });
}

//DONGND:: build slick slider for quickview
function initSlickProductQuickView() {
  $(".quickview.modal .product-thumb-images").imagesLoaded(function () {
    if (typeof check_loaded_thumb_quickview != "undefined") {
      clearInterval(check_loaded_thumb_quickview);
    }
    check_loaded_thumb_quickview = setInterval(function () {
      if ($(".quickview.modal .product-thumb-images").height() > 0) {
        $(".quickview.modal .product-thumb-images").fadeIn();

        clearInterval(check_loaded_thumb_quickview);
        $(".quickview.modal .product-thumb-images").slick(options_quickview);
      }
    }, 300);
  });
}

//DONGND:: build slick slider for modal - product page
function initSlickProductModal() {
  $("#product-modal .product-images").imagesLoaded(function () {
    if (typeof check_loaded_thumb_modal != "undefined") {
      clearInterval(check_loaded_thumb_modal);
    }
    check_loaded_thumb_modal = setInterval(function () {
      if ($("#product-modal .product-images").height() > 0) {
        $("#product-modal .product-images").fadeIn();

        clearInterval(check_loaded_thumb_modal);
        $("#product-modal .product-images").slick(options_modal_product_page);
      }
    }, 300);
  });
}

//DONGND: fix base prestashop

//Fix translate button choose file to upload: change "Choose file" to choosefile_text
//Fix filter (category page) does not work on IE change dataset.searchUrl to getAttribute('data-search-url')

$().ready(function () {
  $("#leo_search_block_top .title_block").on("click", function () {
    $(this).parent().toggleClass("active");
    setTimeout(function () {
      jQuery("#leo_search_block_top.active input.form-control").trigger(
        "focus"
      );
    }, 100);
  });

  $(document).on("keydown", function (e) {
    // ESCAPE key pressed
    if (e.keyCode == 27) {
      $("#leo_search_block_top").removeClass("active");
    }
  });

  $(document).on("click", function (event) {
    if (!$(event.target).closest("#leo_search_block_top").length) {
      $("#leo_search_block_top").removeClass("active");
    }
  });

  $(document).ajaxComplete(function () {
    $(".p-reference .product-reference").html(
      $("#product-details .product-reference").clone()
    );
    $(".p-reference .product-quantities").html(
      $("#product-details .product-quantities").clone()
    );
  });
});

function customSticky() {
  var s = $(".header-top > .inner");
  var pos = s.offset();
  var alreadySticky = false;

  $(window).on("scroll", function () {
    var windowpos = $(window).scrollTop();
    if (s.length) {
      if (!alreadySticky) {
        if (windowpos >= pos.top) {
          alreadySticky = true;
          s.parent().height(s.height());
          s.removeClass("cus-nosticky");
          s.addClass("cus-sticky");
          $("body").removeClass("body-nosticky");
          $("body").addClass("body-sticky");
        }
      }
      if (alreadySticky) {
        if (windowpos < pos.top) {
          alreadySticky = false;
          s.removeClass("cus-sticky");
          s.addClass("cus-nosticky");
          s.parent().removeAttr("style");
          $("body").addClass("body-nosticky");
          $("body").removeClass("body-sticky");
        }
      }
    }
  });
}

(function ($) {

  $(document).ready(function () {
    const aboveFiltersContainer = '[data-container="additional-filters"]';
    const currentFilterContainer = '[data-target="#facet_attribute_group_18"]';

    $(document).ajaxComplete(function () {
      if ($(currentFilterContainer).length !== 0) {
        moveFilters($(currentFilterContainer), $(aboveFiltersContainer));
      } else {
        $(aboveFiltersContainer).empty();
      }
    });

    if ($(currentFilterContainer).length !== 0) {
      moveFilters($(currentFilterContainer), $(aboveFiltersContainer));
    } else {
      $(aboveFiltersContainer).empty();
    }

    $(document).on(
      "click",
      aboveFiltersContainer + " a.js-search-link",
      function (e) {
        e.preventDefault();
        $(document)
          .find(
            currentFilterContainer +
              ' a[href^="' +
              e.currentTarget.href +
              '"].js-search-link'
          )
          .trigger("click");
      }
    );
  });

  function moveFilters(current, target) {
    const elements = current.next().children();
    target.empty();
    target.append(elements.clone());
  }

  //Filters custom move-end

  $(window).on("load", function () {
    $(".category-top-menu a").each(function (t, el) {
      $(this).data("link", $(el).attr("href"));
    });

    jQuery(".category-top-menu a").each(function (t, el) {
      jQuery(el).attr(
        "href",
        jQuery(el).data("link") +
          window.location.href.replace(prestashop.page.canonical, "")
      );
    });

    // prestashop.on("updateFacets", (param) => {
    //   jQuery(".category-top-menu a").each(function (t, el) {
    //     jQuery(el).attr(
    //       "href",
    //       jQuery(el).data("link") +
    //         "?" +
    //         param.substring(param.indexOf("?") + 1)
    //     );
    //   });
    // });

    if ($("#cart").length) {
      $('#cart [data-toggle="popover"]').popover();

      $("[data-sticky-height-target").attr(
        "style",
        "top: " + $("[data-sticky-height-source]").outerHeight(true) + "px"
      );
    }
  });

  if (
    $('#checkout-guest-form [data-field="password"]').value !== "" &&
    prestashop.customer.is_logged
  ) {
    prestashop.customer.is_guest_logged = true;
  }
  $("body").on(
    "change",
    '#checkout-guest-form [data-field="password"]',
    function (e) {
      if (this.value !== "" && prestashop.customer.is_logged) {
        prestashop.customer.is_guest_logged = true;
      }
    }
  );

  $("body").on("change", "#delivery_message", function () {
    $.post(
      $("#js-summary").attr("[data-url-update]"),
      $("#js-summary").serialize(),
      null,
      "json"
    );
  });

  $("body").on("click", "#payment-confirmation button", function () {
    $.post(
      $("#js-summary").attr("[data-url-update]"),
      $("#js-summary").serialize(),
      null,
      "json"
    );
  });

  $("body").on(
    "click",
    '[href="#checkout-guest-form"], [href="#checkout-register-form"]',
    function (e) {
      e.preventDefault();
      $("[data-login-panel]").hide();
      $('[data-js-elem="cart"]').removeClass("hidden");
    }
  );

  $("body").on("click", '[href="#checkout-register-form"]', function (e) {
    e.preventDefault();
    if (!prestashop.customer.is_guest_logged) {
      $('#checkout-guest-form [data-field="password"]').show();
      // $('[data-js-elem="cart"]').removeClass('hidden')
    }
  });

  $("body").on("click", '[href="#checkout-login-panel"]', function (e) {
    e.preventDefault();
    $("[data-login-panel]").show();
    $('[data-js-elem="cart"]').addClass("hidden");
  });

  $("body").on("click", '[href="#checkout-guest-form"]', function (e) {
    e.preventDefault();
    $('#checkout-guest-form [data-field="password"]').hide();
  });

  $("body").on("click", ".js-edit-addresses", (event) => {
    event.stopPropagation();
    $("#checkout-delivery-step").trigger("click");
    prestashop.emit("editAddress");
  });

  if (
    $("#checkout-payment-step").find('[name="payment-option"]:checked').length
  ) {
    $("[data-checkout-payment]").attr("disabled", false);
  }

  $("body").on("change", '[name="payment-option"]', function (e) {
    if (
      $("#checkout-payment-step").find('[name="payment-option"]:checked').length
    ) {
      $("[data-checkout-payment]").attr("disabled", false);
    }
  });

  $("body").on("click", "[data-checkout-payment]", function (e) {
    e.preventDefault();
    var formButton = $("#checkout-payment-step")
      .find("input[name='payment-option']:checked")
      .parent()
      .parent()
      .find("form button");
    if (formButton.length) {
      $("#checkout-payment-step")
        .find("input[name='payment-option']:checked")
        .parent()
        .parent()
        .find("form button")
        .trigger("click");
    } else {
      $("#checkout-summary-step").trigger("click");
    }
  });

  $("body").on("click", "[data-checkout-back]", function (e) {
    e.preventDefault();
    $($(this).data("checkoutBack")).trigger("click");
    window.scrollTo(0, 0);
  });
})(jQuery);

//Top bar swiper
$(document).ready(function () {
  if ($("[data-swiper-blog]").length) {
    new Swiper("[data-swiper-blog]", {
      preloadImages: true,
      lazy: {
        loadOnTransitionStart: true,
        checkInView: true,
        loadPrevNextAmount: 2,
      },
      speed: 300,
      slidesPerView: "auto",
      spaceBetween: 0,
      loop: true,
      navigation: {
        nextEl: "[data-swiper-blog-next]",
        prevEl: "[data-swiper-blog-prev]",
      },
    });
  }

  if ($("[data-about-swiper]").length) {
    new Swiper("[data-about-swiper]", {
      preloadImages: true,
      lazy: {
        loadOnTransitionStart: true,
        checkInView: true,
        loadPrevNextAmount: 6,
      },
      speed: 300,
      slidesPerView: "auto",
      resistanceRatio: 0.5,
      breakpoints: {
        768: {
          slidesPerView: 3,
          slidesPerGroup: 3,
          slidesPerColumn: 2,
          slidesPerColumnFill: "row",
          allowTouchMove: false,
        },
      },
      on: {
        reachEnd: function () {
          this.snapGrid = [...this.slidesGrid];
        },
      },
    });
  }
});

function openMenuWithCategory(id) {
  var menu_el = $(".off-canvas-nav-megamenu")
    .find("[data-category-id=" + id + "]")
    .first();
  var menu_id = menu_el.parents("[data-megamenu-id]").data("megamenu-id");

  if (!menu_el.length) {
    menu_el = $('.off-canvas-nav-megamenu [data-menu-type="category"].active')
      .first()
      .addClass("open");
    if (!menu_el.hasClass("open-sub")) {
      menu_el.children(".dropdown-toggle").trigger("click");
    }
    menu_id = menu_el.parents("[data-megamenu-id]").data("megamenu-id");
    menu_el = $(".off-canvas-nav-megamenu")
      .find("[data-header-category-id=" + id + "]")
      .first();
    if (menu_el.length) {
      if ($(menu_el).parent().hasClass("widget-closed")) {
        $(menu_el).trigger("click");
      }
    }
  }

  if (menu_el.length) {
    menu_id = menu_el.parents("[data-megamenu-id]").data("megamenu-id");

    if (
      $(menu_el).parent().hasClass("level2") &&
      !$(menu_el).parent().hasClass("open-sub")
    ) {
      $(menu_el).next(".caret").trigger("click");
    }

    if (
      $(menu_el).parent().hasClass("level3") &&
      !$(menu_el).parent().hasClass("open-sub")
    ) {
      if ($(menu_el).parent().parent().hasClass("level2")) {
        $(menu_el).parent().parent().find(".caret").trigger("click");
      }
      if (
        $(menu_el).parent().parent().parent().hasClass("level2") &&
        !$(menu_el).parent().parent().parent().hasClass("open-sub")
      ) {
        $(menu_el).parent().parent().parent().find(".caret").trigger("click");
      }
    }
  }
  if (
    menu_el.parents(".dropdown").each(function (i, item) {
      if (!$(item).hasClass("open-sub")) {
        $(item).children(".dropdown-toggle").trigger("click");
      }
    })
  );

  var currentCatId = $("[data-current-category-id]")
    .first()
    .data("currentCategoryId");
  menu_el = $(".off-canvas-nav-megamenu")
    .find("[data-category-id=" + currentCatId + "]")
    .first()
    .addClass("text-main");
  if ($(menu_el).parent().hasClass("level2")) {
    $(menu_el)
      .next(".caret")
      .removeClass("text-main-dark")
      .addClass("text-main");
  }

  if (
    $(menu_el).parent().hasClass("level2") ||
    $(menu_el).parent().hasClass("level3")
  ) {
    $(".off-canvas-nav-megamenu")
      .find("[data-category-id=" + currentCatId + "]")
      .parent()
      .parent()
      .parent()
      .each(function () {
        if (!$(this).hasClass("hidden")) {
          if (
            $(this)
              .closest(".widget-dropdown_container")
              .hasClass("widget-closed")
          ) {
            $(this)
              .closest(".widget-dropdown_container")
              .children(".dropdown-widget")
              .click();
          }
        }
      });

    $(menu_el).removeClass("text-main-dark").addClass("text-main");

    if ($(menu_el).parent().parent().hasClass("level2")) {
      $(menu_el)
        .parent()
        .parent()
        .children("a")
        .removeClass("text-main-dark")
        .addClass("text-main");
    }
    if ($(menu_el).parent().parent().parent().hasClass("level2")) {
      $(menu_el)
        .parent()
        .parent()
        .parent()
        .children("a")
        .removeClass("text-main-dark")
        .addClass("text-main");
    }
  }

  if (!menu_el.length) {
    menu_el = $('.off-canvas-nav-megamenu [data-menu-type="category"].active');
  }

  $('[data-target=".megamenu-off-canvas-' + menu_id + '"]')
    .first()
    .trigger("click");

  setTimeout(() => {
    document
      .querySelector(".off-canvas-nav-megamenu .open-sub")
      .scrollIntoView(true);
  }, 175);
}

$(document).ready(function () {
  var delayValue = $(".swiper-banner .swiper-slide").attr("data-pausetime");
  if (delayValue == undefined || delayValue == "") {
    delayValue = 2000;
  }

  const swiperBanner = new Swiper(".swiper-banner", {
    preloadImages: false,
    lazy: {
      loadOnTransitionStart: true,
      checkInView: true,
    },
    speed: 800,
    slidesPerView: 1,
    spaceBetween: 0,
    loop: true,
    autoplay: {
      delay: delayValue,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      prevEl: ".swiper_banner-button-prev",
      nextEl: ".swiper_banner-button-next",
    },
  });
});

$(document).ready(function () {
  if ($(".swiper-popular").length) {
    new Swiper(".swiper-popular", {
      preloadImages: false,
      lazy: {
        loadOnTransitionStart: true,
        checkInView: true,
      },
      speed: 300,
      slidesPerView: 2,
      spaceBetween: 20,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
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
      on: {
        beforeSlideChangeStart: function () {
          if (typeof lazyLoad == "function") {
            lazyLoad("[data-lazy]");
          }
        },
      },
    });
  }
});

$(document).ready(function () {
  if ($("[data-swiper-product]").length) {
    let productSwiper = new Swiper("[data-swiper-product]", {
      preloadImages: false,
      lazy: {
        loadOnTransitionStart: true,
        checkInView: true,
      },
      slidesPerView: 1,
      spaceBetween: 20,
      loop: true,
      navigation: {
        nextEl: "[data-swiper-product-next]",
        prevEl: "[data-swiper-product-prev]",
      },
      pagination: {
        el: ".product-thumb-images-pag",
        clickable: true,
        dynamicBullets: true,
        dynamicMainBullets: 1,
      },
      on: {
        beforeSlideChangeStart: function () {
          if (typeof lazyLoad == "function") {
            lazyLoad("[data-lazy]");
          }
        },
      },
    });

    productSwiper.on('touchStart', () => {
      let zoomRatio = ( window.outerWidth / window.innerWidth) * 100;
      if (window.innerWidth < 768 && zoomRatio.toFixed() > 100) {
        productSwiper.allowTouchMove = false
      }else{
        productSwiper.allowTouchMove = true
      }
    })

    if ($("#main").hasClass("product-image-gallery")) {
      $("img.js-thumb").each(function () {
        var parent_e = $(this).parent();
        $(this).attr("src", parent_e.data("image"));
        $(this).data("type-zoom", parent_e.data("zoom-image"));
      });

      if ($.fn.elevateZoom !== undefined) {
        $("img.js-thumb").elevateZoom(zoom_config);
        //DONGND:: fix click a thumb replace all image and add fancybox
        $("img.js-thumb").on("click", function (e) {
          var ez = $(this).data("elevateZoom");
          $.fancybox(ez.getGalleryList());
          return false;
        });
      }
    } else {
      if ($.fn.elevateZoom !== undefined) {
        $("[data-zoom-container]").elevateZoom({ gallery: "thumb-gallery" });

        //pass the images to Fancybox
        $("[data-zoom-container]").on("click", function (e) {
          var ez = $(this).data("elevateZoom");
          $.fancybox(ez.getGalleryList());
          return false;
        });
      }
    }

    handleUpdateZoom(productSwiper);
  }

  if (typeof prestashop !== "undefined") {


    prestashop.on("updatedProduct", function (event) {
      if (typeof productSwiper == "function") {
        productSwiper.destroy(true, true);
      }

      if ($("[data-swiper-product]").length) {
        let productSwiper = new Swiper("[data-swiper-product]", {
          preloadImages: true,
          lazy: true,
          slidesPerView: 1,
          spaceBetween: 20,
          loop: true,
          navigation: {
            nextEl: "[data-swiper-product-next]",
            prevEl: "[data-swiper-product-prev]",
          },
          pagination: {
            el: ".product-thumb-images-pag",
            clickable: true,
            dynamicBullets: true,
            dynamicMainBullets: 1,
          },
          on: {
            beforeSlideChangeStart: function () {
              if (typeof lazyLoad == "function") {
                lazyLoad("[data-lazy]");
              }
            },
          },
        });

        productSwiper.on('touchStart', () => {
          let zoomRatio = ( window.outerWidth / window.innerWidth) * 100;
          if (window.innerWidth < 768 && zoomRatio.toFixed() > 100) {
            productSwiper.allowTouchMove = false
          }else{
            productSwiper.allowTouchMove = true
          }
        })

        if ($("#main").hasClass("product-image-gallery")) {
          $("img.js-thumb").each(function () {
            var parent_e = $(this).parent();
            $(this).attr("src", parent_e.data("image"));
            $(this).data("type-zoom", parent_e.data("zoom-image"));
          });

          if ($.fn.elevateZoom !== undefined) {
            $("img.js-thumb").elevateZoom(zoom_config);
            //DONGND:: fix click a thumb replace all image and add fancybox
            $("img.js-thumb").on("click", function (e) {
              var ez = $(this).data("elevateZoom");
              $.fancybox(ez.getGalleryList());
              return false;
            });
          }
        } else {
          if ($.fn.elevateZoom !== undefined) {
            $("[data-zoom-container]").elevateZoom({
              gallery: "thumb-gallery",
            });

            //pass the images to Fancybox
            $("[data-zoom-container]").on("click", function (e) {
              var ez = $(this).data("elevateZoom");
              $.fancybox(ez.getGalleryList());
              return false;
            });
          }
        }

        handleUpdateZoom(productSwiper);
      }
    });
  }
  handleFancyboxSwipe();
});

function handleFancyboxSwipe() {
  let startX;
  let endX;
  let cancelSwipe = false
  const swipeDistance = 200

  $(document).on("mousedown touchstart", ".fancybox-outer", function (event) {
    if (event.type == "touchstart") {
      startX = event.touches[0].clientX;
    } else {
      startX = event.clientX;
    }
  });

  $(document).on("touchmove", ".fancybox-outer", function (event) {
    if (event.touches.length > 1) {
      cancelSwipe = true
    }else{
      cancelSwipe = false
    }
  });

  $(document).on("mouseup touchend", ".fancybox-outer", function (event) {
    if (event.type == "touchend") {
      endX = event.changedTouches[0].clientX;
    } else {
      endX = event.clientX;
    }    

    let distance = endX - startX;
    let fancybox = $.fancybox;

    let zoomRatio = ( window.outerWidth / window.innerWidth) * 100;
    if (window.innerWidth < 768 && zoomRatio.toFixed() > 100) {
      cancelSwipe = true
    }else{
      cancelSwipe = false
    }

    if ((Math.abs(distance) > swipeDistance) && !cancelSwipe) {
      if (distance > 0) {
        fancybox.outer.trigger("swiperight");
        fancybox.prev();
      } else {
        fancybox.outer.trigger("swipeleft");
        fancybox.next();
      }
    }
  });
}

function handleUpdateZoom(swiper) {
  updateZoom(swiper)
  window.addEventListener('resize',() =>{
    updateZoom(swiper)
  })
  swiper.on("activeIndexChange", () => updateZoom(swiper));
}

function updateZoom(swiper){
  // replace zoom realIndex
  let activeElement = $(swiper.wrapperEl)
  .find(`[data-swiper-slide-index=${swiper.realIndex}]`)
  .eq(0);
  let activeImageUrl = activeElement.attr("src");
  $(".zoomWindowContainer div").css(
  "background-image",
  `url(${activeImageUrl})`
  );

  //set zoomGallery active slide
  $("#thumb-gallery")
  .find(".swiper-custom-slide a")
  .eq(swiper.realIndex)
  .trigger("click");
}

function paginationGoTop() {
  $("#pagination-links a").on("click", function () {
    window.scrollTo({
      top: 0,
    });
  });
}
$(document).ready(function () {
  paginationGoTop();
  prestashop.on("updateProductList", paginationGoTop);
});

$(document).ready(function () {
  if ($("#checkout").length != 0) {
    let currentStep = $(".js-current-step .step-number").text();
    if (currentStep == 1) {
      if ($("[data-login-panel]").is(":visible")) {
        $('[data-js-elem="cart"]').addClass("hidden");
        $("#checkout-guest-form").addClass("hidden");
      }
    } else {
      $('[data-js-elem="cart"]').removeClass("hidden");
      $("#checkout-guest-form").removeClass("hidden");
    }

    prestashop.on("changedCheckoutStep", function () {
      currentStep = $(".js-current-step .step-number").text();
      if (currentStep == 1) {
        if ($("[data-login-panel]").is(":visible")) {
          $('[data-js-elem="cart"]').addClass("hidden");
          $("#checkout-guest-form").addClass("hidden");
        }
      } else {
        $('[data-js-elem="cart"]').removeClass("hidden");
        $("#checkout-guest-form").removeClass("hidden");
      }
    });

    if ($("[data-field]").filter(".has-error").length) {
      $("[data-login-panel]").hide();
      $('[data-js-elem="cart"]').removeClass("hidden");
      $("#checkout-guest-form").removeClass("hidden");
    }
  }
});

$(document).ready(function () {
  if ($('#checkout [name="postcode"]').length != 0) {
    $('#checkout [name="postcode"]').mask("99-999");
  }
});

$(document).ready(function () {
  let swiperOptions = {
    preloadImages: false,
    speed: 400,
    spaceBetween: 20,
    slidesPerView: "auto",
    rewind: true,
    slideClass: "slide",
    allowTouchMove: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets: true,
      dynamicMainBullets: 1,
    },
    breakpoints: {
      1200: {
        slidesPerView: 4,
      },
    },
    on: {
      beforeSlideChangeStart: function () {
        if (typeof lazyLoad == "function") {
          lazyLoad("[data-lazy]");
        }
      },
    },
  };

  if ($("[data-swiper-carousel]").length != 0) {
    new Swiper("[data-swiper-carousel]", swiperOptions);
  }

  if (typeof prestashop !== "undefined") {
    prestashop.on("updateProductList", function (event) {
      if ($("[data-swiper-carousel]").length != 0) {
        new Swiper("[data-swiper-carousel]", swiperOptions);
      }
    });
  }

  if ($("[data-swiper-carousel]").length != 0) {
    new Swiper("[data-swiper-carousel]", {
      preloadImages: false,
      speed: 400,
      spaceBetween: 20,
      slidesPerView: "auto",
      rewind: true,
      slideClass: "slide",
      allowTouchMove: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
        dynamicMainBullets: 1,
      },
      breakpoints: {
        1200: {
          slidesPerView: 4,
        },
      },
      on: {
        beforeSlideChangeStart: function () {
          if (typeof lazyLoad == "function") {
            lazyLoad("[data-lazy]");
          }
        },
      },
    });
  }
});

$(document).ready(function () {
  $(".dropdown-widget").on("click", function () {
    if ($(this).parent().hasClass("widget-closed")) {
      $(this).siblings(".dropdown-widget-inner").slideDown("fast");
    } else if ($(this).parent().hasClass("widget-opened")) {
      $(this).siblings(".dropdown-widget-inner").slideUp("fast");
    }
    $(this).parent().toggleClass("widget-closed widget-opened");
  });

  $('.megamenu li[data-menu-type="category"]')
    .last()
    .find(".dropdown-menu-inner")
    .addClass(
      "border-0 border-b-[10px] tablet-medium:border-b-0 border-solid border-gray-1000"
    );
});


$(document).ready(function () {

  const filterModal = document.querySelector('#search_filters_modal')
  const filterBtn = document.querySelector('#search_filters_toggler')
  const filterModalCloseBtns = document.querySelectorAll('[data-filters-modal-close]')
  
  initModalToggle(filterModal,filterBtn,filterModalCloseBtns)

  const sortModal = document.querySelector('#search_sort_modal')
  const sortBtn = document.querySelector('#search_sort_toggler')
  const sortModalCloseBtns = document.querySelectorAll('[data-sort-modal-close]')

  initModalToggle(sortModal,sortBtn,sortModalCloseBtns)
   
});

function openModal(modalElement,openBtnElement){
  modalElement.classList.add('active')
  openBtnElement.classList.add('!border-main')
}

function closeModal(modalElement,openBtnElement){
  modalElement.classList.remove('active')
  openBtnElement.classList.remove('!border-main')
}

function isModalActive(modalElement){
  return modalElement.classList.contains('active')
}

const customModals = []
function initModalToggle(modalElement,openBtnElement,closeBtnElements){   
  if (openBtnElement && modalElement && closeBtnElements) {
    openBtnElement.addEventListener('click',()=>{
      if (isModalActive(modalElement)) {
        return closeModal(modalElement,openBtnElement)        
      }

      let activeModals = customModals.filter(item => isModalActive(item.modal))
      if (activeModals.length > 0) {
        activeModals.forEach(item=>{
          closeModal(item.modal,item.openBtn)
        });

        setTimeout(()=>{
          openModal(modalElement,openBtnElement)
        },300);

        return
      }

      openModal(modalElement,openBtnElement)
      
    });
    
    closeBtnElements.forEach(button => {
      button.addEventListener('click',()=>{
        closeModal(modalElement,openBtnElement)
      });
    })

    customModals.push({modal: modalElement, openBtn:openBtnElement})
  }
}

$(document).ready(function(){
  const filterButtonsContainer = document.querySelector('[data-filters-buttons-container]')
  if (filterButtonsContainer) {
    const observer = new IntersectionObserver( 
      ([e]) => e.target.classList.toggle('shadow-[0px_4px_4px_rgba(0,0,0,0.1)]', e.intersectionRatio < 1),
      {
        threshold: [1],
        rootMargin: "51px 0px 0px 0px"
      }
    );

    observer.observe(filterButtonsContainer)
  }
  
  const productsList = document.querySelector('.products')
  
  if (productsList) {
    handleModalsOffset(productsList)
    
    window.addEventListener('scroll',()=>{
      handleModalsOffset(productsList)
    });

    window.addEventListener('resize',()=>{
      handleModalsOffset(productsList)
    });
  }
})

function handleModalsOffset(container){
  let containerOffset = container.getBoundingClientRect().bottom

  customModals.forEach(item=>{
    if (window.innerHeight > containerOffset) {
      item.modal.style.top = containerOffset - window.innerHeight + 'px'
    }else{
      item.modal.style.top = '0px'
    }
  })

}

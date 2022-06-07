/**
 * This is main js file. Don't edit the file if you want to update module in future.
 *
 * @author    Globo Jsc <contact@globosoftware.net>
 * @copyright 2016 Globo., Jsc
 * @license   please read license in file license.txt
 * @link	     http://www.globosoftware.net
 */

var Globo = {
  getListInsTaged: function (loadmore, gposition) {
    var embed_id = jQuery(gposition).attr('data-idEmbed')
    /* var urlc = 'index.php?fc=module&module=g_productinstagram&controller=instagram&action=getAllTaged&embed_id='+embed_id; */
    var urlc =
      'index.php?fc=module&module=g_productinstagram&controller=instagram'
    /* hien globo fix 06-03-2018*/
    if ($('.instagram_url_rewrite').length > 0)
      urlc = $('.instagram_url_rewrite').val()
    var datas = 'action=getAllTaged&embed_id=' + embed_id
    /* #hien globo fix 06-03-2018*/
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      data: datas,
      success: function (get_data) {
        if (get_data != '') {
          jQuery(gposition).html(get_data)
          Globo.sliderTem(gposition)
          Globo.responsiveColumn(gposition, false, loadmore)
        }
      },
      error: function () {},
    })
  },
  checkCountEnable: function (gposition, loadmore, g_url, nb) {
    Globo.getListIns(loadmore, gposition)
  },
  getListInsTagedLoadmore: function (g_url, gposition) {
    var urlc = g_url
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      beforeSend: function () {
        jQuery(gposition).find('.g_waiting_load').show()
        jQuery(gposition).find('.g_load_more:eq(0)').remove()
      },
      success: function (get_data) {
        if (get_data != '') {
          jQuery(gposition).append(get_data)
          Globo.responsiveColumn(gposition, false, true)
          jQuery(gposition).find('.g_waiting_load:eq(0)').remove()
        }
      },
      error: function () {},
    })
  },
  getListInsTagedLoadmoreINS: function (g_url, gposition) {
    var urlc = g_url
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      beforeSend: function () {
        jQuery(gposition).find('.g_waiting_load').show()
        jQuery(gposition).find('.g_load_more:eq(0)').remove()
      },
      success: function (get_data) {
        if (get_data != '') {
          jQuery(gposition).append(get_data)
          Globo.responsiveColumn(gposition, false, true)
          jQuery(gposition).find('.g_waiting_load:eq(0)').remove()
        }
      },
      error: function () {
        return false
      },
    })
  },
  getInsClickOne: function (_this, product) {
    var ins_id = _this.attr('id')
    if (product == true) {
      var embed_id = _this.attr('data-idEmbed')
      var urlc =
        'index.php?fc=module&module=g_productinstagram&controller=instagram'
      var datas = 'action=getOneIns&ins_id=' + ins_id + '&embed_id=' + embed_id
    } else {
      var id_Gr = _this.closest('.ginstagramproduct').attr('id')
      var embed_id = _this.closest('.ginstagramproduct').attr('data-idEmbed')
      /* var urlc = 'index.php?fc=module&module=g_productinstagram&controller=instagram&action=getOneIns&ins_id='+ins_id+'&embed_id='+embed_id;*/
      var urlc =
        'index.php?fc=module&module=g_productinstagram&controller=instagram'
      /* hien globo fix 06-03-2018*/
      if ($('.instagram_url_rewrite').length > 0)
        urlc = $('.instagram_url_rewrite').val()
      var datas = 'action=getOneIns&ins_id=' + ins_id + '&embed_id=' + embed_id
      /* #hien globo fix 06-03-2018*/
      var img = _this.find('img').attr('src')
      jQuery('.ginsnodata .gwrapimgins img').attr('src', img)
    }
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      data: datas,
      async: false,
      success: function (get_data) {
        if (get_data != '') {
          jQuery('#gpopupins').html(get_data)
          jQuery.fancybox({
            content: jQuery('#gpopupins').html(),
            wrapCSS: 'globofancyboxins',
            scrolling: 'no',
            autoCenter: false,
            helpers: { overlay: { locked: false } },
            autoDimensions: true,
            /* centerOnScroll:true, */
          })
        } else {
          var ginsnodata = jQuery('.ginsnodata').html()
          jQuery('#gpopupins').html(ginsnodata)
          jQuery.fancybox({
            content: jQuery('#gpopupins').html(),
            wrapCSS: 'globofancyboxins',
            scrolling: 'no',
            autoCenter: false,
            helpers: { overlay: { locked: false } },
            autoDimensions: true,
            /* centerOnScroll:true, */
          })
        }
        if ($('.globofancyboxins').length > 0) {
          var html = ''
          var id_next = _this.closest('.gitem_').next().find('.g_bo_link')
          var id_prev = _this.closest('.gitem_').prev().find('.g_bo_link')
          if (id_next.length > 0) {
            id_next = id_next.attr('id')
            html +=
              '<span class="gfancybox-load next-gload snptico-right-gload" data-load-id="' +
              id_next +
              '" data-idEmbed="' +
              embed_id +
              '" data-Idgr="' +
              id_Gr +
              '" ></span>'
          }
          if (id_prev.length > 0) {
            id_prev = id_prev.attr('id')
            html +=
              '<span class="gfancybox-load prev-gload snptico-left-gload " data-load-id="' +
              id_prev +
              '" data-idEmbed="' +
              embed_id +
              '" data-Idgr="' +
              id_Gr +
              '" ></span>'
          }
          $('.globofancyboxins .fancybox-skin').append(html)
        }

        if (product == true) {
          var ins_shortcode = _this.attr('data-ins-shortcode')
          var type_layout = $('.layoutproduct').val()
        } else {
          var ins_shortcode = $('.author_instagram .ins_shortcode').val()
          var type_layout = $('.ginstagramproduct').attr('data-layout-product')
        }
        $('.gmainpopup_ins').addClass(type_layout)
        if (type_layout == 'item' || type_layout == 'item2') {
          $('.gmainpopup_ins').width(600)
        }
        var ins_like = 0
        var ins_date = 0
        if (typeof ins_shortcode != 'undefined') {
          var urlc =
            'index.php?fc=module&module=g_productinstagram&controller=instagram'
          $.ajax({
            type: 'GET',
            dataType: 'json',
            url: urlc + '&action=getDatains&ins_shortcode=' + ins_shortcode,
            success: function (get_data) {
              var use_name = get_data.username //get_data.graphql.shortcode_media.owner.username;
              $('.author_name h3').text(use_name)
              $('.author_thumb a').attr(
                'href',
                'https://www.instagram.com/' + use_name,
              )
              $('.author_name a').attr(
                'href',
                'https://www.instagram.com/' + use_name,
              )
              $('.author_instagram .follow').attr(
                'href',
                'https://www.instagram.com/' + use_name,
              )
              var use_fullname = get_data.username //get_data.graphql.shortcode_media.owner.full_name;
              $('.author_name p').text(use_fullname)
              var thumb = $('.author_thumb img').attr('src', thumb) //get_data.graphql.shortcode_media.owner.profile_pic_url;
              $('.author_thumb').hide()
              ins_like = '' //get_data.graphql.shortcode_media.edge_media_preview_like.count;
              ins_date = '' //get_data.graphql.shortcode_media.taken_at_timestamp;
              /* update like and time update */
              var id_g_productinstagram = $('.id_g_productinstagram').val()
              $.ajax({
                type: 'GET',
                dataType: 'html',
                url: urlc,
                data:
                  'action=update_like&ins_like=' +
                  ins_like +
                  '&id_g_productinstagram=' +
                  id_g_productinstagram +
                  '&ins_date=' +
                  ins_date,
                success: function (res) {},
              })
            },
          })
        }
      },
      error: function () {
        var ginsnodata = jQuery('.ginsnodata').html()
        jQuery('#gpopupins').html(ginsnodata)
        jQuery.fancybox({
          content: jQuery('#gpopupins').html(),
          wrapCSS: 'globofancyboxins',
          scrolling: 'no',
          autoCenter: false,
          helpers: { overlay: { locked: false } },
          autoDimensions: true,
          /* centerOnScroll:true, */
        })
        if ($('.globofancyboxins').length > 0) {
          var html = ''
          var id_next = _this.closest('.gitem_').next().find('.g_bo_link')
          var id_prev = _this.closest('.gitem_').prev().find('.g_bo_link')
          if (id_next.length > 0) {
            id_next = id_next.attr('id')
            html +=
              '<span class="gfancybox-load next-gload snptico-right-gload" data-load-id="' +
              id_next +
              '" data-idEmbed="' +
              embed_id +
              '" data-Idgr="' +
              id_Gr +
              '" ></span>'
          }
          if (id_prev.length > 0) {
            id_prev = id_prev.attr('id')
            html +=
              '<span class="gfancybox-load prev-gload snptico-left-gload " data-load-id="' +
              id_prev +
              '" data-idEmbed="' +
              embed_id +
              '" data-Idgr="' +
              id_Gr +
              '" ></span>'
          }
          $('.globofancyboxins .fancybox-skin').append(html)
        }
      },
    })
  },
  getListIns: function (load_more, gposition) {
    var embed_id = $(gposition).attr('data-idEmbed')
    var template_g = jQuery(gposition).attr('data-tem')
    /* var urlc = 'index.php?fc=module&module=g_productinstagram&controller=instagram&action=getAllConfig&embed_id='+embed_id;*/
    var urlc =
      'index.php?fc=module&module=g_productinstagram&controller=instagram'
    /* hien globo fix 06-03-2018*/
    if ($('.instagram_url_rewrite').length > 0)
      urlc = $('.instagram_url_rewrite').val()
    var datas = 'action=getAllConfig&embed_id=' + embed_id
    /* #hien globo fix 06-03-2018*/
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      data: datas,
      beforeSend: function () {
        if (load_more == true) {
          jQuery(gposition).find('.g_waiting_load').show()
          jQuery(gposition).find('.g_load_more:eq(0)').remove()
        }
      },
      success: function (get_data) {
        if (get_data != '' && get_data) {
          jQuery(gposition).html(get_data)
          Globo.sliderTem(gposition)
          //if(jQuery(gposition).find('.g_load_more').length){
          //                        if(jQuery(gposition).attr('data-tem') == 3){
          //                            jQuery(gposition).find('.gloadmoreins').trigger('click');
          //                        }
          //                    }
          Globo.responsiveColumn(gposition, false, load_more)
        } else {
          jQuery(gposition).find('.g_waiting_load:eq(0)').remove()
          jQuery(gposition).find('.g_waiting_load').hide()
        }
        $(window).resize()
      },
      error: function (get_data) {
        jQuery(gposition).find('.g_waiting_load:eq(0)').remove()
        jQuery(gposition).find('.g_waiting_load').hide()
        return false
      },
    })
  },
  responsiveColumn: function (gposition, resizeG, loadmore) {
    var widthScreen_G = parseInt(jQuery(window).width())
    var getScreenColumn = jQuery(gposition).attr('data-screen-col')
    getScreenColumn = getScreenColumn.split(',')

    var getScreenTem = jQuery(gposition).attr('data-tem')
    //thai.
    var gborderRadiusImg = jQuery(gposition).attr('data-gborderRadiusImg')
    var gShowImgTagHover = jQuery(gposition).attr('data-gShowImgTagHover')
    var g_item_tag_bo = jQuery(gposition).find('.g_item_tag_bo')
    var gHoverimg = jQuery(gposition).find('.gHoverimg')
    if (g_item_tag_bo.length > 0 && gShowImgTagHover == 1) {
      g_item_tag_bo.hide()
    }
    if (gHoverimg.length > 0) {
      jQuery(gposition)
        .find('.gHoverimg')
        .css('border-radius', gborderRadiusImg + 'px')
    }
    switch (true) {
      // Screen > 1200
      case 1220 < widthScreen_G:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[0]), resizeG)
        break
      // Screen 1200
      case 992 < widthScreen_G && widthScreen_G <= 1200:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[1]), resizeG)
        break
      // Screen 992
      case 768 < widthScreen_G && widthScreen_G <= 992:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[2]), resizeG)
        break
      // Screen 768
      case 480 < widthScreen_G && widthScreen_G <= 768:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[3]), resizeG)
        break
      // Screen 480
      case 320 < widthScreen_G && widthScreen_G <= 480:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[4]), resizeG)
        break
      // Screen 320
      case widthScreen_G <= 320:
        Globo.caseResponsive(gposition, parseInt(getScreenColumn[5]), resizeG)
        break
    }
    // Height Same
    if (parseInt(getScreenTem) == 1 || parseInt(getScreenTem) == 3) {
      Globo.minHeight(gposition, '.g_l_i', loadmore)
    }
    // Set fullwidth template
    Globo.setFullwidth(gposition, false)
  },
  caseResponsive: function (gposition, getScreenColumn, resizeG) {
    getScreenColumn = parseInt(getScreenColumn)
    var getScreenTem = jQuery(gposition).attr('data-tem')
    var withs = $('.ginstemplate_' + getScreenTem).width()
    if (getScreenTem == 2) {
      Globo.sliderTem(gposition, getScreenColumn, resizeG)
    } else if (getScreenTem == 4) {
      $(gposition).closest('.ginstagram_w').show()
      var gConvertW = ''
      gConvertW = 100 / getScreenColumn
      jQuery(gposition)
        .find('.gitem_')
        .css('width', gConvertW + '%')
      jQuery(gposition)
        .find('.gitem_')
        .css('padding', jQuery(gposition).attr('data-marginimg') + 'px')
      var marginimg = $(gposition).attr('data-marginimg')
      $('.ginstemplate_' + getScreenTem).imagesLoaded(function () {
        $('.ginstemplate_' + getScreenTem).masonry({
          itemSelector: '.gitem_',
          columnWidth: withs / getScreenColumn,
          horizontalOrder: true,
        })
      })
    } else if (getScreenTem == 5) {
      $(gposition).closest('.ginstagram_w').show()
      var marginimg = $(gposition).attr('data-marginimg')
      $('.ginstemplate_' + getScreenTem).attr(
        'style',
        'display: grid;grid-template-columns: repeat(auto-fill, minmax(' +
          withs / getScreenColumn +
          'px, 1fr));grid-auto-rows: minmax(' +
          withs / getScreenColumn +
          'px, auto);grid-auto-flow: dense;',
      )
      $('.ginstemplate_' + getScreenTem + ' .gitem_').css(
        'height',
        withs / getScreenColumn + 'px',
      )
      $('.ginstemplate_' + getScreenTem + ' .gitem_').css(
        'margin-right',
        marginimg + 'px',
      )
      $('.ginstemplate_' + getScreenTem + ' .gitem_').css(
        'margin-bottom',
        marginimg + 'px',
      )
      if ($('.ginstemplate_' + getScreenTem + ' .gitem_').length > 0)
        $('.ginstemplate_' + getScreenTem + ' .gitem_').each(function () {
          var widthchild = $(this).height()
          if ($(this).attr('id') == 'x2') {
            $(this).css('height', widthchild * 2 + 'px')
            $(this)
              .find('.g_bo_link')
              .css('height', widthchild * 2 + 'px')
          }
        })
    } else {
      if (getScreenColumn > 0 && getScreenColumn != '') {
        jQuery(gposition).closest('.ginstagram_w').show()
        var gConvertW = ''
        gConvertW = 100 / getScreenColumn
        jQuery(gposition)
          .find('.gitem_')
          .css('width', gConvertW + '%')
        jQuery(gposition)
          .find('.gitem_')
          .css('padding', jQuery(gposition).attr('data-marginimg') + 'px')
      } else if (getScreenColumn == 0) {
        jQuery(gposition).closest('.ginstagram_w').hide()
      }
    }
  },
  setFullwidth: function (gposition, gResize) {
    // Fullwidth for tem
    var widthScreenG = jQuery(window).width()
    var widthParent = jQuery(gposition).closest('.ginstagram_w').outerWidth()
    var gGetTem = jQuery(gposition).attr('data-tem')
    if (parseInt(gGetTem) == 1) {
      var leftRightG = (parseInt(widthScreenG) - parseInt(widthParent)) / 2
      jQuery(gposition).closest('.wrap_g_ins').width(widthScreenG)
      jQuery(gposition).closest('.wrap_g_ins').css('margin-left', -leftRightG)
      jQuery(gposition).closest('.wrap_g_ins').css('margin-right', -leftRightG)
    }
  },
  sliderTem: function (gposition, getScreenColumn, resizeG) {
    if (resizeG == false) {
      var gNumberColumnSli = 4
      var gSlidermagin = 10
      var gSliderWidth = 0
      var gWidthTotal = jQuery(gposition).closest('.ginstagram_w').width()
      if (jQuery(gposition).attr('data-marginimg') != '') {
        gSlidermagin = parseInt(jQuery(gposition).attr('data-marginimg'))
      }
      var gauto_sld = false
      // Auto slider
      if (parseInt(jQuery(gposition).attr('data-slia')) == 1) {
        gauto_sld = true
      }
      if (getScreenColumn > 0 && getScreenColumn != '') {
        jQuery(gposition).closest('.ginstagram_w').show()
        gNumberColumnSli = getScreenColumn
        gSliderWidth =
          parseInt(gWidthTotal) / parseInt(gNumberColumnSli) -
          parseInt(gSlidermagin)
        if (gSliderWidth < 50) {
          gSliderWidth = 200
        }
        var sli = jQuery(gposition).bxSlider({
          slideWidth: gSliderWidth,
          minSlides: 1,
          maxSlides: gNumberColumnSli,
          slideMargin: gSlidermagin,
          pager: false,
          responsive: true,
          auto: gauto_sld,
          autoHover: gauto_sld,
          tickerHover: gauto_sld,
        })
      } else {
        if (getScreenColumn == 0) {
          jQuery(gposition).closest('.ginstagram_w').hide()
        } else {
          jQuery(gposition).closest('.ginstagram_w').show()
          gSliderWidth =
            parseInt(gWidthTotal) / parseInt(gNumberColumnSli) -
            parseInt(gSlidermagin)
          if (gSliderWidth < 50) {
            gSliderWidth = 200
          }
          var sli = jQuery(gposition).bxSlider({
            slideWidth: gSliderWidth,
            minSlides: 1,
            maxSlides: gNumberColumnSli,
            slideMargin: gSlidermagin,
            pager: false,
            responsive: true,
            auto: gauto_sld,
            autoHover: gauto_sld,
            tickerHover: gauto_sld,
          })
        }
      }
      // Pause slider mouse
      $(document).on(
        'click',
        '.ginstagramproduct.ginstemplate_2 .gitem_ a',
        function () {
          sli.stopAuto()
        },
      )
    }
  },
  // ====== Creat function height div ======
  height_div: function (object, object_child) {
    var height_div = 0
    jQuery(object).each(function () {
      var h_begin_div = jQuery(this).find(object_child).outerHeight()
      if (height_div < h_begin_div) {
        height_div = h_begin_div
      }
    })
    jQuery(object).find(object_child).css('min-height', height_div)
  },
  removeMinHeight: function (object, object_child) {
    jQuery(object).each(function () {
      jQuery(this).find(object_child).removeAttr('style')
    })
    Globo.height_div(object, object_child)
  },
  minHeight: function (o1, o2, loadmore) {
    o1 = jQuery(o1).find('.gitem_')
    if (loadmore == true) {
      Globo.height_div(o1, o2)
      jQuery(window).resize(function () {
        Globo.removeMinHeight(o1, o2)
      })
    } else {
      jQuery(window).load(function () {
        Globo.height_div(o1, o2)
        jQuery(window).resize(function () {
          Globo.removeMinHeight(o1, o2)
        })
      })
    }
  },
  caseResponsivePro: function (templateproduct, numberrps) {
    if (templateproduct == 2) {
      var width = parseInt($('.ginstagram_p').width())
      var carousel_Config = $('.listimages').bxSlider({
        slideWidth: width,
        minSlides: numberrps,
        maxSlides: numberrps,
        pager: false,
        responsive: true,
      })
    }
    if (templateproduct == 3) {
      $('.listimages #gitemp').css('width', 100 / numberrps + '%')
    }
    if (templateproduct == 4) {
      $('.ginstagram_p #gitemp').css(
        'width',
        $('.ginstagram_p').width() / numberrps + 'px',
      )
      $('.listimages').imagesLoaded(function () {
        $('.listimages').masonry({
          itemSelector: '#gitemp',
          columnWidth: $('.ginstagram_p').width() / numberrps,
          horizontalOrder: true,
        })
      })
    }
  },
  responsiveImgProduct: function (templateproduct) {
    var widthScreen_G = parseInt($(window).width())
    var getScreenColumn = $('.numberdpls').val()
    getScreenColumn = getScreenColumn.split(',')
    switch (true) {
      // Screen > 1200
      case 1220 < widthScreen_G:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[0]))
        break
      // Screen 1200
      case 992 < widthScreen_G && widthScreen_G <= 1200:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[1]))
        break
      // Screen 992
      case 768 < widthScreen_G && widthScreen_G <= 992:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[2]))
        break
      // Screen 768
      case 480 < widthScreen_G && widthScreen_G <= 768:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[3]))
        break
      // Screen 480
      case 320 < widthScreen_G && widthScreen_G <= 480:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[4]))
        break
      // Screen 320
      case widthScreen_G <= 320:
        Globo.caseResponsivePro(templateproduct, parseInt(getScreenColumn[5]))
        break
    }
  },
}

$(document).ready(function () {
  // product block
  var templateproduct = $('.templateproduct').val()
  var layoutproduct = $('.layoutproduct').val()
  var limitedimage = $('.limitedimage').val()
  var numberdpls = $('.numberdpls').val()

  if ($('.ginstagram_p') && $('.ginstagram_p').length > 0) {
    Globo.responsiveImgProduct(templateproduct)
  }
  $('.ginstagram_w').each(function () {
    var gposition = $(this).find('.ginstagramproduct')
    var nb = gposition.attr('data-nb')
    var number_show = '&count=' + nb
    var g_url = ''
    var getShowtaged = gposition.attr('data-showtaged')
    if (parseInt(getShowtaged) == 1) {
      Globo.getListInsTaged(false, gposition)
    } else {
      Globo.checkCountEnable(gposition, false, g_url, nb)
    }
  })

  // Popup .
  $(document).on('click', '.gitem_ a', function () {
    if ($(this).parents('#gitemp').length == true) {
      var product = true
      Globo.getInsClickOne($(this), product)
    } else {
      Globo.getInsClickOne($(this))
    }
    var active_acount = $('.ginstagramproduct').attr('data-active-acount')
    if (active_acount == 1) {
      $('.author_instagram').show()
    } else {
      $('.author_instagram').hide()
    }
  })
  // Show loadmore button
  $(window).on('load', function () {
    $('.g_load_more').show()
  })
  // Event hover taged
  $(document).on(
    {
      mouseenter: function () {
        var data_id = $(this).attr('data-id')
        $('.fancybox-inner #g_tag_point_' + data_id).addClass('gactive')
      },
      mouseleave: function () {
        var data_id = $(this).attr('data-id')
        $('.fancybox-inner #g_tag_point_' + data_id).removeClass('gactive')
      },
    },
    '.gproduct_ins .g_pro_selected',
  )
  $(document).on('mouseover', '.gproduct_ins .g_pro_selected', function () {
    var data_id = $(this).attr('data-id')
    $('.fancybox-inner #g_tag_point_' + data_id).addClass('gactive')
    $(this).addClass('gactive_listtag')
    //
    $('.fancybox-inner .g_item_tag').css('opacity', '0.2')
    $('.fancybox-inner .g_list_tag_pro>.gactive').css('opacity', '1')
    $('.fancybox-inner .g_pro_selected').css('opacity', '0.2')
    $('.fancybox-inner .g_maxheight_ins>ul>li>.gactive_listtag').css(
      'opacity',
      '1',
    )
  })
  $(document).on('mouseout', '.gproduct_ins .g_pro_selected', function () {
    var data_id = $(this).attr('data-id')
    $('.fancybox-inner #g_tag_point_' + data_id).removeClass('gactive')
    $(this).removeClass('gactive_listtag')
    $('.fancybox-inner .g_item_tag').css('opacity', '1')
    $('.fancybox-inner .g_pro_selected').css('opacity', '1')
  })
  $(document).on('mouseover', '.ginstagramproduct .gitem_ a', function () {
    var ins_id = $(this).attr('id')
    var gShowImgTag = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gShowImgTag')
    var g_opacity = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gbackgroundopacity')
    var gZoomImgHover = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gZoomImgHover')
    var g_item_tag_bo_find = $(this).find('.g_item_tag_bo')
    if (gZoomImgHover == 1) {
      $(this)
        .find('.gHoverimg')
        .css('transform', 'scaleX(1.15) scaleY(1.15) translateZ(0)')
    }
    $(this).find('.gHoverimg').css('opacity', g_opacity)
    if (g_item_tag_bo_find.length > 0) {
      g_item_tag_bo_find.show()
    }
  })
  $(document).on('mouseout', '.ginstagramproduct .gitem_ a', function () {
    var ins_id = $(this).attr('id')
    var gShowImgTag = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gShowImgTag')
    var gZoomImgHover = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gZoomImgHover')
    var gShowImgTagHover = $(this)
      .closest('.ginstagramproduct')
      .attr('data-gShowImgTagHover')
    var g_item_tag_bo_find = $(this).find('.g_item_tag_bo')
    if (gZoomImgHover == 1) {
      $(this).find('.gHoverimg').css('transform', 'none')
    }
    $(this).find('.gHoverimg').css('opacity', 1)
    if (g_item_tag_bo_find.length > 0 && gShowImgTagHover == 1) {
      g_item_tag_bo_find.hide()
    }
  })
  // Hide popup when add to cart
  $(document).on('click', '.gaddcartins', function () {
    $.fancybox.close()
  })
  $(document).on('change', '.g_instagram-variants select', function () {
    var seletchange = $(this)
    var id_product = $(this).data('id-product')
    var id_combination = $(this).val()
    var urlc =
      'index.php?fc=module&module=g_productinstagram&controller=instagram'
    jQuery.ajax({
      type: 'GET',
      dataType: 'html',
      url: urlc,
      data:
        '&action=getProductIdCombination&id_product=' +
        id_product +
        '&id_combination=' +
        id_combination,
      success: function (get_data) {
        if (get_data != '') {
          seletchange
            .closest('.g_pro_selected_change')
            .find('.extraprice')
            .text(get_data.price)
          seletchange
            .closest('.g_pro_selected_change')
            .find('.button-container > a')
            .attr('href', get_data.linkaddcart)
        }
      },
      error: function () {},
    })
  })

  // Load more
  $(document).on('click', '.gloadmoreins', function (e) {
    e.preventDefault()
    var g_url = $(this).attr('data-href')
    var data_php = $(this).attr('data-php')
    if (data_php && data_php == 'true') {
      Globo.getListInsTagedLoadmore(
        g_url,
        $(this).closest('.ginstagramproduct'),
      )
    } else {
      Globo.getListInsTagedLoadmoreINS(
        g_url,
        $(this).closest('.ginstagramproduct'),
      )
    }
    return false
  })
  // Load fancybox.
  $(document).on('click', '.prev-gload', function (_this) {
    var Idgr = $('.prev-gload').attr('data-Idgr')
    var ins_id = $('.prev-gload').attr('data-load-id')
    var finda = $('#' + Idgr).find('#' + ins_id)
    if (finda.length > 0) {
      Globo.getInsClickOne(finda)
      jQuery.fancybox.update()
    }
  })
  $(document).on('click', '.next-gload', function (_this) {
    var Idgr = $('.next-gload').attr('data-Idgr')
    var ins_id = $('.next-gload').attr('data-load-id')
    var finda = $('#' + Idgr).find('#' + ins_id)
    if (finda.length > 0) {
      Globo.getInsClickOne(finda)
      jQuery.fancybox.update()
    }
  })
  // mose function hover active.g_item_tag.
  $(document).on('mouseover', '.g_list_tag_pro .g_item_tag', function () {
    var data_id1 = $(this).attr('data-id1')
    $('.fancybox-inner #g_tag_point_' + data_id1).addClass('gactive')
    $('.fancybox-inner #_' + data_id1).addClass('gactive_listtag')
    //
    $('.fancybox-inner .g_item_tag').css('opacity', '0.2')
    $('.fancybox-inner .g_list_tag_pro>.gactive').css('opacity', '1')
    $('.fancybox-inner .g_pro_selected').css('opacity', '0.2')
    $('.fancybox-inner .g_maxheight_ins>ul>li>.gactive_listtag').css(
      'opacity',
      '1',
    )
    //var data_y = $(this).attr('data-y');
    //$('.fancybox-inner .g_arrow_'+data_id).css('opacity', '1');
  })

  $(document).on('mouseout', '.g_list_tag_pro .g_item_tag', function () {
    var data_id1 = $(this).attr('data-id1')
    $('.fancybox-inner #g_tag_point_' + data_id1).removeClass('gactive')
    $('.fancybox-inner #_' + data_id1).removeClass('gactive_listtag')
    $('.fancybox-inner .g_pro_selected').css('opacity', '1')
    $('.fancybox-inner .g_item_tag').css('opacity', '1')
    //var data_y = $(this).attr('data-y');
    //$('.fancybox-inner .g_arrow_'+data_id).css('opacity', '0');
  })

  // Scroll autoload ".ginstemplate_1 .autoload_1"
  $(window).on('scroll', function (e) {
    var positionScroll = $(this).scrollTop()
    $('.ginstemplate_1.autoload_1').each(function () {
      if ($(this).find('.g_load_more').length) {
        var oTop = $(this).find('.g_load_more').offset().top
        var heightObject = $(this).find('.g_load_more').outerHeight()
        var windowHeight = $(window).height()
        if (oTop + heightObject - windowHeight <= positionScroll) {
          var g_url = $(this).find('.gloadmoreins').attr('data-href')
          var data_php = $(this).find('.gloadmoreins').attr('data-php')
          if (data_php && data_php == 'true') {
            Globo.getListInsTagedLoadmore(g_url, $(this))
          } else {
            Globo.getListInsTagedLoadmoreINS(
              g_url,
              $(this).closest('.ginstagramproduct'),
            )
          }
          check_scroll = true
        }
      }
    })
  })
  // Scroll autoload ".ginstemplate_3 .autoload_1"
  $(window).scroll(function (e) {
    var positionScroll = $(this).scrollTop()
    $('.ginstemplate_3.autoload_1').each(function () {
      if ($(this).find('.g_load_more').length) {
        var oTop = $(this).find('.g_load_more').offset().top
        var heightObject = $(this).find('.g_load_more').outerHeight()
        var windowHeight = $(window).height()
        if (oTop + heightObject - windowHeight <= positionScroll) {
          var g_url = $(this).find('.gloadmoreins').attr('data-href')
          var data_php = $(this).find('.gloadmoreins').attr('data-php')
          if (data_php && data_php == 'true') {
            Globo.getListInsTagedLoadmore(g_url, $(this))
          } else {
            Globo.getListInsTagedLoadmoreINS(
              g_url,
              $(this).closest('.ginstagramproduct'),
            )
          }
          check_scroll = true
        }
      }
    })
  })
  // Set fullwidth tem
  $(window).resize(function () {
    if ($('.ginstagram_p') && $('.ginstagram_p').length > 0) {
      Globo.responsiveImgProduct()
    } else {
      Globo.setFullwidth('.wrap_g_ins.gtemplateFul .ginstagramproduct', true)
      // Style and responsive by Column
      $('.ginstagram_w').each(function () {
        Globo.responsiveColumn($(this).find('.ginstagramproduct'), true, false)
      })
    }
  })
})

function checkloadimage(e) {
  if ($('.ginstagramproduct').attr('data-tem') != 4) {
    var height = e.height()
    var width = e.width()
    if (height >= width) {
      e.parent().css('overflow', 'hidden')
      e.parent().css('height', width)
    }
  } else {
    var height = e.height()
    var width = e.width()
    if (height >= width) {
      e.parent().css('overflow', 'inherit')
      e.parent().css('height', 'auto')
    }
  }
}

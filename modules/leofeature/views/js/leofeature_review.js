/**
 * 2007-2017 Leotheme
 *
 * NOTICE OF LICENSE
 *
 * Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list
 *
 * DISCLAIMER
 *
 *  @Module Name: Leo Feature
 *  @author    leotheme <leotheme@gmail.com>
 *  @copyright 2007-2018 Leotheme
 *  @license   http://leotheme.com - prestashop template provider
 */
$(document).ready(function () {
  if ($('.open-review-form').length) {
    var id_product = $('.open-review-form').data('id-product')
    var is_logged = $('.open-review-form').data('is-logged')

    $.ajax({
      type: 'POST',
      headers: { 'cache-control': 'no-cache' },
      url:
        prestashop.urls.base_url +
        'modules/leofeature/psajax_review.php?rand=' +
        new Date().getTime(),
      async: true,
      cache: false,
      data: {
        action: 'render-form-review',
        id_product: id_product,
        is_logged: is_logged,
        token: leo_token,
      },
      success: function (result) {
        if (result != '') {
          $('[data-review-form]').append(result)
          activeEventFormReview()
          activeStar()
          $('.open-review-form').fadeIn('fast')
        } else {
          console.log(review_error)
        }
      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        // alert("TECHNICAL ERROR: \n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus);
      },
    })
  }

  $('.read-review').on('click', function () {
    // if ($('.leo-product-show-review-title').length && $('#leo-product-show-review-content').length)
    if ($('.leo-product-show-review-title').length) {
      if (
        $('.leo-product-show-review-title').hasClass('leofeature-accordion')
      ) {
        if ($('.leo-product-show-review-title').hasClass('collapsed')) {
          $('.leo-product-show-review-title').trigger('click')
        }
        var timer = setInterval(function () {
          if (
            $('#collapseleofeatureproductreview').hasClass('collapse in') ||
            $('#collapsereviews').hasClass('collapse in')
          ) {
            //run some other function
            $('html, body').animate(
              {
                scrollTop: $('.leo-product-show-review-title').offset().top,
              },
              500,
            )
            clearInterval(timer)
          }
        }, 200)
      } else {
        $('.leo-product-show-review-title').trigger('click')
        $('html, body').animate(
          {
            scrollTop: $('.leo-product-show-review-title').offset().top,
          },
          500,
        )
      }
    }
    return false
  })

  $('.usefulness_btn').on('click', function () {
    if (!$(this).hasClass('disabled')) {
      $(this).addClass('active')
      $(this)
        .parents('.review_button')
        .find('.usefulness_btn')
        .addClass('disabled')
      var id_product_review = $(this).data('id-product-review')
      var is_usefull = $(this).data('is-usefull')
      var e_parent_button = $(this).parent()
      $.ajax({
        type: 'POST',
        headers: { 'cache-control': 'no-cache' },
        url:
          prestashop.urls.base_url +
          'modules/leofeature/psajax_review.php?rand=' +
          new Date().getTime(),
        async: true,
        cache: false,
        data: {
          action: 'add-review-usefull',
          id_product_review: id_product_review,
          is_usefull: is_usefull,
          token: leo_token,
        },
        success: function (result) {
          if (result != '') {
            e_parent_button.fadeOut(function () {
              e_parent_button.remove()
            })
          } else {
            console.log(review_error)
          }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          alert(
            'TECHNICAL ERROR: \n\nDetails:\nError thrown: ' +
              XMLHttpRequest +
              '\n' +
              'Text status: ' +
              textStatus,
          )
          // window.location.replace($('.open-review-form').data('product-link'));
        },
      })
    }
  })

  $('.report_btn').on('click', function () {
    if (!$(this).hasClass('disabled')) {
      $(this).addClass('disabled')
      var e_button = $(this)
      var id_product_review = $(this).data('id-product-review')
      $.ajax({
        type: 'POST',
        headers: { 'cache-control': 'no-cache' },
        url:
          prestashop.urls.base_url +
          'modules/leofeature/psajax_review.php?rand=' +
          new Date().getTime(),
        async: true,
        cache: false,
        data: {
          action: 'add-review-report',
          id_product_review: id_product_review,
          token: leo_token,
        },
        success: function (result) {
          if (result != '') {
            e_button.fadeOut(function () {
              e_button.remove()
            })
          } else {
            console.log(review_error)
          }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          alert(
            'TECHNICAL ERROR: \n\nDetails:\nError thrown: ' +
              XMLHttpRequest +
              '\n' +
              'Text status: ' +
              textStatus,
          )
          // window.location.replace($('.open-review-form').data('product-link'));
        },
      })
    }
    return false
  })

  // activeEventModalReview();
  activeStar()
})

function activeStar() {
  //DONGND:: add txt cancel rating to translate
  $('input.star').rating({ cancel: cancel_rating_txt })
  $('.auto-submit-star').rating({ cancel: cancel_rating_txt })
}

function activeEventModalReview() {
  $('.form-new-review').on('submit', function () {
    if (
      $('.new_review_form_content .form-group.leo-has-error').length ||
      $('.leo-fake-button').hasClass('validate-ok')
    ) {
      return false
    }
  })
  //$('.leo-modal-review').on('show.bs.modal', function (e) {
  $('.leo-modal-review-bt').on('click', function () {
    if (!$(this).hasClass('active')) {
      $(this).addClass('active')
      $('.leo-modal-review-bt-text').hide()
      $('.leo-modal-review-loading').css({ display: 'block' })

      $(
        '.new_review_form_content input, .new_review_form_content textarea',
      ).each(function () {
        if ($(this).val() == '') {
          $(this).parent('.form-group').addClass('leo-has-error')
          $(this).attr('required', '')
        } else {
          $(this).parent('.form-group').removeClass('leo-has-error')
          $(this).removeAttr('required')
        }
      })

      if ($('.new_review_form_content .form-group.leo-has-error').length) {
        $(this).removeClass('active')
        $('.leo-modal-review-bt-text').show()
        $('.leo-modal-review-loading').hide()
      } else {
        // console.log('pass');
        // $('.leo-modal-review-bt').remove();
        // console.log($( ".new_review_form_content input, .new_review_form_content textarea" ).serialize());
        $('.leo-fake-button').addClass('validate-ok')
        $.ajax({
          type: 'POST',
          headers: { 'cache-control': 'no-cache' },
          url:
            prestashop.urls.base_url +
            'modules/leofeature/psajax_review.php?action=add-new-review&token=' +
            leo_token +
            '&rand=' +
            new Date().getTime(),
          async: true,
          cache: false,
          data: $(
            '.new_review_form_content input, .new_review_form_content textarea',
          ).serialize(),
          success: function (result) {
            if (result != '') {
              var object_result = $.parseJSON(result)
              $('[data-review-messages]').children().remove()
              $('.leo-modal-review-bt').fadeOut('slow', function () {
                $(this).remove()
              })

              $('.new_review_form_content > *').fadeOut('slow', function () {
                $(this).remove()
                if (object_result.result) {
                  $('[data-review-messages]').append(
                    '<div class="alert alert-success bg-opacity-10 bg-green-600 border-green-600 max-w-lg mx-auto text-green-600 font-body font-normal"><label class="form-control-label m-auto p-0">' +
                      object_result.sucess_mess +
                      '</label></div>',
                  )
                } else {
                  // $('.leo-modal-review .modal-body').append('<div class="form-group has-danger text-center"></div>');
                  $.each(object_result.errors, function (key, val) {
                    $('[data-review-messages]').append(
                      '<div class="alert alert-danger bg-opacity-10 bg-red-600 border-red-600 font-body font-normal max-w-lg mr-2 mx-auto text-red-600"><label class="form-control-label m-auto p-0">' +
                        val +
                        '</label></div>',
                    )
                  })
                }
              })
            } else {
              console.log(review_error)
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(
              'TECHNICAL ERROR: \n\nDetails:\nError thrown: ' +
                XMLHttpRequest +
                '\n' +
                'Text status: ' +
                textStatus,
            )
            window.location.replace($('.open-review-form').data('product-link'))
          },
        })
      }
      $('.leo-fake-button').trigger('click')
    }
  })
  //})

  $('.leo-modal-review').on('hide.bs.modal', function (e) {
    // console.log($('.leo-modal-review-bt').length);
    if (
      !$('.leo-modal-review-bt').length &&
      !$('.leo-modal-review .modal-body .disable-form-review').length
    ) {
      // console.log('aaa');
      // window.location.replace($('.open-review-form').data('product-link'));
      location.reload()
    }
  })
}

function activeEventFormReview() {
  $('[data-review-form] .form-new-review').on('submit', function () {
    if (
      $('.new_review_form_content .form-group.leo-has-error').length ||
      $('.leo-fake-button').hasClass('validate-ok')
    ) {
      return false
    }
  })
  $('[data-review-form] .leo-modal-review-bt').on('click', function () {
    if (!$(this).hasClass('active')) {
      $(this).addClass('active')
      // $('[data-review-form] .leo-modal-review-bt-text').hide();
      // $('[data-review-form] .leo-modal-review-loading').css({'display':'block'});

      // $('[data-review-form] .new_review_form_content input, [data-review-form] .new_review_form_content textarea').each(function(){

      // 	if ($(this).val() == '')
      // 	{
      // 		$(this).parent('.form-group').addClass('leo-has-error');
      // 		$(this).attr("required", "");
      // 	}
      // 	else
      // 	{
      // 		$(this).parent('.form-group').removeClass('leo-has-error');
      // 		$(this).removeAttr('required');
      // 	}
      // })

      if (
        $(
          '[data-review-form] .new_review_form_content .form-group.leo-has-error',
        ).length
      ) {
        $(this).removeClass('active')
        $('[data-review-form] .leo-modal-review-bt-text').show()
        $('[data-review-form] .leo-modal-review-loading').hide()
      } else {
        // console.log('pass');
        // $('.leo-modal-review-bt').remove();
        // console.log($( ".new_review_form_content input, .new_review_form_content textarea" ).serialize());
        $('[data-review-form] .leo-fake-button').addClass('validate-ok')
        $.ajax({
          type: 'POST',
          headers: { 'cache-control': 'no-cache' },
          url:
            prestashop.urls.base_url +
            'modules/leofeature/psajax_review.php?action=add-new-review&token=' +
            leo_token +
            '&rand=' +
            new Date().getTime(),
          async: true,
          cache: false,
          data: $(
            '[data-review-form] .new_review_form_content input, [data-review-form] .new_review_form_content textarea',
          ).serialize(),
          success: function (result) {
            if (result != '') {
              var object_result = $.parseJSON(result)
              $('[data-review-messages]').children().remove()
              if (object_result.result) {
                $('.new_review_form_content > *').fadeOut('slow', function () {
                  $(this).remove()
                })
                $('[data-review-messages]').append(
                  '<div class="alert alert-success bg-opacity-10 bg-green-600 border-green-600 max-w-lg mx-auto text-green-600 font-body font-normal"><label class="form-control-label m-auto p-0">' +
                    object_result.sucess_mess +
                    '</label></div>',
                )
              } else {
                $.each(object_result.errors, function (key, val) {
                  $('[data-review-messages]').append(
                    '<div class="alert alert-danger bg-opacity-10 bg-red-600 border-red-600 font-body font-normal max-w-lg mr-2 mx-auto text-red-600"><label class="form-control-label m-auto p-0">' +
                      val +
                      '</label></div>',
                  )
                })
                $('[data-review-form] .leo-modal-review-bt').removeClass(
                  'active',
                )
              }
            } else {
              console.log(review_error)
            }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(
              'TECHNICAL ERROR: \n\nDetails:\nError thrown: ' +
                XMLHttpRequest +
                '\n' +
                'Text status: ' +
                textStatus,
            )
            window.location.replace($('.open-review-form').data('product-link'))
          },
        })
      }
      $('[data-review-form] .leo-fake-button').trigger('click')
    }
  })
}

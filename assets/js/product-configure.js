var configurableSelected = []

$(document).ready(function () {
  // Cache
  var $configurableElements = $('[data-product-configurable]')
  var $configurableModal = $('#productConfigurable')
  var $productConfigurableOptions = $('[data-product-attribute]')

  $configurableElements
    .filter(function () {
      return parseInt($(this).data('productConfigurable'))
    })
    .each(function () {
      $(this).data(
        'productConfigurableId',
        parseInt($(this).data('productConfigurable')),
      )
      configurableSelected.push({
        id: parseInt($(this).data('productConfigurable')),
        selected: false,
        el: $(this),
      })
    })

  var swiperElement = $configurableElements.filter(function () {
    return $(this).data('productConfigurable') == 'swiper'
  })

  var swiper = null
  if (swiperElement.length != 0) {
    swiper = productConfigurableSwiper.call(swiperElement[0])

    swiper.on('click', function () {
      productConfigurableSelect(
        $(swiper.clickedSlide).data('productConfigurable'),
      )
    })

    $configurableModal.on('shown.bs.modal', function () {
      swiper.update()
    })
  }

  productConfigurableSelect(1) //default select

  var configurableCartAdd = $configurableElements.filter(function () {
    return $(this).data('productConfigurable') == 'add'
  })

  $('body').on(
    'click',
    '.modal [data-button-action="add-to-cart"]',
    function () {
      var countConfigurableSelected = configurableSelected.filter(
        (product) => product.selected === true,
      ).length
      console.log(countConfigurableSelected)
      if (countConfigurableSelected) {
        productConfigurableUnSelectAll()
        productConfigurableSetState()
        $('.hidden [data-button-action="add-to-cart"]').trigger('click')
      }
    },
  )

  $('body').on(
    'click',
    '[data-button-action="add-sample-to-cart"]',
    function () {
      productConfigurableUnSelectAll()
      productConfigurableSetState()
      productConfigurableWriteState('')
      productConfigurableSaveState()
      $('[data-product-attribute]').eq(5).trigger('click')
    },
  )

  if (typeof prestashop !== 'undefined') {
    prestashop.on('updatedProduct', function (event) {
      if ($('[data-product-attribute]').eq(5).is(':checked')) {
        $('#quantity_wanted').val(1)
        $('.hidden [data-button-action="add-to-cart"]').trigger('click')
        $('[data-product-attribute]').eq(1).trigger('click')
      }

      $configurableElements
        .filter(function () {
          return $(this).data('productConfigurable') == 'modal'
        })
        .find('.product-prices')
        .first()
        .replaceWith(event.product_prices)
    })
  }
})

function productConfigurableSwiper() {
  return new Swiper(this, {
    slidesPerView: 4,
    spaceBetween: 1,
    watchOverflow: true,
    breakpoints: {
      480: {
        spaceBetween: 1,
        slidesPerView: 6,
      },
      768: {
        spaceBetween: 1,
        slidesPerView: 6,
      },
      1200: {
        spaceBetween: 3,
        slidesPerView: 6,
      },
    },
  })
}

function productConfigurableSelect(productId) {
  var configurableSelectedTemp = configurableSelected.filter(
    (product) => product.selected === true,
  )

  var index = productId - 1

  if (configurableSelectedTemp.length == 0) {
    configurableSelected[index].selected = true
  } else {
    if (configurableSelected[index].selected == false) {
      // check surrounding from right
      if (index < configurableSelectedTemp[0].id - 1) {
        for (i = index; i < configurableSelectedTemp[0].id - 1; i++) {
          configurableSelected[i].selected = true
        }
      }
      // check surrounding from left
      else if (index > configurableSelectedTemp[0].id - 1) {
        for (
          i = index;
          i >
          configurableSelectedTemp[configurableSelectedTemp.length - 1].id - 1;
          i--
        ) {
          configurableSelected[i].selected = true
        }
      }
    } else if (
      configurableSelectedTemp.length !== 1 &&
      configurableSelected[index].selected == true
    ) {
      // disabling one when clicked on selected edge
      if (
        configurableSelected[index].selected == true &&
        (configurableSelected[index].id == configurableSelectedTemp[0].id ||
          configurableSelectedTemp[configurableSelectedTemp.length - 1].id ==
            configurableSelected[index].id)
      ) {
        configurableSelected[index].selected = false
      }
      // disabling to sides from inside of selected group
      else {
        var tempIndex = configurableSelectedTemp.findIndex(
          (product) => product.id == productId,
        )
        if (tempIndex < Math.trunc(configurableSelectedTemp.length / 2)) {
          for (i = index - 1; i >= configurableSelectedTemp[0].id - 1; i--) {
            configurableSelected[i].selected = false
          }
        } else {
          for (
            i = index + 1;
            i <
            configurableSelectedTemp[configurableSelectedTemp.length - 1].id;
            i++
          ) {
            configurableSelected[i].selected = false
          }
        }
      }
    }
  }

  productConfigurableSetButtonState(configurableSelectedTemp)
  productConfigurableSetState()
  productConfigurableWriteState()
  productConfigurableSaveState()
  productConfigurableUpdatePage()
}

function productConfigurableUnSelectAll() {
  configurableSelected.forEach((product) => {
    product['selected'] = false
  })
}

function productConfigurableSetState() {
  configurableSelected.forEach((product) => {
    if (product.selected) {
      $(product.el).addClass('selected')
    } else {
      $(product.el).removeClass('selected')
    }
  })
}

function productConfigurableWriteState($message) {
  $messageField = $('.product-customization-item')
    .first()
    .find('.product-message')
  $messageField.val($message ? $message : '')
  configurableSelected.forEach((product) => {
    if (product.selected) {
      $messageField.val(product.id + ',' + $messageField.val())
    }
  })
  $messageField.val(
    $messageField.val().substring(0, $messageField.val().length - 1),
  )
}

function productConfigurableSaveState() {
  var customizationContainers = $('.product-customization-item')
  customizationContainers.each(function () {
    var formActionAttribute_url = $('.product-customization form').attr(
      'action',
    )
    var formActionAttribute_name_field = $(this)
      .find('.product-message')
      .attr('name')
    var data = {}
    data[formActionAttribute_name_field] = $(this)
      .find('.product-message')
      .val()
    data['submitCustomizedData'] = 1
    data['ajax'] = 1

    $.post(formActionAttribute_url, data, null, 'json').done(function (data) {
      console.log(data)
      $('.product-actions #product_customization_id').val(data.id_customization)
    })
    return false
  })
}

function productConfigurableUpdatePage() {
  var countConfigurableSelected = configurableSelected.filter(
    (product) => product.selected === true,
  ).length
  $('[data-product-attribute]')
    .eq(countConfigurableSelected - 1)
    .trigger('click')
}

function productConfigurableSetButtonState(selectedArray) {
  if (selectedArray != undefined) {
    $('.modal .add-to-cart-anim.add button').prop('disabled', false)
  } else {
    $('.modal .add-to-cart-anim.add button').prop('disabled', true)
    console.log('disabled')
  }
}

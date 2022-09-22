var configurableSelected = [];
var selectedLengthElement = null;

$(document).ready(function () {
  // Cache
  var $configurableElements = $("[data-product-configurable]");
  var $configurableModal = $("#productConfigurable");
  var $productConfigurableOptions = $("[data-product-attribute]");

  var imageVariant = $("#main")
    .find("img#product_original_img")
    .first()
    .attr("src");

  if (typeof imageVariant === "undefined" || !imageVariant.length) {
    imageVariant = $("#main")
      .find("img[data-original]")
      .first()
      .attr("data-original");
  }

  $configurableElements
    .filter(function () {
      return $(this).data("productConfigurable") == "swiper";
    })
    .find("img")
    .attr("src", imageVariant);

  selectedLengthElement = $("[data-product-total-length]");

  $configurableElements
    .filter(function () {
      return parseInt($(this).data("productConfigurable"));
    })
    .each(function () {
      $(this).data(
        "productConfigurableId",
        parseInt($(this).data("productConfigurable"))
      );
      configurableSelected.push({
        id: parseInt($(this).data("productConfigurable")),
        selected: false,
        el: $(this),
      });
    });

  var swiperElement = $configurableElements.filter(function () {
    return $(this).data("productConfigurable") == "swiper";
  });

  var swiper = null;
  if (swiperElement.length != 0) {
    swiper = productConfigurableSwiper.call(swiperElement[0]);

    swiper.on("click", function () {
      productConfigurableSelect(
        $(swiper.clickedSlide).data("productConfigurable")
      );
    });

    $configurableModal.on("shown.bs.modal", function () {
      swiper.update();
    });
  }

  if ($configurableElements.length > 0) {
    productConfigurableSelect(1); //default select
  }

  var configurableCartAdd = $configurableElements.filter(function () {
    return $(this).data("productConfigurable") == "add";
  });

  $("body").on(
    "click",
    '.modal [data-button-action="add-to-cart"]',
    function () {
      var countConfigurableSelected = configurableSelected.filter(
        (product) => product.selected === true
      ).length;
      if (countConfigurableSelected) {
        $('.hidden [data-button-action="add-to-cart"]').trigger("click");
        productConfigurableUnSelectAll();
        productConfigurableSetState();
        setTimeout(function () {
          window.location.assign(prestashop.urls.pages.cart + "?action=show");
        }, 300);
      }
    }
  );

  $("body").on(
    "click",
    '[data-button-action="add-sample-to-cart"]',
    function () {
      tempSelectedIds = configurableSelected.filter(
        (product) => product.selected === true
      );
      productConfigurableUnSelectAll();
      productConfigurableWriteState("Próbka"); //TODO: Check why not updating
      productConfigurableSaveState();
      productConfigurableSetState();
      $("[data-product-attribute]").eq(6).trigger("click");
    }
  );

  $configurableElements
    .filter(function () {
      return $(this).data("productConfigurable") == "pdf";
    })
    .on("click", function (e) {
      $root = $configurableElements.filter(function () {
        return $(this).data("productConfigurable") == "modal";
      });

      $root.find('[itemprop="name"]');
      console.log($root);

      window.open(
        prestashop.urls.base_url +
          "/index.php?fc=module&module=webo_pdfgenerator&controller=validation&action=getpdffromwebsite&pdfnamefile=testowanazwa&templatelocation=module:webo_pdfgenerator/views/templates/displayPdfGenerator.tpl&ajax=true&color=ART032_TF_346&size=300cm%20x%20300cm&standard=Flizesila%20g%C5%82adka&texture=Standard&picture=https://feeby.webo.design/themes/feeby/assets/img/modules/appagebuilder/images/parawany_optimized.jpg&size=300%20cm&title=Fototapeta%20Spacer%20dzikich%20z%20wierz%C4%85t%20-%20Andrea%20Hasse&width=300&height=200",
        "_blank"
      );
    });

  if (typeof prestashop !== "undefined") {
    prestashop.on("updatedProduct", function (event) {
      if ($("[data-product-attribute]").eq(6).is(":checked")) {
        $("#quantity_wanted").val(1);
        productConfigurableWriteState("Próbka"); //TODO: Check why not updating
        $('.hidden [data-button-action="add-to-cart"]').trigger("click");

        tempSelectedIds.forEach((product) => {
          productConfigurableSelect(product.id);
        });
      }

      $configurableElements
        .filter(function () {
          return $(this).data("productConfigurable") == "modal";
        })
        .find(".product-prices")
        .first()
        .replaceWith(event.product_prices);
    });
  }

  if (typeof prestashop !== "undefined") {
    prestashop.on("updatedProduct", function (event) {
      var imageVariant = $(event.product_cover_thumbnails)
        .find("img#product_original_img")
        .first()
        .attr("src");

      $configurableElements
        .filter(function () {
          return $(this).data("productConfigurable") == "swiper";
        })
        .find("img")
        .attr("src", imageVariant);
    });
  }
});

function productConfigurableSwiper() {
  return new Swiper(this, {
    slidesPerView: "auto",
    spaceBetween: 1,
    watchOverflow: true,
    breakpoints: {
      480: {
        spaceBetween: 1,
      },
      768: {
        spaceBetween: 1,
      },
      1200: {
        spaceBetween: 3,
      },
    },
  });
}

function productConfigurableSelect(productId) {
  var configurableSelectedTemp = configurableSelected.filter(
    (product) => product.selected === true
  );

  var index = productId - 1;

  if (configurableSelectedTemp.length == 0) {
    configurableSelected[index].selected = true;
  } else {
    if (configurableSelected[index].selected == false) {
      // check surrounding from right
      if (index < configurableSelectedTemp[0].id - 1) {
        for (i = index; i < configurableSelectedTemp[0].id - 1; i++) {
          configurableSelected[i].selected = true;
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
          configurableSelected[i].selected = true;
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
        configurableSelected[index].selected = false;
      }
      // disabling to sides from inside of selected group
      else {
        var tempIndex = configurableSelectedTemp.findIndex(
          (product) => product.id == productId
        );
        if (tempIndex < Math.trunc(configurableSelectedTemp.length / 2)) {
          for (i = index - 1; i >= configurableSelectedTemp[0].id - 1; i--) {
            configurableSelected[i].selected = false;
          }
        } else {
          for (
            i = index + 1;
            i <
            configurableSelectedTemp[configurableSelectedTemp.length - 1].id;
            i++
          ) {
            configurableSelected[i].selected = false;
          }
        }
      }
    }
  }

  productConfigurableSetButtonState(configurableSelectedTemp);
  productConfigurableSetState();
  productConfigurableWriteState();
  productConfigurableSaveState();
  productConfigurableUpdatePage();
}

function productConfigurableUnSelectAll() {
  $("[data-product-attribute]").eq(0).trigger("click");
  configurableSelected.forEach((product) => {
    product["selected"] = false;
  });
  configurableSelected[0]["selected"] = true;
}

function productConfigurableSetState() {
  configurableSelected.forEach((product) => {
    if (product.selected) {
      $(product.el).addClass("selected");
    } else {
      $(product.el).removeClass("selected");
    }
  });
  productConfigurableDisplayLength();
}

function productConfigurableDisplayLength() {
  let selectedLength =
    configurableSelected.filter((product) => product.selected === true).length *
    100;
  selectedLength > 0
    ? selectedLengthElement.text(selectedLength + "cm")
    : selectedLengthElement.text("");
}

function productConfigurableWriteState($message) {
  $messageField = $(".product-customization-item")
    .first()
    .find(".product-message");
  if (typeof $message === "string") {
    $messageField.val($message);
  } else {
    let configurableSelectedTemp = [...configurableSelected];
    $messageField.val("");

    configurableSelectedTemp.reverse().forEach((product) => {
      if (product.selected) {
        $messageField.val(product.id + "," + $messageField.val());
      }
    });
    $messageField.val(
      $messageField.val().substring(0, $messageField.val().length - 1)
    );
  }
}

function productConfigurableSaveState() {
  var customizationContainers = $(".product-customization-item");
  customizationContainers.each(function () {
    var formActionAttribute_url = $(".product-customization form").attr(
      "action"
    );
    var formActionAttribute_name_field = $(this)
      .find(".product-message")
      .attr("name");
    var data = {};
    data[formActionAttribute_name_field] = $(this)
      .find(".product-message")
      .val();
    data["submitCustomizedData"] = 1;
    data["ajax"] = 1;

    $('[data-button-action="add-to-cart"]')
      .attr("disabled", "disabled")
      .addClass("adding");
    $.post(formActionAttribute_url, data, null, "json").done(function (data) {
      $('[data-button-action="add-to-cart"]')
        .attr("disabled", false)
        .removeClass("adding");

      if (typeof prestashop !== "undefined") {
        prestashop.once("updatedProduct", function (event) {
          $(".product-actions #product_customization_id").attr(
            "value",
            data.id_customization
          );
        });
      }

      $(".product-actions #product_customization_id").attr(
        "value",
        data.id_customization
      );
    });

    return false;
  });
}

function productConfigurableUpdatePage() {
  var countConfigurableSelected = configurableSelected.filter(
    (product) => product.selected === true
  ).length;
  $('[data-product-attribute="21"]')
    .eq(countConfigurableSelected - 1)
    .trigger("click");
}

function productConfigurableSetButtonState(selectedArray) {
  if (selectedArray != undefined) {
    $(".modal .add-to-cart-anim.add button").prop("disabled", false);
  } else {
    $(".modal .add-to-cart-anim.add button").prop("disabled", true);
  }
}

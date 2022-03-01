var configurableSelected = [];

$(document).ready(function () {
    // Cache
    var $configurableElements = $('[data-product-configurable]');
    var $configurableModal = $('#productConfigurable');
    var $productConfigurableOptions = $('[data-product-attribute]');

    $configurableElements.filter(function () {
        return parseInt($(this).data('productConfigurable'));
    }).each(function(){
        $(this).data('productConfigurableId', parseInt($(this).data('productConfigurable')));
        configurableSelected.push(
            {
                "id": parseInt($(this).data('productConfigurable')),
                "selected": false,
                "el": $(this)
            }
        );
    });

    // Swiper carousel initiation
    var swiperElement = $configurableElements.filter(function () {
        return $(this).data('productConfigurable') == 'swiper';
    })

    var swiper = null;
    if(swiperElement.length != 0) {
        swiper = productConfigurableSwiper.call(swiperElement[0]);
    

        swiper.on('click', function(){
            productConfigurableSelect($(swiper.clickedSlide).data('productConfigurable'));
        });

        $configurableModal.on('shown.bs.modal', function () {
            swiper.update();
        });
    };

    var configurableCartAdd = $configurableElements.filter(function () {
        return $(this).data('productConfigurable') == 'add';
    });
    $('body').on('click','.modal [data-button-action="add-to-cart"]', function(){
        var countConfigurableSelected = configurableSelected.filter(product => product.selected === true).length;
        console.log(countConfigurableSelected);
        if(countConfigurableSelected){
            productConfigurableUnSelectAll();
            productConfigurableSetState();
            $('.hidden [data-button-action="add-to-cart"]').trigger('click');
            window.location.reload();   //ajax minicart reload
        }
    });

    if (typeof prestashop !== 'undefined') {
        prestashop.on(
            'updatedProduct' ,
            function (event) {
                //blokada przycisku
            }
        );
    }
      
      
    
    
    // var firstIndex = undefined;
    // var lastIndex = undefined;
    // var tempIndex = undefined;

    // var partsArray = $('[data-product-configurable="swiper"] [data-product-configurable]').each(function () {

    //     $(this).mouseenter(function(){
    //         if(firstIndex!= undefined && lastIndex == undefined){
    //             tempIndex = $(this).attr('data-product-configurable');
    //             if (firstIndex<tempIndex) {
    //                 for( i = firstIndex ; i < tempIndex ; i++ ){
    //                     $(partsArray[i-1]).addClass('selected');
    //                 }
    //                 for( i = tempIndex ; i < partsArray.length ; i++ ){
    //                     $(partsArray[i-1]).removeClass('selected');
    //                 }
    //             } else {
    //                 for( i = firstIndex ; i >= 0 ; i-- ){
    //                     $(partsArray[i-1]).addClass('selected');
    //                 }
    //                 for( i = 0 ; i < tempIndex ; i++ ){
    //                     $(partsArray[i-1]).removeClass('selected');
    //                 }
                    
    //             }
    //         }
    //     })

    //     $(this).mouseleave(function(){
    //         if(firstIndex!=undefined){
    //             for( i = 0 ; i < partsArray.length ; i++ ){
    //                 if(i!=firstIndex-1 && lastIndex==undefined){
    //                     $(partsArray[i]).removeClass('selected');
    //                 }
    //             }
    //         }
    //     })

	// 	$(this).click(() => {

    //         if(firstIndex==undefined){
    //             $(this).addClass('selected');
    //             firstIndex =  $(this).attr('data-product-configurable');
    //         }else if( lastIndex==undefined){
    //             if(firstIndex!=$(this).attr('data-product-configurable')){
    //                 $(this).addClass('selected');
    //                 lastIndex =  $(this).attr('data-product-configurable');
    //             }else{
    //                 firstIndex = undefined;
    //                 lastIndex= undefined;
    //                 $(this).removeClass('selected');

    //             }
    //         }else if(firstIndex!= undefined && lastIndex!= undefined){
    //             firstIndex =  $(this).attr('data-product-configurable');
    //             lastIndex = undefined;
    //             for( i = 0 ; i < partsArray.length ; i++ ){
    //                 if(i!=firstIndex-1){
    //                     $(partsArray[i]).removeClass('selected');
    //                 }
    //             }   
    //         }
    //     })
	// })

    // $('body').on("click", function(e){ 

    //         if($(e.target).has('[data-product-configurable="swiper"] [data-product-configurable].swiper-slide').length == 1 ){
    //             for( i = 0 ; i < partsArray.length ; i++ ){
    //                 $(partsArray[i]).removeClass('selected');
    //                 firstIndex = undefined;
    //                 lastIndex = undefined;
    //             } 
    //         }
    // });
    
});


function productConfigurableSwiper() {
    return new Swiper(this, {
        slidesPerView: 4,
        spaceBetween: 10,
        breakpoints: {
            480: {
                slidesPerView: 6,
            },
            768: {
                slidesPerView: 6,
                allowTouchMove: false,
            }
        },
    });
}

function productConfigurableSelect(productId){
    
    if (configurableSelected[productId - 1].selected == false ) {
        configurableSelected[productId - 1].selected = true;

        var configurableSelectedTemp = configurableSelected.filter(product => product.selected === true)
        
        if(configurableSelectedTemp.length == 2 ){
            var firstId = configurableSelectedTemp[0].id;
            var lastId = configurableSelectedTemp[configurableSelectedTemp.length - 1].id; 
            for(i = firstId; i < lastId ; i++){
                configurableSelected[i-1].selected = true;
            }
        }
        else if(configurableSelectedTemp.length > 2 ){
            productConfigurableUnSelectAll();
            configurableSelected[productId - 1].selected = true;
        }
    }
    else{
        productConfigurableUnSelectAll();
    }
    
    //button set state 

    productConfigurableSetState();
    productConfigurableWriteState();
    productConfigurableSaveState();
    productConfigurableUpdatePage();
}

function productConfigurableUnSelectAll(){
    configurableSelected.forEach(product => {
        product['selected'] = false;
    });
}

function productConfigurableSetState(){
    configurableSelected.forEach(product => {
        if (product.selected) {     
            $(product.el).addClass('selected');
        }
        else{
            $(product.el).removeClass('selected');
        }
    });
}

function productConfigurableWriteState(){
    $messageField = $(".product-customization-item").first().find(".product-message");
    $messageField.val('');
    configurableSelected.forEach(product => {
        if (product.selected) {     
            $messageField.val(product.id + ',' + $messageField.val())
        }
    });
    $messageField.val($messageField.val().substring(0, $messageField.val().length - 1));
}

function productConfigurableSaveState(){
    var customizationContainers = $(".product-customization-item");
    customizationContainers.each(function() {

        var formActionAttribute_url = $(".product-customization form").attr('action');
        var formActionAttribute_name_field = $(this).find(".product-message").attr("name");
        var data = {};
        data[formActionAttribute_name_field] =  $(this).find(".product-message").val();
        data['submitCustomizedData'] = 1;
        data['ajax'] = 1;

        $.post(formActionAttribute_url, data, null, 'json').done(function(data) {
            console.log(data);
            $(".product-actions #product_customization_id").val(data.id_customization);
        });
        return false;
    })
}

function productConfigurableUpdatePage() {
    var countConfigurableSelected = configurableSelected.filter(product => product.selected === true).length;
    $('[data-product-attribute]').eq( countConfigurableSelected - 1 ).trigger('click');
}
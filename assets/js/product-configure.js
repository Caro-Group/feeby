var configurableSelected = [];

$(document).ready(function () {
    // Cache
    var $configurableElements = $('[data-product-configurable]');
    var $configurableModal = $('#productConfigurable');

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

    // Swiper carousel initiation
    var configurableCartAdd = $configurableElements.filter(function () {
        return $(this).data('productConfigurable') == 'add';
    }).on('click', function(e){
        var idEvent = Math.floor(e.timeStamp);
        if (typeof prestashop !== 'undefined') {
            prestashop.on(
              'updateCart.onClickConfigureProduct_' + idEvent ,
              function (event) {
                // Check if all events of update configured product updated succesfull
                $('[data-button-action="add-to-cart"]').trigger('click');
                prestashop.off('updateCart.onClickConfigureProduct_' + idEvent);
              }
            );
          }

        var countConfigurableSelected = configurableSelected.filter(product => product.selected === true).length;
        $('[data-product-attribute]').eq( countConfigurableSelected - 1 ).trigger('click');
    });
    
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

    configurableSelected.filter(product => product.id === productId).forEach(product => {
        product['selected'] = true;
    });

    //console.log(configurableSelected);

    // if(firstIndex==undefined){
    //     $(this).addClass('selected');
    //     firstIndex =  $(this).attr('data-product-configurable');
    // }else if( lastIndex==undefined){
    //     if(firstIndex!=$(this).attr('data-product-configurable')){
    //         $(this).addClass('selected');
    //         lastIndex =  $(this).attr('data-product-configurable');
    //     }else{
    //         firstIndex = undefined;
    //         lastIndex= undefined;
    //         $(this).removeClass('selected');

    //     }
    // }else if(firstIndex!= undefined && lastIndex!= undefined){
    //     firstIndex =  $(this).attr('data-product-configurable');
    //     lastIndex = undefined;
    //     for( i = 0 ; i < partsArray.length ; i++ ){
    //         if(i!=firstIndex-1){
    //             $(partsArray[i]).removeClass('selected');
    //         }
    //     }   
    // }
}

function productConfigurableUnSelectAll(){
    configurableSelected.forEach(product => {
        product['selected'] = false;
    });
}

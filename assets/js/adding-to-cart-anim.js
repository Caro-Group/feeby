$(document).ready(function(){

    var waiting=0;
    $('body').on('click','.product-add-to-cart .add button',function(){
        $('.product-add-to-cart .add button').addClass('adding');
        waiting++;
    });
    
    prestashop.on('updateCart', function (event) {
        if (event.reason.linkAction == "add-to-cart") {            
            waiting--;
            if (waiting <= 0 ) {
                $('body').find('.product-add-to-cart .add button').switchClass('adding','added');
                setTimeout(function () {
                    $('body').find('.product-add-to-cart .add button').removeClass('added');						
                },1500);		
            }
        }
    })
    
    prestashop.on('handleError',function (event) {
        if (event.eventType == "updateProductInCart") {
            $('body').find('.product-add-to-cart .add button').switchClass('adding','failed');
            setTimeout(function () {
                $('body').find('.product-add-to-cart .add button').removeClass('failed');						
            },3000);
        }
        waiting = 0;
    })

    // HIDING POPUP
    $('body').on('shown.bs.modal', '#blockcart-modal',function(){
      
        $('.modal').modal('hide').fadeOut();
        $('.modal-backdrop').fadeOut(); 
    })

})

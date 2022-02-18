$(document).ready(function(){

    var waiting=0;
    $('body').on('click','.product-add-to-cart button',function(){
        $('.product-add-to-cart button').addClass('adding');
        waiting++;
    });
    
    prestashop.on('updateCart', function () {
        waiting--;
        if (waiting == 0 ) {
            $('body').find('.product-add-to-cart button').switchClass('adding','added');
            setTimeout(function () {
                $('body').find('.product-add-to-cart button').removeClass('added');						
            },2000);		
        }
    })
    
    prestashop.on('handleError',function (event) {
        console.log(event.eventType)
        if (event.eventType == "updateProductInCart") {
            $('body').find('.product-add-to-cart button').switchClass('adding','failed');
            setTimeout(function () {
                $('body').find('.product-add-to-cart button').removeClass('failed');						
            },3000);
        }
        waiting = 0;
    })

    // HIDING POPUP
    // HIDING POPUP
    $('body').on('shown.bs.modal', '#blockcart-modal',function(){
      
        $('.modal').modal('hide').fadeOut();
        $('.modal-backdrop').fadeOut(); 
    })

})

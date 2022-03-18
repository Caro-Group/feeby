$(document).ready(function(){

    var waiting=0;
    $('body').on('click','.add-to-cart-anim.add button',function(){
        $(this).addClass('adding');
        waiting++;
        if ($(this).data('buttonAction')=="add-sample-to-cart"){
            waiting--;
        }
    });
    
    prestashop.on('updateCart', function (event) {
        if (event.reason.linkAction == "add-to-cart") {            
            waiting--;
            if (waiting <= 0 ) {
                $('body').find('.add-to-cart-anim.add button.adding').switchClass('adding','added');
                setTimeout(function () {
                    $('body').find('.add-to-cart-anim.add button.added').removeClass('added');						
                },1500);		
            }
        }
    })
    
    prestashop.on('handleError',function (event) {
        if (event.eventType == "updateProductInCart") {
            $('body').find('.add-to-cart-anim.add button.adding').switchClass('adding','failed');
            setTimeout(function () {
                $('body').find('.add-to-cart-anim.add button.failed').removeClass('failed');						
            },3000);
        }
        waiting = 0;
    })

    // HIDING POPUP
    $('body').on('shown.bs.modal', '#blockcart-modal',function(){
      
        $('.modal#blockcart-modal').modal('hide').fadeOut();
        $('.modal-backdrop').fadeOut(); 
    })

})

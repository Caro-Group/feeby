var waiting=0;
$('.product-add-to-cart button').click(function(){
    $(this).addClass('adding');
    waiting++;
});

prestashop.on('updateCart', function (event) {
    waiting--;
    if (waiting == 0 ) {
        $('.product-add-to-cart button').switchClass('adding','added');
        setTimeout(function () {
            $('.product-add-to-cart button').removeClass('added');						
        },2000);		
    }
})

prestashop.on('handleError',function () {
    $('.product-add-to-cart button').removeClass('adding');
    waiting = 0;
})

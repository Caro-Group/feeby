$(document).ready(function () {

	if($('[data-swiper-configure]').length != 0) {
		new Swiper('[data-swiper-configure]', {
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
			  }
		});
	};

    
    var firstIndex = undefined;
    var lastIndex = undefined;
    var tempIndex = undefined;

    var partsArray = $('[data-swiper-configure] [data-configure-part].swiper-slide').each(function () {

        $(this).mouseenter(function(){
            if(firstIndex!= undefined && lastIndex == undefined){
                tempIndex = $(this).attr('data-configure-part');
                if (firstIndex<tempIndex) {
                    for( i = firstIndex ; i < tempIndex ; i++ ){
                        $(partsArray[i-1]).addClass('selected');
                    }
                    for( i = tempIndex ; i < partsArray.length ; i++ ){
                        $(partsArray[i-1]).removeClass('selected');
                    }
                } else {
                    for( i = firstIndex ; i >= 0 ; i-- ){
                        $(partsArray[i-1]).addClass('selected');
                    }
                    for( i = 0 ; i < tempIndex ; i++ ){
                        $(partsArray[i-1]).removeClass('selected');
                    }
                    
                }
            }
        })

        $(this).mouseleave(function(){
            if(firstIndex!=undefined){
                for( i = 0 ; i < partsArray.length ; i++ ){
                    if(i!=firstIndex-1 && lastIndex==undefined){
                        $(partsArray[i]).removeClass('selected');
                    }
                }
            }
        })

		$(this).click(() => {

            if(firstIndex==undefined){
                $(this).addClass('selected');
                firstIndex =  $(this).attr('data-configure-part');
            }else if( lastIndex==undefined){
                if(firstIndex!=$(this).attr('data-configure-part')){
                    $(this).addClass('selected');
                    lastIndex =  $(this).attr('data-configure-part');
                }else{
                    firstIndex = undefined;
                    lastIndex= undefined;
                    $(this).removeClass('selected');

                }
            }else if(firstIndex!= undefined && lastIndex!= undefined){
                firstIndex =  $(this).attr('data-configure-part');
                lastIndex = undefined;
                for( i = 0 ; i < partsArray.length ; i++ ){
                    if(i!=firstIndex-1){
                        $(partsArray[i]).removeClass('selected');
                    }
                }   
            }
        })
	})

    $('body').on("click", function(e){ 

            if($(e.target).has('[data-configure-part].swiper-slide').length == 1 ){
                for( i = 0 ; i < partsArray.length ; i++ ){
                    $(partsArray[i]).removeClass('selected');
                    firstIndex = undefined;
                    lastIndex = undefined;
                } 
            }
    });
    
});
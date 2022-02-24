$(document).ready(function () {
	if($('[data-swiper-configure]').length != 0) {
		new Swiper('[data-swiper-configure]', {
			slidesPerView: 'auto',
			spaceBetween: 0,
			slideClass: 'slide-parts',
            // freeMode: true,
			breakpoints: {
				768: {
					slidesPerView: 5,
					allowTouchMove: false,
				},
			  }
		});
	};
});
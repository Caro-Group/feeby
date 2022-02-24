$(document).ready(function () {
	if($('[data-swiper-configure]').length != 0) {
		new Swiper('[data-swiper-configure]', {
			speed: 400,
			spaceBetween: 20,
			slidesPerView: 'auto',
            freeMode: true,
			breakpoints: {
				768: {
					slidesPerView: 5,
				},
			  }
		});
	};
});
$(document).ready(function () {
	if($('[data-swiper-configure]').length != 0) {
		new Swiper('[data-swiper-configure]', {
			slidesPerView: 3,
			spaceBetween: 10,
			breakpoints: {
				520: {
					slidesPerView: 6,
				},
				768: {
					allowTouchMove: false,
				}
			  }
		});
	};
});
$(document).ready(function () {
	if($('[data-swiper-configure]').length != 0) {
		new Swiper('[data-swiper-configure]', {
			slidesPerView: 'auto',
			spaceBetween: 10,
			breakpoints: {
				520: {
					slidesPerView: 5,
					allowTouchMove: false,
				},
			  }
		});
	};
});
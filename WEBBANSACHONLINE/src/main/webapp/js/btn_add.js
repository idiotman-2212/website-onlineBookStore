$(document).ready(function() {
	let
	value = $('.${o.productId}').text();
	$('.btn_minus').click(function(e) {
		e.preventDefault();

		if (value > 1) {
			value--;
		} else {
			value = 1;
		}

		console.log(value);
		$('.${o.productId}').val(value);
	});

	$('.btn_plus').click(function(e) {
		e.preventDefault();

		if (value < 100) {
			value++;
		}
		console.log(value);
		$('.${o.productId}').val(value);
	});

});
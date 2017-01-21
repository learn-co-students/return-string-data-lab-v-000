$(function() {
	$('.js-more').on('click', function() {
		var id = $(this).data('id');

		$.get("products/" + id + "/description", function(data) {
			$('#description-'+ id).html(data);
		});

		$.get("products/" + id + "/availability", function (data) {
			if (data === "true") {
				$('#price-' + id).append(" Available");
			} else if (data === "false") {
				$('#price-' + id).append(" Sold Out");
			};
		});

	});
});
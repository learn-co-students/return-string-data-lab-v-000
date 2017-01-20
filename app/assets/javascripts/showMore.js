$(document).ready(function(){
	showMore();
})


function showMore() {
	$(".js-more").click(function(e){
		var id = $(this).data("id")
		
		$.get(`/products/${id}/description`, function(data){
			$(`#desc-${id}`).text(data)
			
		})

		$.get(`/products/${id}/inventory`, function(data){
			if (data === true) {$(`#inv-${id}`).text("Available")} else {$(`#inv-${id}`).text("Sold Out")}
			
			
		})
		e.stopPropagation();
	})
}
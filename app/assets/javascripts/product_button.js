$(document).ready(function(){
	$(".js-more").on("click", function(e){
		e.preventDefault()
		var $button = $(this);
		var id = $button.data("id");
      
		$.get("/products/" + id + "/description", function(description){
			$.get("/products/" + id + "/inventory",function(inventory){
				var availability = inventory == "true" ? "Available" : "Sold Out" 
                $("#product-" + id).html("<p>" + availability + "</p>" + "<p>" + description + "</p>")
			});
		});
	});
});
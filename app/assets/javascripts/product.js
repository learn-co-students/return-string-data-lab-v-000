//1. when the document is ready,
$(function(){
	// When someone click the "More Info" button, 
  $(".js-more").on("click", function(e){
  	//it should fetches the description and the inventory 
  	// and displays the result. If there is inventory available, display "Available" and if there isn't, display "Sold Out".
  	const id = $(this).data("id")	
  	$.get("/products/" + id + "/description", function(data_description) {
  		debugger
      $("div#product-"+id+"-description").html(data_description); 
    })   
    $.get("/products/" + id + "/inventory", function(data_inventory) {
      const availability =  (data_inventory === "true") ? "Available" : "Sold Out"
      debugger
      $("div#product-"+id+"-inventory").html(availability); 
    }) 
    e.preventDefault();
  })
})




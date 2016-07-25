$(document).ready(function(){
  $(".js-more").on("click", function(event){
    var id = $(this).data("id");
    $.get("/products/" + id + "/description", function(data){
      $("#description-" + id).text(data);
    })
    
    $.get("/products/" + id + "/inventory", function(data){
      var inventoryElement = $("#inventory-" + id);
      if(data === 'true'){
        inventoryElement.text('Available');
      }
      else{
        inventoryElement.text('Sold Out');
      }
    })
    
    event.preventDefault(); 
  });

});
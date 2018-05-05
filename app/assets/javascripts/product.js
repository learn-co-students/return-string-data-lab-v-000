$(function(){
  $('.js-more').on('click', function(){

    var id = $(this).data("id")

    $.get("/products/"+id+"/description", function(data){
       $("#details-"+id).text(data)

    });
    $.get("/products/"+id+"/inventory", function(data){
      if (data === "true"){
        $("#details-"+id).append("<p>Available</p>")
      } else {
        $("#details-"+id).append("<p>Sold Out</p>")
      }
    });
  });
});

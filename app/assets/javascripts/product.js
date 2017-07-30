$(function() {
  $(".js-more").on("click", function(){
    var id = $(this).data("id")
    var output = ""
    $.get("/products/"+id+"/description", function(data){
      output += data
      $("#info"+id).text(output);
    })
    $.get("/products/"+id+"/inventory", function(data){
      if(data === "true"){
        $("#info"+id).append(" Inventory Available!");
      }else {
        $("#info"+id).append(" Inventory Sold Out.");
      }
    })
  })
});

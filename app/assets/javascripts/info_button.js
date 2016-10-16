$( document ).ready(function() {
  moreInfo();
});

function moreInfo() {
  $(".moreData").click(function(e) {
    var id = $(e.target).data("id")
    var description;
    var inventory;
    $.get("/description/" + id, function(response) {
      console.log(response)
      $("#product-" + id + " li").text(response);
      $.get("/inventory/" + id, function(response) {
        console.log(response)
        if (response === "true") {
          $("#product-" + id + " li" ).append("<li>Available</li>");
        } else {
          $("#product-" + id + " li" ).append("<li>Sold Out</li>");
        }
      });
    });
    
  });
}

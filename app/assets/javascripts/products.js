function get_info(button){
  var id = $(button).data("id");
  $.get("/products/" + id + "/inventory", function(result) {
    if (result == "true") {
      $("#available_" + id).html("Available");
    } else {
      $("#available_" + id).html("Sold Out");
    }
  });

  $.get("/products/" + id + "/description", function(result) {
    $("#description_" + id).html(result);
  });
}

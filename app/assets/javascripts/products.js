$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    var $info = $("#info-" + id)
    var $inventory = $("#inventory-" + id)
    $info.text("")
    $.get("/products/" + id + "/description", function(description) {
      console.log(description)
      $info.append(description);
    });
    $.get("/products/" + id + "/inventory", function(inventory) {
      (inventory === "true") ? $info.append("Available") : $info.append("Sold Out")
    });
  });
});

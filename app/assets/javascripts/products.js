$(function() {
  $(".js-more").click(function() {
    const id = $(this).data("id");
    $.get("/products/" + id + "/description", function(d) {
      $("#description-" + id).text(d);
    })

    $.get("/products/" + id + "/inventory", function(i) {
      if (i === "true") {
        $("#inventory-" + id).text("Available");
      } else {
        $("#inventory-" + id).text("Sold Out");
      }
    });
  });
});

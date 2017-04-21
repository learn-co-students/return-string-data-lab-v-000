$(function () {
  $(".more-info").on('click', function() {
    const id = this.dataset.id;
    const $product = $("#product-" + id)

    $.get("/products/" + id + "/description", function(data) {
      $product.text(data);
    });

    $.get("/products/" + id + "/inventory", function(data) {
      if (data === 'true') {
        $product.after("<p>Available</p>");
      } else {
        $product.after("<p>Sold Out</p>");
      }
    });

  });
});


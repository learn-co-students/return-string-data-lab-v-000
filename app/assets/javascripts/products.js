$(function() {
  $(".js-more").on("click", function() {
    var id = $(this).data("id");
    $.get("/products/" + id + "/description", function(description) {
      $.get("/products/" + id + "/inventory", function(inventory) {
        var inventoryText = "<strong>Available</strong>";
        if(inventory === "false"){
          inventoryText = "<strong>Sold Out</strong>";
        }
        var descriptionText = "<p>" + description + "</p><p>" + inventoryText + "</p>";
        $("#product-" + id).html(descriptionText);
      });
    });
  });
});

  // $(function(){
//   $("button.button").on("click", function(e){
//     e.preventDefault(); 
//     let $product = $(this)
//     let product_id = $product.data("id")
//     $.get(`/products/${product_id}/description`, function(description){
//       $.get(`/products/${product_id}/inventory`, function(inventory){
//         let availability;
//         if (inventory == "true"){
//           availability = "Available"
//         } else if (inventory === "false") {
//           availability = "Sold Out"
//         }
//         let productString = `${description}  ${availability}`;
//         $(`#product_${product_id}`).html(productString);
//       })
//     })
//   })
// })  
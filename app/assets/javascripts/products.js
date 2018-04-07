// $(function(){
//   $(".js-more-info").on("click", function(e){
//     var productId = $(this).data("id")
//     $.get(`/products/${productId}/description`, function(description){
//       $.get(`/products/${productId}/inventory`, function(inventory){
//         var availability = "Available"
//         if (inventory === "false" ){
//           availability = "Sold Out"
//         }
//         var productString = "<p>" + description + "</p><p> " + availability + "</p>";
//         $("#product-" + productId).html(productString);
//       })
//     })
//   })
// })  

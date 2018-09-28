// $(function () {
//   $(".button_body").on("click", function () {
//     var id = $(this).data("id")
//     $.get(`/products/${id}/description`, function (response_description) {
//       var description = response_description
//       $.get(`/products/${id}/inventory`, function (response_inventory) {
//         var info = description + " - " + Inventory(response_inventory)
//         $(".body_" + id).text(info)
//         $(".button_" + id).hide()
//       })
//     })
//   })
// })
//
// function Inventory(response) {
//   if (response === "false") {
//     return "Sold Out"
//   } else {
//     return "Available"
//   }
// }

// $(document).ready(() => {
//   $('.js-more-info').on('click', function(e) {
//     e.preventDefault();
//     const productId = $(this).data('id');
//     // debugger
//     $.get(`/products/${productId}/description`).success((data) => {
//       $(`#desc-${productId}`).text(data);
//     });
//     $.get(`/products/${productId}/inventory`).success((data) => {
//       const availability = {
//         'true': "Available",
//         'false': "Sold Out"
//       }[data];
//       $(`#desc-${productId}`).before(`<p>${availability}</p>`);
//     });
//   });
// });

$(document).ready(function() {
  $('.js-more').on('click', function() {
    var productId = $(this).data('id');
    $.get('/products/' + productId + '/description', function(description) {
      $.get('/products/' + productId + '/inventory', function(inventory) {
        var availability = {
          'true': "Available",
          'false': "Sold Out"
        }[inventory];
        $('#product-' + productId).html(description + availability);
      });
    });
  });
});

// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?
// ARE YOU FUCKING KIDDING ME!?!?!?!?!?! IT WAS THE FUCKING ES6 SYNTAX!?!?!?

// $(document).ready(function() {
//   $(".js-more").on("click", function() {
//     var id = $(this).data("id");
//     $.get("/products/" + id + "/description", function(description) {
//       $.get("/products/" + id + "/inventory", function(inventory) {
//         var inventoryText = "<strong>Available</strong>";
//         if(inventory === "false"){
//           inventoryText = "<strong>Sold Out</strong>";
//         }
//         var descriptionText = "<p>" + description + "</p><p>" + inventoryText + "</p>";
//         $("#product-" + id).html(descriptionText);
//       });
//     });
//   });
// });

// $(document).ready(() => {
//   $('.js-more-info').on('click', function() {
//     // e.preventDefault();
//     const productId = $(this).data('id');
//     $.get(`/products/${productId}/description`).success((description) => {
//       $.get(`/products/${productId}/inventory`).success((inventory) => {
//         const availability = {
//           'true': "Available",
//           'false': "Sold Out"
//         }[inventory];
//         $(`#desc-${productId}`).html(description + " " + availability);
//       });
//     });
//   });
// });

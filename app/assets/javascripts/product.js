$(document).ready(function() {
  $('.js-more').on('click', function() {
    var productId = $(this).data('id');
    $.get('/products/' + productId + '/description', function(description) {
      $.get('/products/' + productId + '/inventory', function(inventory) {
        var availability = {
          'true': 'Available', 'false': 'Sold Out'
        }[inventory];
        $('#product-' + productId).html(description + availability);
      });
    });
  });
});

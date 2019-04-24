$(function(){
  $('.js-more').on('click', function() {
    var id = $(this).data("id");

    $.get('/products/' + id + "/inventory", function(res) {
      if (res === "true") {
        $('#product-' + id + '-availability').html('<strong>Available</strong>')
      } else {
        $('#product-' + id + '-availability').html('<strong>Sold Out</strong>')
      }
    });

    $.get('/products/' + id + '/description', function(response) {
      $("#product-" + id).text(response)
    });
  });
});

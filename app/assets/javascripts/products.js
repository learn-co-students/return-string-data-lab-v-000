$(function() {
  $(".js-more").on('click', function(e) {
    var id = $(this).data('id');
    $.get('/products/' + id + '/description', function(text) {
      $('#body-' + id).text(text);
    });
    $.get('/products/' + id + '/inventory', function(response) {
      if (response === 'true') {
        $('#body-' + id).append('<p>Available</p>');
      } else {
        $('#body-' + id).append('<p>Sold Out</p>');
      }
    })
  });
});

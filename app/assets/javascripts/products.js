$(document).ready(
  function(){
    $(".js-more").on("click", function(){
      const id = $(this).data("id")
      $.get('/products/' + id + '/description', function(data){
        $('#product-' + id).text(data)
      })
      $.get('/products/' + id + '/inventory', function(data){
        if (data === "true") {
          const toShow = "Available"
          $('#product-' + id).append("<p>" + toShow + "</p>")
        } else {
          const toShow = "Sold Out"
          $('#product-' + id).append("<p>" + toShow + "</p>")
        }
      })
    })
  }
)
  

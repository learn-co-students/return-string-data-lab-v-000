$(document).ready = init

function init(){
  $(".js-more-buttons").on("click", viewMore)
}

function viewMore(){
  let id = $(this).data("id")
  console.log(id)
  $(id).appendChild("<p>Sold Out!</p>")
}

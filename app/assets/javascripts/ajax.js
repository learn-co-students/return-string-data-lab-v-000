$(function(){
  $(".js-more").on("click", function(){
    $button = $(this)
    $.get("products/" + $button.data().id + "/inventory/", function(){

    })
  })
})

$(function () {
  $(".button_body").on("click", function () {
    var id = $(this).data("id")
    $.get(`/products/${id}/description`, function (response_description) {
      var description = response_description
      console.log("description")
      // $(".body_" + id).text(response)
      // $(".button_" + id).hide()
      $.get(`/products/${id}/inventory`, function (response_inventory) {
        var info = description + " - " + response_inventory
        $(".body_" + id).text(info)
        $(".button_" + id).hide()
      })
    })
  })
})

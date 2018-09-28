$(function () {
  $(".button_body").on("click", function () {
    var id = $(this).data("id")
    $.get(`/products/${id}/description`, function (response_description) {
      var description = response_description
      $.get(`/products/${id}/inventory`, function (response_inventory) {
        var info = description
        var status = "Status: " + Inventory(response_inventory)
        $(".inventory_" + id).text(status)
        $(".body_" + id).text(info)
        $(".button_" + id).hide()
      })
    })
  })
})

function Inventory(response) {
  if (response === "false") {
    return "Sold Out"
  } else {
    return "Available"
  }
}

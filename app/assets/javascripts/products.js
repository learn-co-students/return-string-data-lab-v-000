$( document ).ready(function() {
  $("button.js-more").on("click", function(e) {
    e.preventDefault()
    let id = $(this).data("id")

    $.get("/products/" + id + "/description").success(function(data) {
        $("#desc-" + id).text("Desc: " + data)
    })

    $.get("/products/" + id + "/inventory").success(function(data) {
      let result = (data === "true" ? "Available" : "Sold Out")
      $("#desc-" + id).after("<p>Inventory: " + result + "</p>")
    })
  })
})

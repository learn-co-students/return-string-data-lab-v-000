$(function(){
    $('.js-get-product-description')
    .on('click', function(e){

        $.ajax({
          url: this.href,
          method: "GET",
          contentType: 'application/json; charset=utf-8'
          }).success(function(json){
            $('.product-description').html(json);
        })
        // debugger
        $.get(`products/${this.dataset["id"]}/inventory`, function(json){
            // debugger
            $('.product-description').html(json);
        })
        e.preventDefault()
    })
})

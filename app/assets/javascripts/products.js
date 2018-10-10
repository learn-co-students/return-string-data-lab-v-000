$(function(){
    $('.js-get-product-description')
    .on('click', function(e){
        $.ajax({
          url: this.href,
          method: "GET",
          contentType: 'application/json; charset=utf-8'
          }).success(function(json){
              var c = json
            $('.product-description').append().html(c);
            $('.product-description-trunc').hide()
        })
        $.get(`products/${this.dataset["id"]}/inventory`, function(json){
             if(json === "false"){
                $('.product-inventory').append().html("Sold Out");
              }else{
                $('.product-inventory').append().html("Available");
              }
        })
        e.preventDefault()
    })
})
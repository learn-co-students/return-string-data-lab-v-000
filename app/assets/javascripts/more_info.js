$(function () {
    $('.js-moreInfo').click(function (e) {
        let id = $(this).data("id");
        $.get(`/products/${id}/description`, function (description) {
            $(`#description-${id}`).html(description);
        });
        $.get(`/inventory/${id}`, function (stockStatus) {
            if (stockStatus == 'true') {
                stockStatus = 'Available'
            } else {
                stockStatus = 'Sold Out'
            }
            $(`#inStock-${id}`).html(stockStatus);
        });
    });
});

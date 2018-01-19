$(function() {
    $('button.description-link').on('click', function(e) {
        $.get('products/description/' + this.name).success(function(description) {
            $('div.long-description')[0].textContent = description
        })

        $.get('products/inventory/' + this.name).success(function(inventory) {
            $('div.inventory')[0].textContent = (inventory == 'false') ? "Sold Out" : "Available"
        })

        e.preventDefault();
    })
})
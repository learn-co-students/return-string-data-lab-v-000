function Product(id){
    this.id = id;
    this.descriptionParagraph = $('p#desc-' + this.id);
    this.div = $('div#product-' + this.id)[0];
    this.button = this.div.children[this.div.childElementCount - 1]

    this.fetchDescription = function(callback){
        return fetch("/products/" + this.id + "/description")
        .then(function(res){
            return res.text()
        })
        .then(function(desc){
            this.description = desc;
            if(!!callback){
                callback(desc);
            }   
        }.bind(this))
    }

    this.append = function(type, innerHTML){
        this.descriptionParagraph.append('<' + type + ">" + innerHTML + "</" + type + ">");
    }

    this.fetchInventory = function(callback){
        return fetch('/products/' + this.id + '/inventory')
        .then(function(res){
            return res.text()
        })
        .then(function(inv){
            this.inventory = inv;
            if(!!callback){
                callback(inv)
            }
        }.bind(this))
    }


    this.ready = function(callback){
        Promise.all([this.fetchInventory(), this.fetchDescription()])
        .then(function(res){
            callback(res);
        }.bind(this));
    }
}



$(function(){
    $(document).on('click', '.js-more', function(){
        var button = this;
        var id = button.dataset.prodid;
        var prod = new Product(id);
        prod.ready(function(){
            prod.descriptionParagraph.html(prod.description);
            var msg;
            if(prod.inventory === "true"){
                msg = "Available";
            }else{
                msg = "Sold Out";
            }
            prod.append("p", msg);
        });
    })
})


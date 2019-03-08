class ProductsController < ApplicationController
    def description
        product = Product.find(params[:id])
        
    end

    def inventory
    end

    def index
        @products = Product.all
    end
end

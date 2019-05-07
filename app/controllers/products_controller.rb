class ProductsController < ApplicationController

    def create 
        @product = Product.create(product_params)
        @product.save 
        redirect_to product_path(@product)
    end

    def new 
        @product = Product.new
    end


    private 

    def product_params 
        params.require(:product).permit(:description, :inventory, :name, :price)
    end

end

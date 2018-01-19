class ProductsController < ApplicationController

    def index
        @products = Product.all
        #binding.pry
    end 
    
    def inventory
        set_product 

        render plain: @product.inventory > 0 ? true : false
    end 
    
    def description 
        set_product
        render plain: @product.description 
    end 
    
    def create
        @product = Product.create(product_params)
        #binding.pry
        redirect_to products_path
    end 

    private 
    
    def set_product
        @product = Product.find(params[:id])
    end 
    
    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end 

end

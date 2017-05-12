class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def description
        @product = Product.find(params[:id])
        render plain: @product.description # From Rails Guides -> "You can send plain text - with no markup at all - back to the browser by using the :plain option to render:"
    end
        
    def inventory
        @product = Product.find(params[:id])
        render plain: @product.inventory > 0 ? true : false
    end 

    def new
        @product = Product.new 
    end 

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path
        end   
    end

  private

    def product_params
        params.require(:product).permit(:name, :inventory, :description, :price)
    end
end

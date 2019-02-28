class ProductsController < ApplicationController

    def index
       @products = Product.all
    end


    def new
      @product = Product.new
    end


    def create
     @product = Product.create(product_params)
     @product.save
     redirect_to products_path
    end

 
    def inventory
        # binding.pry
        @product = Product.find(params[:id])
     
        render plain: @product.inventory > 0 ?  true : false
        
    end

    def description
        #  you can render to the browser for the controller.
        @product = Product.find(params[:id])
        render plain: @product.description
    end

    private

    def product_params
        params.require(:product).permit(:name, :inventory, :description, :price)
    end

end

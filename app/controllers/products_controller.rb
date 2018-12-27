class ProductsController < ApplicationController

    def inventory
        
    end

    def description
    end
    
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        redirect_to products_path
    end
    
    private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end 
end

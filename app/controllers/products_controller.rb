class ProductsController < ApplicationController

    def index
        raise 
        @products = Product.all
    end

    def show 
        @products = Product.find_by(id: params[:id])    
    end

    def new
        @product = Product.new 
    end

    def create
        @product = Product.create(product_params)
        @product.save
        redirect_to product_path(@product)
    end

    def product_params
        params.require(:product).permit(:name, :price)
      end
end

class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def new 
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to '/products'
        else
            render 'products/new'
        end
    end

    def description
        @product = Product.find(params[:id])
        render plain: @product.description
    end

    def inventory
        product = Product.find(params[:id])
        product.inventory > 0 ? res = true : res = false
        
        render plain: res
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :inventory, :price)
    end
end

class ProductsController < ApplicationController

    def new
        @product=Product.new
    end

    def index
        @products = Product.all
    end

    def show
    end

    def create
        @product=Product.create(product_params)
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def inventory
        find_product
        render plain: @product.inventory > 0 ? true : false
    end
    
    def description
        find_product
        render plain: @product.description
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

    def find_product
        @product=Product.find(params[:id])
    end
end

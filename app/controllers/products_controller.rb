class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def body
        products = Product.find(params[:id])
        render plain: product.description
    end

    def create
        @product = Product.create(product_params)
        edirect_to @product
       
    end

    private

    def product_params
        params.require(:product).permit(:name, :description)
    end
end

class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        product = Product.create(product_params)

        redirect_to products_path
    end

    def inventory
        response = "false"
        product = Product.find(params[:id])
        response = "true" if product.inventory > 0
        render plain: response
    end

    def description
        product = Product.find(params[:id])
        render plain: product.description
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)

    end
end

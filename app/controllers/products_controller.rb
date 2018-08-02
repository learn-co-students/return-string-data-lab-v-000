class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(post_params)
        @product.save
        redirect_to products_path
    end

    def description
        @product = Product.find(params[:id])
        render plain: @product.description
    end

    def inventory
        @product = Product.find(params[:id])
        @available = @product.inventory > 0
        render plain: @available
    end

    private

    def post_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

end

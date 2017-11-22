class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        Product.create(product_params)
        redirect_to products_path
    end

    def description
        product = Product.find_by_id(params[:id])
        render plain: product.description
    end

    def inventory
        result = "false"
        product = Product.find_by_id(params[:id])
        result = "true" if !product.inventory.nil? && product.inventory > 0  
        render plain: result
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :inventory)
    end
end


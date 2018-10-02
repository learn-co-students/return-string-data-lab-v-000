class ProductsController < ApplicationController
    before_action :load_product, only: [:description, :inventory]

    def description
        render plain: @product.description
    end

    def inventory
        render plain: @product.inventory > 0 ? "true" : "false"
    end

    def index
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)

        if @product.save
            redirect_to products_path
        else
            render 'new'
        end
    end

private
    def load_product
        @product = Product.find_by(id: params[:id])
        if !@product
            redirect_to products_path
        end
    end

    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end
end

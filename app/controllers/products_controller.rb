class ProductsController < ApplicationController
    before_action :product_setter, only: [:show, :description, :inventory]

    def description
        render plain: @product.description
    end

    def inventory
        render plain: @product.inventory
    end

    def index
        @products = Product.all
    end

    def create
        new_product = Product.create(product_params)
        if new_product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def new
        @product = Product.new
    end

    def show
    end

    private

    def product_setter
       @product = Product.find(params[:id]) 
    end

    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end

end

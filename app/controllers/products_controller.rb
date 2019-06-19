class ProductsController < ApplicationController
    before_action :set_product, only: [:inventory, :description]

    def index
        @products = Product.all
    end

    def create 
        @product = Product.new(product_params)
        if @product.save 
         redirect_to products_path(@path)
        end
    end

    def description 
        product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory 
        product = Product.find(params[:id])
        if product.inventory > 0
            render text: "true"
        else
            render text: "false"
        end
    end


    private 

    def product_params 
        params.require(:product).permit(:description, :inventory, :name, :price)
    end

    def set_product
        @product = Product.find(params[:id])
    end

end

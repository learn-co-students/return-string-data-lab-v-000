class ProductsController < ApplicationController

    def create 
        @product = Product.new(product_params)
        @product.save

        redirect_to products_path
    end

    def inventory 
        @product = Product.find_by(id: params[:id])

        if @product.inventory > 0
            render plain: "true"
        else
            render plain: "false"
        end
    end

    def description 
        @product = Product.find_by(id: params[:id])
 
        render plain: "#{@product.description}"
    end

    def index 
        @products = Product.all
    end 

    private 

    def product_params 
        params.require(:product).permit(:name, :price)
    end

end

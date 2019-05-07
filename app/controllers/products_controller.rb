class ProductsController < ApplicationController

    def create 
        @product = Product.create(product_params)
        @product.save 
        redirect_to products_path
    end

    def new 
        @product = Product.new
    end

    def index 
        @products = Product.all
    end

    def description 
        product = Produc.find(params[:id])
        render plain: post.description
    end


    private 

    def product_params 
        params.require(:product).permit(:description, :inventory, :name, :price)
    end

end

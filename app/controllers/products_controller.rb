class ProductsController < ApplicationController

    def index
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.new(name: params[:name], description: params[:description])
        if @product.save
            redirect_to products_path
        else
            render :new 
        end
    end
    def inventory
        product = Product.find_by(id: params[:id])
        render plain: (product.inventory > 0)
    end
    def description
        product = Product.find_by(id: params[:id])
        render plain: product.description
    end
end

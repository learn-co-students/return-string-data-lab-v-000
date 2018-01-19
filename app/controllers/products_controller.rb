class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update] 
    
    def index 
        @products = Product.all 
    end 

    def show 
    end

    def new
        @product = Product.new
    end
    
     def create
        @product = Product.create(product_params)
        @product.save
        redirect_to products_path
    end
     
    def edit
    end 

    def update 
        @product.update(product_params)
        redirect_to products_path
    end 

    def description 
        product = Product.find(params[:id])
        render plain: product.description 
    end

    def body 
        product = Product.find(params[:id])
        if product.inventory >= 1
           @stock = "Available"
        else
            @stock = "Sold Out"
        end
        render plain: product.description + " " + @stock 
     end

    def inventory 
        product = Product.find(params[:id])
        if product.inventory >= 1
            render plain: "true"
        else
            render plain: "false"
        end
    end 
 
private
    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
    end

    def set_product 
        @product = Product.find(params[:id])
    end

end

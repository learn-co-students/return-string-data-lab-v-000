class ProductsController < ApplicationController
    
    def new
        @product = Product.new 
    end
    
    def index 
        @products = Product.all
    end
    
    def description 
        product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory 
        product = Product.find(params[:id]) 

        @inventory = !!product.inventory 

        render 'inventory', :layout => false
    end
end

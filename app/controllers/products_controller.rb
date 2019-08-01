class ProductsController < ApplicationController
    
    def new
        @product = Product.new 
    end

    def create 
        @product = Product.new(product_params)
        @product.save
        redirect_to products_path
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
        
        if product.inventory > 0
            product.available = "true"
        else
            product.available = "false"
        end

        render plain: product.available

    end

    private 
    def product_params
        params.require(:product).permit(:name, :description, :inventory)
      end

end

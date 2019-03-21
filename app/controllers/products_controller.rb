class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.create(product_params)
        redirect_to products_path
    end
    
    def inventory
        product = set_product      
        render plain: product.inventory.to_i!=0
    end
    
    def description
        product = set_product
        render plain: product.description
    end

    private
    def set_product
        Product.find(params[:id])
    end
    def product_params
        params.require(:product).permit(:name, :price, :description, :inventory)
      end
end

class ProductsController < ApplicationController

    def index
     @products = Product.all
    end

    def show
        @products = Product.find_or_create_by(params[:id])
    end

    def inventory
        product = Product.find(params[:id])
        render plain: product.inventory > 0 ? true : false
    end

    def description
        product = Product.find(params[:id])
        render plain: product.description
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.create(product_params)
        @product.save
        redirect_to products_path
    end

      def product_params
        params.require(:product).permit(:name, :description, :inventory)
      end
    
end

class ProductsController < ApplicationController

    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.create(product_params)
      @product.save
      redirect_to products_path
    end
  
    def description
      product = Product.find(params[:id])
      render plain: product.description
    end
  
    def inventory
      render inline: "<%= Product.find(params[:id]).inventory >= 1 ? 'true' : 'false' %>"
    end
  
  private
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
  end

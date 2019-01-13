class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]
  
    #2) set up action for getting body of product as an API endpoint
    def description  
      product = Product.find(params[:id])
      #render plain makes sure that plain text is rendered
      render plain: product.description
    end 
  
    def index
      @products = Product.all
    end
  #6 set up actions for determining whether inventory is greater than 0 
    def inventory 
        product = Product.find(params[:id])
        product.inventory > 0 ? true : false 
        render plain: product.inventory > 0 ? true : false
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
      redirect_to product_path(@product)
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :inventory, :price)
    end
  end
  
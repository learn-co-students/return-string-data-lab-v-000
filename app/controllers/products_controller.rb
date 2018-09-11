class ProductsController < ApplicationController
  def index
    @products = Product.all 
  end
  
  def new
    @product = Product.new
  end
  
  def create

    @product = Product.new(product_params)
    @product.save
    
    redirect_to products_path
  end
  
  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end
  
  def inventory
    @product = Product.find(params[:id])
    @answer = ""
    if @product.inventory != 0
      @answer = "true"
    else 
      @answer = "false"
    end
    render plain: @answer
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    Product.create(product_params)
    redirect_to products_url
  end
  
  def description
    product = Product.find(params[:id])
    render plain: product.description
  end
  
  def inventory
    #binding.pry
    product = Product.find(params[:id])
    render plain: !product.inventory.nil? && product.inventory > 0
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description)
  end

end

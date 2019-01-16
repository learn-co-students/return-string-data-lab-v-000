class ProductsController < ApplicationController
  
  def index
    @products = Product.all
    # byebug
  end
  
  def description
    get_product
    render plain: @product.description
  end
  
  def inventory
    get_product
    render plain: @product.inventory > 0 ? 'true' : 'false'
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(name: params[:product][:name], description: params[:product][:description], inventory: params[:product][:inventory])
    redirect_to '/products'
  end

  private
  
  def get_product
    @product = Product.find(params[:id])
  end
end

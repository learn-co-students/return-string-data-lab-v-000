class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def new 
    @product = Product.create
  end
  
  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

end

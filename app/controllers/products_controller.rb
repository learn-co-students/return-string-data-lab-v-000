class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def new 
    @product = Product.create
  end

end

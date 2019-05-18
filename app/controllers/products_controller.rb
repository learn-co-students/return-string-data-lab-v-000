class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product=Product.create(name: params[:name], description: params[:description], inventory: params[:inventory])
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
     render plain: product.inventory > 0 ? true : false
  end

end

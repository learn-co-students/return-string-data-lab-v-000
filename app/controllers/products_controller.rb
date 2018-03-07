class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:id])
    @product.save
    redirect_to products_path
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

end

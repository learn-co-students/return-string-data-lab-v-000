class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(name: params[:product][:name], description: params[:product][:description], price: params[:product][:price], inventory: params[:product][:inventory])
    redirect_to products_path
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    render plain: @product.inventory > 0 ? true : false
  end
end

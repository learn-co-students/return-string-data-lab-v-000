class ProductsController < ApplicationController
require 'pry'
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])

    render plain: product.inventory > 0 ? "true":"false"
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

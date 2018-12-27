require 'pry'
class ProductsController < ApplicationController
  def index
    @products = Product.all
    #binding.pry
  end

  def create
    #binding.pry
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def show

  end

  def inventory
    #binding.pry
    answer = Product.find(params[:id]).inventory > 0 ? true:false
    render plain: answer
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

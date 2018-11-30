require 'pry'
class ProductsController < ApplicationController

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
   Product.create(post_params)
    redirect_to products_path
  end

private
  def post_params
    params.require(:product).permit(
      :description,
      :inventory,
      :name,
      :price
    )
  end



end

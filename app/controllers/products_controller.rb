require 'pry'
class ProductsController < ApplicationController

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    #binding.pry
    @product = Product.create(product_params)
    redirect_to(products_path)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end

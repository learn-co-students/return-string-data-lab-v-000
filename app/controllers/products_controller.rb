class ProductsController < ApplicationController
  include ProductHelper

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if Product.create(product_params)
      redirect_to products_path
    else
      render 'new'
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: in_stock?(product)
  end

  def availability
    product = Product.find(params[:id])
    render plain: product.availability
  end 

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

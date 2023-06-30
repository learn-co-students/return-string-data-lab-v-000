class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    product = Product.new
    if product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory >= 1
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

end

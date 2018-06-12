class ProductsController < ApplicationController

  def new
    #
  end

  def create
    @product = Product.new
    if @product.save
      redirect_to products_path
    else
      render new_product_path
    end
  end

  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: !!(product.inventory > 0)
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end
end

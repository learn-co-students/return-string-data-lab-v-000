class ProductsController < ApplicationController

  def inventory
    product = Product.find(params[:id])
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  private
  def product_params
    parmas.require(:product).permit(:name, :price, :inventory, :description)
  end
end

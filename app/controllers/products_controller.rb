class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(params.require(:product).permit(:name, :description, :inventory))
    redirect_to products_path
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    render plain: (@product.inventory > 0).inspect
  end

end

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    redirect_to products_path
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def description
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find_by(id: params[:id])
    render plain: product.available?
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :inventory)
  end
end

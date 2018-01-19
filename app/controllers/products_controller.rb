class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    render plain: @product.inventory > 0
  end
  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(products_params)
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      inv = true
    else
      inv = false
    end
    render plain: inv
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private

  def products_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

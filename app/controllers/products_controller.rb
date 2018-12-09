class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    product = Product.find_by(id: params[:id])
    if product.inventory > 0
      inv = true
    else
      inv = false
    end

    render plain: inv
  end

  def description
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory )
  end
end

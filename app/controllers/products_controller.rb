class ProductsController < ApplicationController

  def create
    Product.create(product_params)
    # binding.pry
    redirect_to products_path
  end

  def inventory
    product = Product.find_by_id(params[:id])
    if product.inventory > 0
      render plain: true
    else
      render plain: false
    end

  end

  def description
    product = Product.find_by_id(params[:id])
    render plain: product.description
    # binding.pry
  end

  def index
    @products = Product.all
  end

  private
  def product_params
    params.require(:product).permit(:name, :inventory, :price, :description)
  end
end

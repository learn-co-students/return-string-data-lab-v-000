class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inv_available_tf
  end

  def create
    product = Product.create(product_params)
    redirect_to '/products'
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

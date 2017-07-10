class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    Product.create(post_params)
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory ? product.inventory > 0 : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private
  def post_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

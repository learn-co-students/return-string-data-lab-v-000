class ProductsController < ApplicationController
  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    redirect_to products_url
  end

  def inventory
    product = Product.find(params[:id])
    render plain: (product.inventory > 1)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def new
    @product = Product.new
  end

  def inventory
    product = Product.find_by_id(params[:id])
    render plain: product.has_inventory?
  end

  def description
    product = Product.find_by_id(params[:id])
    render plain: product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end

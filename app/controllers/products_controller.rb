class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :inventory]
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
    render plain: @product.description
  end

  def inventory
    render plain:  @product.inventory.to_i > 0 ? true : false
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

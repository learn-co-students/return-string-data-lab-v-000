class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :description]

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

  end

  def inventory
    render plain: !@product.inventory.nil? && @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end

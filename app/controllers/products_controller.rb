class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end


  def show
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

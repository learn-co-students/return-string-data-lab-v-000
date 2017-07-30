class ProductsController < ApplicationController
  before_action :instantiate_product, only: [:create, :new]

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    render plain: @description = Product.find(params[:id]).description
  end

  def inventory
    @inventory = Product.find(params[:id]).inventory
    render plain: (@inventory != nil && @inventory > 0)
  end

  private

  def instantiate_product
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:price, :name, :inventory, :description)
  end

end

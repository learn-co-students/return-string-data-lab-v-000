class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :inventory]

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end

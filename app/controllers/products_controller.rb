class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to product_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: (product.inventory.to_i > 0)
  end


private

  def product_params
    params.require(:product).permit(:name, :inventory, :description)
  end
end
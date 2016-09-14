class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :description, :inventory]

  def index
    @products = Product.all
  end

  def show
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory >= 1 ? true : false
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory]

  def index
    @products = Product.all
  end

  def show
  end

  def inventory
    render plain: @product.inventory > 0 ? "true" : "false"
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def description
    render plain: @product.description

  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end

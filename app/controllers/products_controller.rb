class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory]

  def index
    @products = Product.all
  end

  def show
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

  def inventory
    avail = @product.inventory > 0 ? "true" : "false"
    render plain: avail
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

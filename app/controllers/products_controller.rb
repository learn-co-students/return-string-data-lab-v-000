class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :inventory]
  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def description
    render plain: @product.description
  end

  def inventory
    if @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end

end

class ProductsController < ApplicationController

  before_action :get_product, only: [:inventory, :description]

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    if @product.inventory && @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
  end

  def description
    render plain: @product.description
  end

  def index
    @products = Product.all
  end

private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def get_product
    @product = Product.find_by(id: params[:id])
  end
end

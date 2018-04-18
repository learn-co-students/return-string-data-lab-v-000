class ProductsController < ApplicationController
  before_action :show_product, only: [:show, :description, :inventory]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'products/new'
    end
  end

  def show
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory.to_i > 0 ? true : false
  end

  private

  def show_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end

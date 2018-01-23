class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :description, :inventory, :edit]
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

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

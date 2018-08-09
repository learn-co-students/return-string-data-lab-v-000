class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :inventory, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  private

   def set_product
     @product = Product.find(params[:id])
   end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

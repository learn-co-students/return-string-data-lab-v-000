class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    self.inventory > 0 ? "true" : "false"
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

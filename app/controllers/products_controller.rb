class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_url
  end

  def inventory
    inventory = Product.find_by_id(params[:id]).inventory
    render plain: inventory > 0 ? "true" : "false"
  end

  def description
    render plain: Product.find_by_id(params[:id]).description
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

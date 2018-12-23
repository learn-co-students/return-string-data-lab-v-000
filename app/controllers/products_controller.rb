class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index
    @products = Products.all
  end

  def create
    @product = Product.new(product_params)
    @product.save

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

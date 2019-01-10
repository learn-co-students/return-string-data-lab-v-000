class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if @product = Product.create(product_params)
      raise @product.inspect
    else
      render "form"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory_count, :description)
  end
end

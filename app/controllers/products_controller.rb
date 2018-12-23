class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(products_params)
    @product.save
  end

  private
  def products_params
     params.require(:project).permit(:name, :price, :description, :inventory)
  end
end

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def body
    @product = find_product

    render layout:false
  end

  private

  def find_product
    Product.find_by(id: params[:id])
  end
end

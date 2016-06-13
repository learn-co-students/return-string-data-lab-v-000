class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def index
    @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end
end

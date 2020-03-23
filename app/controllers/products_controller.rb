class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

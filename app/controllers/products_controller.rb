class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def inventory
    set_product
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    set_product
    render plain: @product.description
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

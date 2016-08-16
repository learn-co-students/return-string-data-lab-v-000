class ProductsController < ApplicationController

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(products_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory == 0
      render plain: false
    else
      render plain: true
    end
  end

  def index
    @products = Product.all
  end

  private

  def products_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product && product.available?
      render plain: true
    else
      render plain: false
    end
  end

  private
#this is the whitelist or what is allowed

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

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
    #solution:
    #render plain: product.inventory > 0 ? true : false
    if product.inventory == 0
      value = false
    else
      value = true
    end
    render plain: value
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end #end ProductsController

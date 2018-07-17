class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if !!product.inventory
      p = product.inventory > 0 ? true : false 
    else 
      p = false
    end
    render plain: p
  end

  private 

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end

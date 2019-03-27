class ProductsController < ApplicationController
  def index
    @products = Product.all
  end 

  def new 
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def description
    findProductById
    # product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    findProductById
    # product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

  def findProductById
    product = Product.find_by(:id)
  end
end

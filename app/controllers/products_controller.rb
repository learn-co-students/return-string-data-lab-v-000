class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end


  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path

  end

  private

  def product_params
    params.require(:product).permit(:description, :price, :name, :inventory)
  end

end

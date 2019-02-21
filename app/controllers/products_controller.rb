class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to root_path
    end
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true:false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end




private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

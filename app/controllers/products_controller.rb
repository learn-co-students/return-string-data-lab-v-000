class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
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
    has_inventory = if product.inventory > 0
      "true"
    else
      "false"
    end
    render plain: has_inventory
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end

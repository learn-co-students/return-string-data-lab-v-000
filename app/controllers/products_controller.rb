class ProductsController < ApplicationController

  def index 
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params(:name, :description, :price))
    @product.save
    redirect_to products_path
  end

  def inventory
    product = Product.find(params[:id])
    stocked = true
    stocked = false if product.inventory.to_i < 1
    render plain: stocked
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private

  def product_params(*args)
    params.require(:product).permit(*args)
  end


end

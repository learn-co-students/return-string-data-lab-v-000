class ProductsController < ApplicationController
  def new
    @product = Product.new
    render new_product_path
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price])
    @product.save
    redirect_to products_path
  end

  def inventory
    result = Product.find_by(id: params[:id]).inventory > 0 ? true : false
    render plain: result
    # binding.pry
  end

  def description
    result = Product.find_by(id: params[:id]).description
    render plain: result
  end

  def edit
  end

  def update
  end

  def index
    @products = Product.all
  end

  def destroy
  end
end

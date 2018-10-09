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

  def edit
  end

  def update
  end

  def destroy
  end
end

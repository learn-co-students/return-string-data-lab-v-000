class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.availablility == "Available"
      render plain: true
    else
      render plain: false
    end
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end 

end

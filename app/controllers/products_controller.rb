class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    product = Product.find(params[:id])
    if product.description
      render plain: product.description
    else
      render plain: ''
    end
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory
      render plain: product.inventory > 0
    else
      render plain: ''
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end

end

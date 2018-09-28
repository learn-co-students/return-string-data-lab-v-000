class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def body
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory > 0
      @inventory = "Available"
    else
      @inventory = "Sold Out"
    end
    render plain: @inventory
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end

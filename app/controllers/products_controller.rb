class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'products/new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def inventory
    #binding.pry
    @product = Product.find(params[:id])
    if @product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  def description
    @product = Product.find(params[:id])
    render plain: "#{@product.description}"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

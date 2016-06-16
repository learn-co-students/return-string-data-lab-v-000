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
      render 'new'
    end
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory.to_i > 0
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def description
    @product = Product.find(params[:id])
    if @product.description.length > 0
      render plain: @product.description
    else
      render plain: 'false'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
    end
end

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
    # render layout: false
  end

  def inventory
    if Product.find_by(id: params[:id]).inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end
end

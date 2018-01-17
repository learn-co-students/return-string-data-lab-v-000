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
      redirect_to products_url
    else
      render :new
    end
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    if @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

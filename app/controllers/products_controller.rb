class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    if @product.inventory==0
      render plain: "false"
    else
      render plain: "true"
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end

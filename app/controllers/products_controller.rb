class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path

  end

  def inventory
    @product = Product.find(params[:id])
    # binding.pry
     if @product.inventory == 0 || @product.inventory == nil
      render plain: 'false'
     else
      render plain: 'true'
     end
    # render plain: @product.inventory
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

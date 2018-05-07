class ProductsController < ApplicationController
  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to products_path
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :description, :inventory, :price, :created_at, :updated_at)
  end
end

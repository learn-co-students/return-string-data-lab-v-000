class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def inventory
    product = Product.find_by(id: params[:id])
    @availability = product.inventory > 0

    render plain: @availability
  end

  def description
    product = Product.find_by(id: params[:id])

    render plain: product.description
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render new
    end
  end

  def show
    @product = Product.find_by(id: params[:id])

  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :inventory)
    end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to products_path
    else
      render new
    end
  end

  def desc
    product = Product.find(params[:id])
    render plain: product.description
  end

  def available?
    product = Product.find(params[:id])
    available = product.inventory > 0
    render plain: available
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end

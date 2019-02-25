class ProductsController < ApplicationController
  before_action :product, only: [:show, :description, :inventory]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    render plain: product.description
  end

  def inventory
    render plain: product.inventory > 0 ? true : false
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

  def product
    @product = Product.find(params[:id])
  end
end

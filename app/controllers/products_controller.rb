class ProductsController < ApplicationController
  before_action :set_products
  before_action :set_product, only: [:description, :inventory]
  def index

  end

  # def show
  # end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    render plain: @product.description
  end

  def inventory
    if @product.inventory > 0
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  private

  def set_products
    @products = Product.all
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end

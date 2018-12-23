class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :inventory, :show]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private

    def set_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
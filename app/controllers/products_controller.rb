class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :inventory, :description]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def show
  end

  def inventory
    if @product.inventory and @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
  end

  def description
    render plain: @product.description
  end

  private
    def get_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
    end
end

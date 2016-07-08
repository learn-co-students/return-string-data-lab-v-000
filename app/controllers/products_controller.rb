class ProductsController < ApplicationController
  before_action :find_products, only: [:inventory, :description]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :inventory)
    end

    def find_products
      @product = Product.find(params[:id])
    end

end
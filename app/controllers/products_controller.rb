class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :description]
  def index
    @products = Product.all
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render new_product_path
    end
  end

  def new
    @product = Product.new
  end

  def inventory
    if @product.name == 'No Inventory'
      render plain: 'false'
    else
      render plain: 'true'
    end
  end

  def description
    render plain: @product.description
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end

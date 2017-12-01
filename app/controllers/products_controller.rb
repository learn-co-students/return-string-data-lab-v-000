class ProductsController < ApplicationController
  before_action :set_product, only: %i[show description inventory]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)

    if product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
  end

  def description
    render plain: @product.description
  end

  def inventory
    render plain: @product.has_inventory?
  end

  private

  def product_params
    params.require(:product).permit(:name, :inventory, :description, :price)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end

end

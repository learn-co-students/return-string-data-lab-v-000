class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy, :update, :available, :description, :inventory]

  def description
    render plain: @product.description_display
  end

  def inventory
    if @product.check_inventory >= 1
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def available
    if @product.inventory >= 1
      render plain: "Available"
    else
      render plain: "Sold Out"
    end
  end

  def index
    @products = Product.all
    render 'products/index.html'
  end

  def show
  end

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

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_product
      @product = Product.find_by_id(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :inventory, :price)
    end
end

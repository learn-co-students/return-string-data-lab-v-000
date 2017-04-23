class ProductsController < ApplicationController
<<<<<<< HEAD
  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def show
    @product = Product.find_by_id(params[:id])
  end
  
  def description
    product = Product.find(params[:id])
    render plain: product.description
=======
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
>>>>>>> 443ac024a8933692eddc29e4fef18f0f5b8994da
  end

  def new
    @product = Product.new
  end

  def create
<<<<<<< HEAD
    Product.create(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
=======
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
>>>>>>> 443ac024a8933692eddc29e4fef18f0f5b8994da

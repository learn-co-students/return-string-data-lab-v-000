class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def inventory
    @product = Product.find_by_id(params[:id])
    if @product.inventory > 0
      render plain: true
    else
      render plain: false
    end
  end

  def description
    @product = Product.find_by_id(params[:id])
    @product_info = @product.description
    
    render plain: @product_info
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

  def show
    @product = Product.find_by_id(params[:id])
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end


end

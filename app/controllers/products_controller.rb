class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'product/new'
    end
  end

  #API ENDPOINTS
  def body
    @product = Product.find(params[:id])
    render plain: @product.description
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end

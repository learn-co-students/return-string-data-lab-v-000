class ProductsController < ApplicationController

  def new

  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      redirect_to products_path
    else
      render 'products/new'
    end 
  end 

  def show
    @product = Product.find_by_id(params[:id])
  end

  def index
    @products = Product.all 
  end 

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end 

  def inventory 
    @product = Product.find(params[:id])
    render plain: @product.inventory > 0 ? true : false 
  end 

  private

  def product_params
    params.require(:product).permit(:naame, :description, :inventory, :price)
  end 

end

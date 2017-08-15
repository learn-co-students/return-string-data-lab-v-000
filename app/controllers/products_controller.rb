class ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  
  def body
    product = Product.find(params[:id])
    if product.inventory == 0
      render plain: product.description + "Sold Out"
    else
      render plain: product.description + "Available"
    end
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def show
    # @product = Product.find(params[:id])
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end   
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end

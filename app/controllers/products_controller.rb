class ProductsController < ApplicationController
  before_action :set_product, :only => [:description, :inventory]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save then redirect_to products_path
    else render :new and return
    end
  end
  
  def description
    render :plain => @product.description
  end
  
  def inventory
    render :plain => !!( @product.inventory > 0 )
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
  
  def set_product
    @product = Product.find_by(:id => params[:id])
  end
end

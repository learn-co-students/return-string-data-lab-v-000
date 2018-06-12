class ProductsController < ApplicationController
  before_action :set_product, :only => [:description, :inventory]

def new
  @product = Product.new
end

def create
  @product = Product.new
  if @product.save then redirect_to products_path
  else render :new and return
  end
end


def index
  @products = Product.all
end


def inventory
  product = Product.find(params[:id])
  render :plain => !!(product.inventory > 0)
end

def description
  product = Product.find(params[:id])
  render :plain => product.description
end



private

def product_params
  params.require(:product).permit(:name, :description, :inventory, :price)
end

def set_product
  @product = Product.find_by(:id => params[:id])
end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def inventory
    bool = (set_product.inventory > 0).to_s
    render plain: bool
  end

private 

  def set_product
    @product = Product.find(params[:id]) 
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end



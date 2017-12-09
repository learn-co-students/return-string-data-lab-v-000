class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update] 
  
  def new
    @product = Product.new
  end


  def create
    @product = Product.create(product_params)
    if @product.save
    redirect_to products_path
    else
    render new
    end
  end

  def show
  
  end
  
  def index
   @products = Product.all
  end
  
  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def edit
    
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end


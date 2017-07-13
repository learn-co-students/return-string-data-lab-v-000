class ProductsController < ApplicationController
  before_action :show_product, only: [:show, :inventory, :description]
  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
  end

  def inventory
    render :plain => @product.inventory > 0? true : false
  end

  def description
    render :plain => @product.description
  end

  private
   def product_params
     params.required(:product).permit(:name, :description, :price, :inventory)
   end

   def show_product
     @product = Product.find(params[:id])
   end
end

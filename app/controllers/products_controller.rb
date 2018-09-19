class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update]

    def index
      @products = Product.all
    end

    def inventory
     product = Product.find(params[:id])
     if product.inventory === 0
       render plain: false
     else
       render plain: true
     end
    end

   def description
     @product = Product.find(params[:id])
     render plain: @product.description
   end

   def show
    set_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end



private
# Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end

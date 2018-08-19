class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :inventory_status, :description, :show, :edit, :update]

  def index
    @products = Product.all
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

  def inventory
    if @product.inventory == 0
      render plain: 'false'
    else
      render plain: 'true'
    end
  end

  def description
    #render plain text, not default template
    render plain: @product.description
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end

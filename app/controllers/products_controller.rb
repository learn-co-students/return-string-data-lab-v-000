class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :description]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save ? (redirect_to products_path) : (render "new")
  end

  def inventory
    @product.inventory > 0 ? (render plain: "true") : (render plain: "false")
  end

  def description
    render plain: @product.description
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
    end
end

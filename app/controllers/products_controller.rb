class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def inventory
    id = get_product_id
    product = Product.find(id)

    if product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  def description
    id = get_product_id
    product = Product.find(id)

    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)

    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def get_product_id
      params[:id] ? params[:id] : params[:product_id]
    end
end

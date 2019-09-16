class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def index
    @products = Product.all
  end

  def inventory
    product = Product.find_by(product_id_params)

    if !product.nil? && product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find_by(product_id_params)

    if !product.nil?
      render plain: product.description
    else
      render plain: "Item not found :("
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :inventory, :description)
    end

    def product_id_params
      params.permit(:id)
    end
end

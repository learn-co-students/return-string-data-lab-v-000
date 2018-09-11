class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory_count)
  end
end

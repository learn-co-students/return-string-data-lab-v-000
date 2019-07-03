class ProductsController < ApplicationController

  def create
    @product = Product.create(post_params)
    @product.save
    redirect_to '/products'
  end

  def inventory

  end

  def description

  end

  def body
  product = Product.find(params[:id])
  render plain: product.description
end

private

  def post_params
    params.require(:product).permit(:ordered_products, :orders, :inventory, :description)
  end

end

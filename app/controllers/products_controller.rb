class ProductsController < ApplicationController

def body

  product = Product.find(params[:id])
  render plain: product.description
end

def create
  @product = Product.create(product_params)
  @product.save
  redirect_to products_path
end


private

def product_params
  params.require(:product).permit(:name, :price, :inventory, :description)
end

end

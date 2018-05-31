class ProductsController < ApplicationController
before_action :set_product, only: [:description, :inventory]

def index
    @products = Product.all
  end

def new
	@product = Product.new()
end

def create
	@product = Product.new(params_product)
	@product.save
	redirect_to products_path
end

def description
	render plain: @product.description
end

def inventory
	render plain: @product.inventory > 0 ? "true" : "false"
end

private

 def set_product
    @product = Product.find(params[:id])
 end

def params_product
	params.require(:product).permit(:name, :description, :price, :inventory)
end

end

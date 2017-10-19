class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save

		redirect_to products_path
	end

	def inventory
		render plain: Product.find(params[:id]).inventory != 0 && !Product.find(params[:id]).inventory.nil? ? "true" : "false"
	end

	def description
		render plain: Product.find(params[:id]).description
	end

private
	
	def product_params
		params.require(:product).permit(:name, :price, :inventory, :description)
	end

end

class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		Product.create(product_params)
		redirect_to products_path
	end

	def description
		description = Product.find(params[:id])
		render plain: description.description
	end

	def inventory
		inventory = Product.find(params[:id]).inventory > 0 ? true : false
		render plain: inventory
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :inventory, :description)
	end
end

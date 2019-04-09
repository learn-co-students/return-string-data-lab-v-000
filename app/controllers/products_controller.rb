class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :inventory, :description]

	def description
		render plain: @product.description
	end

	def inventory
		if (@product.inventory.nil?)
			render plain: false
		else
			render plain: @product.inventory > 0 ? true : false
		end
	end

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

private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :inventory, :price)
	end
end

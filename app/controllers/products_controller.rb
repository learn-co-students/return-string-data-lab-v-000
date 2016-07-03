class ProductsController < ApplicationController
	before_action :find_product, only: [:description, :inventory]

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		if @product = Product.create(product_params)
			redirect_to products_path
		else
			render :new
		end
	end

	def description
		render plain: @product.description
	end

	def inventory
		render plain: (@product.inventory > 0).to_s
	end

	def find_product
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :description, :inventory)
	end
end

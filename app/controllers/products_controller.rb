class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update]

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)
		@product.save
		redirect_to products_path
	end

	def update
		@product.update(product_params)
		redirect_to products_path(@product)
	end

	def inventory
		@product = Product.find(params[:id])
		render plain: @product.inventory > 0 ? true : false
	end

	def description
		@product = Product.find(params[:id])
		render plain: @product.description
	end

	def has_inventory?
		@product.inventory > 0 ? true : false
	end





	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :price, :description, :inventory)
	end


end

class ProductsController < ApplicationController
	before_action :set_product, except: [:create, :index]

	def index
		@products = Product.all
	end

	def new
	end

	def create
		# {"product"=>{
				# "name"=>"Test",
				 # "price"=>"3.99",
				 #  "inventory"=>"12",
				 #   "description"=>"This is a great thing"},
				 #    "controller"=>"products", 
				 #    "action"=>"create"}
		product = Product.new(product_params)
		if product.save
			redirect_to products_path
		else
			redirect_to new_product_path
		end
	end

	def inventory
		# puts params
		if @product.inventory > 0
			render plain: "true"
		else
			render plain: "false"
		end
	end

	def description
		render plain: @product.description
	end

	private

		def product_params
			params.require(:product).permit(:name, :price, :inventory, :description)
		end

		def set_product
			@product = Product.find(params[:id])
		end
end

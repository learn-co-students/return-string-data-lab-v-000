class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path, notice: "Product successfully created"
		else
			render :new
		end	
	end

	def description
		product = Product.find_by(id: params[:id])
		render plain: product.description
	end

	def availability
		product = Product.find_by(id: params[:id])
		product.inventory > 0 ? availability = "true" : availability = "false"
		render plain: availability
	end

	private

		def product_params
			params.require(:product).permit(:name, :price, :description, :inventory)
		end

    # t.string   "name"
    # t.integer  "price"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
    # t.text     "description"
    # t.integer  "inventory"
end

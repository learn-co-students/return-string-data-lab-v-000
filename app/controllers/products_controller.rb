class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new 
		@product = Product.new 
	end

	def create
		@product = Product.create(product_params)
        @product.save
        redirect_to products_path 
	end

	def inventory
		 @product = Product.find(params[:id])
		if @product.inventory == nil || @product.inventory == 0
		  	render plain: false
		 else render plain: true 
		 end
    end

    def description
    	product = Product.find(params[:id])
    	if product.description != nil 
        	render plain: product.description
        else
        	render plain: "Not Available"
        end
    end
		
	def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end

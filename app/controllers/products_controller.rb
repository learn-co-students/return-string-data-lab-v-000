class ProductsController < ApplicationController
	before_action :set_product, only: [:body, :description, :inventory]

	def index
	   	@products = Product.all
	end

  	def new
    	@product = Product.new
  	end

  	def create
	    @product = Product.create(product_params)
	    @product.save
	    redirect_to(products_path)
  	end

  	def description
  		render plain: @product.description
  	end

  	def inventory
  		@inventory = "true"
  		@inventory = "false" if @product.inventory < 1
  		
  		render plain: @inventory
  	end

  	def body
	    @inventory_status = "Sold Out"
	    if @product.inventory != nil && @product.inventory > 0
	    	@inventory_status = "Available"
	    end
	    render plain: "#{@inventory_status} : #{@product.description}"
	end

  	private

	  # Use callbacks to share common setup or constraints between actions.
	  def set_product  	
	    @product = Product.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def product_params
	    params.require(:product).permit(:name, :price, :description, :inventory)
	  end
	  
end

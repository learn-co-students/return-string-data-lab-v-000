class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end
    
    def create
        product = Product.create(product_params)
        if product.save
            redirect_to products_path
        else
            @product = product
            render :new
        end
    end

    def description
        product = Product.find(params[:id])
        render plain: product.description
    end
    
    def inventory
        product = Product.find(params[:id])
        # puts "product.inventory = #{product.inventory}"
        availability = "false"
        if product.inventory > 0
            availability = "true"
        end
        render plain: availability
    end
    
    private
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def product_params
        params.require(:product).permit(:name, :description, :inventory, :price)
      end

end

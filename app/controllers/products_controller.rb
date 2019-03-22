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

def description
      product = Product.find(params[:id])
      render plain: product.description
    end

    def inventory
      product = Product.find(params[:id])
      @test = false
      if product.inventory > 0
      @test = true
      end
      render plain: @test
    end

private 
def product_params
    params.require(:product).permit(:name, :description, :inventory)
  end
end

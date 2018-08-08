class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      @error = ["Sorry, something failed in creating the product! Please try again."]

      redirect_to new_product_path
    end
  end

  def description
    @product = Product.find(params[:id])

    render plain: @product.description
  end


  def inventory
    @product = Product.find(params[:id])

    if @product.inventory >= 1
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def more_info
    @product = Product.find(params[:id])

    render :layout => false
  end

  private

  def product_params
    params.require('product').permit('name', 'price', 'inventory', 'description')
  end

end

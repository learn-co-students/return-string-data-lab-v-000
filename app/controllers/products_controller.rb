class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(name: params[:product][:name], description: params[:product][:description], inventory: params[:product][:inventory])
    redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory != nil && @product.inventory != 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    @product = Product.find(params[:id])
    render plain: "#{@product.description}"
  end

end

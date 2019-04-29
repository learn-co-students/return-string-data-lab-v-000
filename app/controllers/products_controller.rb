class ProductsController < ApplicationController


  def index
  end 


  def create
    @product = Product.create(description: params[:product][:description], inventory: params[:product][:inventory], name: params[:product][:name], price: params[:product][:price])
    redirect_to products_path
  end

  def inventory

    if Product.find(params[:id]).inventory != 0
      render plain: 'true'
    else
      render plain: 'false'
    end

  end

  def description
    render plain: Product.find(params[:id]).description
  end


end

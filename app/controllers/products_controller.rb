class ProductsController < ApplicationController
  def new
    #Render a form partial
    render partial: "form"
  end

  def index
    @products = Product.all
  end


  def inventory
    #locate the product by its id
    product = Product.find(params[:id])
    #if product inventory is greater than 0 then true if not then its false
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end


  def create
    #Set an instance variable to a new product using the product params
    @product = Product.create(product_params)
    #save the product into the database
    @product.save
    #redirect to the products index page
    redirect_to products_path
  end

  def show
  end

  private

  def product_params
    #params pulled from the form partial
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

end

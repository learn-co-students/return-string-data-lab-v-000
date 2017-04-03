class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def body
    
    # order = Order.find(params[:id])
    # render plain: order.invoice
  end

end
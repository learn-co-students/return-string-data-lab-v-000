class OrdersController < ApplicationController

  def index
    @orders = Order.all
    binding.pry
  end

end

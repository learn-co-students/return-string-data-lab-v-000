class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end
  
  def create
  end

end
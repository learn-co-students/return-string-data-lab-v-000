class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

private

  def invoice_params
    params.require(:invoice).permit(:name, :price)
  end
end
class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  #def name
  #  invoice = Invoice.find(params[:id])
  #  render plain: invoice.name.present? true : false
  #end

  #def price
  #  invoice = Invoice.find(params[:id])
  #  render plain: ivoice.price
  #end

private

  def invoice_params
    params.require(:invoice).permit(:name, :price)
  end
end
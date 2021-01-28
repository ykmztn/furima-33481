class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.includes(:item, :user)
  end



   
end

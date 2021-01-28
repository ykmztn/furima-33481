class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if current_user == @item.user
    @purchase_address = PurchaseAddress.new

  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
     if @purchase_address.valid?
      @purchase_address.save
       redirect_to action: :index
     else
       redirect_to item_purchases_path
     end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def purchase_params
  params.require(:purchase_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :purchase_id)
  end

end

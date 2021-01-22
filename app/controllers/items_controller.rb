class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :item_status_id, :shipping_cost_id, :ship_from_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
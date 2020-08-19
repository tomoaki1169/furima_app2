class PurchaseController < ApplicationController
  def index
  end

  def done
    @item_purchaser= Item.find(params[:id])
    @item_purchaser.update( purchaser_id: current_user.id)
  end
end

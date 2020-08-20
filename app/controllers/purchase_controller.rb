class PurchaseController < ApplicationController
  def index
  end

  def done
    @item = Item.find(params[:id])
    @item.update( purchase_id: current_user.id)
  end
end

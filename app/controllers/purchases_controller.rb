class PurchasesController < ApplicationController
  require "payjp"

  def purchase
    @item = Item.find(params[:item_id])
    @images = @item.images.all
    if user_signed_i
end

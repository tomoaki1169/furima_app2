class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def create
    item = Item.find(params[:item_id])
    favorite = Favorite.create(user_id: current_user.id, item_id: item.id)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = Favorite.find_by(user_id: current_user.id, item_id: item.id)
    favorite.destroy
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end

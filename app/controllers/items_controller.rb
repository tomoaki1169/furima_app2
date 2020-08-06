class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  
  def new
  end

  def created
  end

  def edit
  end

  def updata
  end

  def destroy
  end
end

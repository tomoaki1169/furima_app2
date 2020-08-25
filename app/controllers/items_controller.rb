class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  

  def new
    @item = Item.new
    @item.images.new
    # データベースから、親カテゴリーのみ抽出
    @parents = Category.where(ancestry:nil)
    
  end

  def  create
    @item = Item.new(item_params)
    @parents = Category.where(ancestry:nil)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
# 以下全て、formatはjsonのみ
# 親カテゴリーが選択された後に動くアクション
  def get_category_children
    # 選択された親カテゴリーに紐づく子カテゴリーの配列を所得
    @category_children = Category.find( params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    # 選択された子カテゴリーに紐付く孫カテゴリーの配列を所得
    @category_grandchildren = Category.find(params[:child_id]).children 
  end

  def search
    @items = Item.search(params[:keyword])
  end


  private

  def item_params

    params.require(:item).permit(:name, :price, :derivery_fee, :size,:status,:data,:introduction, :brands_name,:prefecture_id,:category_id,images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
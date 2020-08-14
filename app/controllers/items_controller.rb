class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = []
    # データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry:nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def  create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
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
    @category_children = Category.find_by(name: "#{params[:parent_name]},ancestry: nill").children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    # 選択された子カテゴリーに紐付く孫カテゴリーの配列を所得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :price, :derivery_fee, :size, :status, :data, :area, :introduction, :user, :brand_id, :category,images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

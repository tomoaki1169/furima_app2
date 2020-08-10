class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  enum sale_status:{
    "販売中":0,
    "売り切れ":1
  }
  enum category:{
    
  }
  enum status:{
    "新品、未使用": 0,
    "未使用に近い": 1,
    "目立った傷や汚れなし": 2,
    "やや傷や汚れあり": 3,
    "傷や汚れあり": 4,
    "全体的に状態が悪い": 5
    }
    
end

# @item.update(deal: "urikire")

# - if @item.sell == "urikire"

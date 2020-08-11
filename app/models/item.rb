class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  


  validates :name,presence: true,length: {maximum: 40}

  validates :price,numericality: { greater_than:300,less_than: 9999999,message:"販売中は300以上9,999,999以内で入力してください"}
  validates :introduction, presence: true,length:{maximum: 1000}



  enum sale_status:{
    "販売中":0,
    "売り切れ":1
  }

  enum size:{
    "XXS以下":0,
    "XS(SS)":1,
    "S":2,
    "M":3,
    "L":4,
    "XL(LL)":5,
    "2XL(3L)":6,
    "3XL(4L)":7,
    "4XL(5L)以上":8,
    "FREE SIZE":9
  }
  enum status:{
    "新品、未使用": 0,
    "未使用に近い": 1,
    "目立った傷や汚れなし": 2,
    "やや傷や汚れあり": 3,
    "傷や汚れあり": 4,
    "全体的に状態が悪い": 5
    }
    
    enum derivery_fee:{
      "送料込み(出品者負担)":0,
      "着払い(購入者負担)":1
    }

    enum data:{
      "1~2日で発送":0,
      "2~3日で発送":1,
      "4~7日で発送":2
    }

    enum category:{
      "レディース":0,
      "メンズ":1,
      "ベビー・キッズ":2,
      "インテリア・住まい・小物":3,
      "本・音楽・ゲーム":4,
      "おもちゃ・ホビー・グッズ":5,
      "コスメ・香水・美容":6,
      "家電・スマホ・カメラ":7,
      "スポーツ・レジャー":8,
      "ハンドメイド":9,
      "チケット":10,
      "自動車・オートバイ":11,
      "その他":12
    }


end


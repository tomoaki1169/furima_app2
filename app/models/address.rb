class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :address_family_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  }, presence: true

  validates :address_first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  }, presence: true
  
  validates :address_family_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }, presence: true
  
  validates :address_first_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true
  
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}, presence: true

  validates :prefecture, presence: true
  
  validates :municipality, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  }, presence: true

  validates :house_number, presence: true

end

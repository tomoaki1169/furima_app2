FactoryBot.define do
  factory :item do
    name {"baketu"}
    price {900}
    derivery_fee {0}
    size {0}
    data {0}
    introduction {"aaa"}
    status {0}
    category_id {1}
    prefecture_id {0}
    user_id {1}
    association :category
    association :user
  end
end

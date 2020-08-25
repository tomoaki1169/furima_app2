FactoryBot.define do
  factory :address do
    address_family_name                {"田中"}
    address_first_name                 {"太朗"}
    address_family_name_kana           {"タナカ"}  
    address_first_name_kana            {"タロウ"}        
    post_code                          {"112-1134"}
    prefecture_id                      {"1"}                    
    municipality                       {"福岡市"}
    house_number                       {"博多区112"}
    association :user
  end
end

FactoryBot.define do
  factory :product do
    productname { '商品' }
    explanation { '詳細' }
    category_id { '2' }
    state_id { '2' }
    delivery_fee_id { '2' }
    area_id { '2' }
    delivery_time_id { '2' }
    price { '300' }
    association :user
  end
end

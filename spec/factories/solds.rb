FactoryBot.define do
  factory :sold do
    postal_code { '111-1111' }
    area_id { 2 }
    municipaity { 'nagoyasinakamuraku' }
    address { 'namiki2-74' }
    tel { '000000000' }
    association :user
    association :product
    association :purchase_history
  end
end

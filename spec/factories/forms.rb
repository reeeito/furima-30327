FactoryBot.define do
  factory :form do
    postal_code { '111-1111' }
    area_id { 2 }
    municipaity { 'nagoyasinakamuraku' }
    address { 'namiki2-74' }
    tel { '00000000000' }
    user_id { 2 }
    product_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    building_name { 'リブリ・メゾンシャルム101'}
  end
end

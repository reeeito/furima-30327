FactoryBot.define do
  factory :form do
    postal_code { '111-1111' }
    area_id { 2 }
    municipaity { 'nagoyasinakamuraku' }
    address { 'namiki2-74' }
    building_name { 'リブリ'}
    tel { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

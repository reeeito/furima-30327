class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    #has_one :purchace_history
    with_options presence: true do
        validates :image
        validates :productname
        validates :explanation
        with_options numericality: { other_than: 1 } do
            validates :category_id
            validates :state_id
            validates :delivery_fee_id
            validates :area_id
            validates :delivery_time_id
        end       
        validates :price,numericality:{greater_than:300,less_than:9999999},format:{ with: /\A[0-9]+\z/ }
    end
end

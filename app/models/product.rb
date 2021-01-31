class Product < ApplicationRecord
    belongs_to :user
    #has_one :purchace_history
    with_options presence: true do
        validates :image
        validates :productname
        validates :explanation
        validates :category_id
        validates :state_id
        validates :delivery_fee_id
        validates :area_id
        validates :delivery_time_id
        validates :price,numerically:{greater_than:300,less_than:9999999},format:{ with: /\A[0-9]+\z/ }
    end
    validates
end

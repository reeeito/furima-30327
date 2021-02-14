class Sold < ApplicationRecord
    belongs_to :purchace_history

    with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :municipaity
    validates :address
    validates :tel
    validates :purchace_history
    end
end

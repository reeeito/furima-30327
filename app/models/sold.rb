class Sold < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :postal_code,:area_id,:municipaity,:address,:tel

    belongs_to :purchace_history

    with_options presence: true do
      validates :postal_code
      validates :area_id
      validates :municipaity
      validates :address
      validates :tel
      validates :purchace_history
    end

    def save
    end
end

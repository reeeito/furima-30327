class PurchaseHistory < ApplicationRecord
    belongs_to :product
    belongs_to :user
    has_one :sold


    
end

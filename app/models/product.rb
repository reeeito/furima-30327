class Product < ApplicationRecord
    belongs_to :user
    #has_one :purchace_history
end

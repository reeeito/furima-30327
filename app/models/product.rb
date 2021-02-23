class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :delivery_fee, optional: true
  belongs_to :state, optional: true
  belongs_to :category, optional: true
  belongs_to :delivery, optional: true
  belongs_to :area, optional: true
  belongs_to :delivery_time, optional: true
  has_one_attached :image
  has_one :purchase_history
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
    validates :price, numericality: { greater_than: 299, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
end

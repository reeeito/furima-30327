class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipaity, :address,:building_name, :tel, :user_id, :product_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipaity
    validates :address
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, product_id: product_id)
    Sold.create(postal_code: postal_code, area_id: area_id, municipaity: municipaity, address: address, building_name: building_name,tel: tel,
                purchase_history_id: purchase_history.id)
  end
end

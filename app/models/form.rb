class Form
    include ActiveModel::Model
    attr_accessor :postal_code,:area_id,:municipaity,:address,:tel,:user_id, :product_id

    with_options presence: true do
      validates :postal_code
      validates :area_id
      validates :municipaity
      validates :address
      validates :tel
      validates :user_id
      validates :product_id
    end

    def save
      purchase_history = PurchaseHistory.create(user_id: user_id,product_id: product_id)
      Sold.create(postal_code: postal_code,area_id: area_id,municipaity: municipaity,address: address,tel: tel,purchase_history_id: purchase_history.id)
    end

end
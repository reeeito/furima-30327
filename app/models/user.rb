class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
      validates :lastname
      validates :firstname
    end
    validates :birthday
    validates :nickname
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :lastname_kana
      validates :firstname_kana
    end
  end
  validates :password,format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  has_many :products
  has_many :purchase_histries
end

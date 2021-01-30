class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /^[ぁ-んァ-ン一-龥]/ } do
      validates:lastname
      validates:firstname
    end
    validates:birthday
    validates:nickname
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates:lastname_kana
      validates:firstname_kana
    end
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/}
  end
  
  # has_many :products
  # has_many :purchase_histries
end

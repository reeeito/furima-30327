class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :lastname
    validates :firstname
    validates :birthday
    validates :lastname_kana,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } 
    validates :firstname_kana,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } 
  end
  
  # has_many :products
  # has_many :purchase_histries
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birthday, presence: true

  # has_many :products
  # has_many :purchase_histries
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


     validates :nickname,       presence: true
     validates :password,       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
     validates :surname,        presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/}
     validates :name,           presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/}
     validates :surname_kana,   presence: true,format: { with: /\A[ァ-ヶー]+\z/}
     validates :name_kana,      presence: true,format: { with: /\A[ァ-ヶー]+\z/}
     validates :birthday,       presence: true

     has_many :items
     has_many :buys
end


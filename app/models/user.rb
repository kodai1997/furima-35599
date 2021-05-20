class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :email, presence: true
         validates :password, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true
         validates :first_name_kane, presence: true
         validates :birth_date, presence: true
end

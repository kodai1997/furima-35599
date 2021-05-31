class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :status
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/}
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :category_id
    validates :image
   end

   with_options  numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_days_id
    validates :shipping_cost_id
    validates :prefecture_id
   end

   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
   
end
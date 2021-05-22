class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :category_id
    validates :image
   end

   with_options presence: true, format: { with: /\A[0-9]+\z/, message: "is not a number"} do
    validates :price
   end

   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
   validates :category_id, numericality: { other_than: 1 }
   validates :status_id, numericality: { other_than: 1 }
   validates :shipping_cost_id, numericality: { other_than: 1 }
   validates :prefecture_id, numericality: { other_than: 1 }
   validates :shipping_days_id, numericality: { other_than: 1 }
end
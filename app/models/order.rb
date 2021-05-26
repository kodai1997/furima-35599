class Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :address, :address2, :telephone, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :city
    validates :address
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, address2: address2, telephone: telephone, purchase_id: order.id)
  end
end
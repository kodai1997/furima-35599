class Order
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :telephone, :purchase

  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone
    validates :purchase
   end

  def save
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
end
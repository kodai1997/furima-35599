class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :prevent_user, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :after_purchase, only: [:index, :create]


  def index
    @order = Order.new
  end


  def create
    @order = Order.new(purchase_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:zip_code, :prefecture_id, :city, :address, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: params[:token],  
      currency: 'jpy'  
    )
  end

  def prevent_user
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def after_purchase
    @item = Item.find(params[:item_id])
    unless @item.purchase.blank?
      redirect_to root_path
    end
  end

end
class PurchasesController < ApplicationController

  def index
    @order = Order.new
  end


  def create
    @order = Order.new(purchase_params)
    if @order.valid?
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:zip_code, :prefecture_id, :city, :address, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
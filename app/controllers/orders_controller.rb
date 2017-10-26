class OrdersController < ApplicationController
  def create
    @order = current_order
    @order = Order.new(params[:order])
    if @order.save

    else
      redirect_to root_path
      flash[:info] = "Opps we have some problems with order"
    end

  end

  private
  def order
    params.require(:order).permit(:quantity, :product_id, :user_id)
  end
end
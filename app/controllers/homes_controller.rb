class HomesController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def user
    @user = User.find(params[:id])
  end
end

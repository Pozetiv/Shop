class CartsController < ApplicationController


  def show
    @cart = current_user.orders.where(status: 'In_cart')
    @order = current_order
  end

end
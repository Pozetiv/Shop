class CartsController < ApplicationController

  def show
    @cart = current_user.orders.where(status: 'In_cart' )
    #@cart = current_order.order_items
    @order = current_order
  end

end
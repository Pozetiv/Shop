class CartsController < ApplicationController

  def show
    @cart = current_order.order_items
    @order = current_order
  end

end
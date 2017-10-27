class OrdersController < ApplicationController
  def new
    @order = Order.new
    @categories = Category.all
    @products = Product.all
  end

  def create
    @order = current_order
    @order.update_attributes(order_params)
    if @order.update_attributes(order_params)
      session[:order_id] = @order.id
    else
      redirect_to root_path
      flash[:info] = "Opps we have some problems with order"
    end

  end

  private
  def order_params
    params.require(:order).permit(order_items_attributes: [:id, :product_id, :quantity])
  end
end
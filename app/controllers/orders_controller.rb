class OrdersController < ApplicationController
  before_action :admin, only: [:index]
  def index
    @orders = Order.where(status: 'In_order')
  end


  def create
    @order = current_order
    @order.update_attributes(order_params)
    if @order.update_attributes(order_params)
      session[:order_id] = @order.id
      @order.save
    else
      redirect_to root_path
      flash[:info] = "Opps we have some problems with order"
    end
  end

  def show
    @orders = current_user.orders.where(status: 'In_order')
  end

  def status
    @status=current_order.update_attributes(status: params[:status])
    redirect_to order_path(current_user)
    session.delete(:order_id)
  end

  private
  def order_params
    params.require(:order).permit(:product_id, :quantity, :status)
  end


end
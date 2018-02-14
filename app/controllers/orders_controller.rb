class OrdersController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :admin, only: [:index, :today_orders]

  def index
    @orderss= Order.where(status: 'In_order')
    @orders = @orderss.paginate(:page => params[:page])
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
    @orders = current_user.orders.where(status: 'In_order').paginate(:page => params[:page])
  end

  def status
    @status=current_order.update_attributes(status: params[:status])
    redirect_to order_path(current_user)
    session.delete(:order_id)
  end

  def today_orders
   @today = Order.where("updated_at >= ?", Time.zone.now.beginning_of_day).where(status: 'In_order')
   respond_to do |format|
     format.html
     format.json {render json: @today, status: 200}
   end
  end


  private
  def order_params
    params.require(:order).permit(:product_id, :quantity, :status)
  end

end
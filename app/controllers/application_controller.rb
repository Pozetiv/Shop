class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :danger

  include SessionsHelper
  helper_method :current_order 

  def current_order
  	if session[:order_id]
  		current_user.orders.find(session[:order_id])
  	else
  		current_user.orders.new
  end
  end

  def admin
    if !current_user.admin
      redirect_to root_path
      flash[:danger] = 'Your cant do this, because your are not admin'
    end
  end
end

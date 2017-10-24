class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :danger

  include SessionsHelper
  helper_method :current_order 

  def current_order
  	if session[:order_id]
  		current_user.order.find(session[:order_id])
  	else
  		current_user.order.new
  end
end
end

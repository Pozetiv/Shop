module ApplicationHelper

  def current_order
    if !session[:order_id].nil?
    else
      order.new
    end
  end

end

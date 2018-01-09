class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!, only: [:show]
  respond_to :json

  def orders
    respond_with today = Order.where("updated_at >= ?", Time.zone.now.beginning_of_day).where(status: 'In_order')
  end
end
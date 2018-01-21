class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!, only: [:index]
  respond_to :json


  def index
    respond_with Order.where("updated_at >= ?", Time.zone.now.beginning_of_day).where(status: 'In_order')
  end
end
class ItemsController < ApplicationController
  before_action :search_item, only: [ :edit, :destroy, :update, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, success: 'OK, create new item'
    else
      render :new, warning: 'WE have problem'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @item.update_attributes(item_params)
      redirect_to @item, success: 'OK, update'
    else
      render :edit, warning: 'We have problem'
    end
  end

   private

  def item_params
    params.require(:item).permit(:title, :description, :prise)
  end

  def search_item
    @item = Item.find(params[:id])
  end

end

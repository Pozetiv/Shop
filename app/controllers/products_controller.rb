class ProductsController < ApplicationController
  before_action :search_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    
  end
  def show
    @poruduct = Product.find(params[:id])
  end

  def edit
    @product = Product.find (params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def search_product
    @product = Product.find(params[:id])
  end

end

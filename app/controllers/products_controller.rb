class ProductsController < ApplicationController
  before_action :search_product, only: [:edit, :show, :update, :destroy]
  before_action :admin, only: [:update, :create, :destroy, :edit]

  def index
    @products = Product.all
    @categories = Category.all
    @order_item = current_order.order_items.new if logged_in?
    
  end

  def show

  end

  def edit

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
    params.require(:product).permit(:title, :description, :price, :image, :category_id)
  end

  def search_product
    @product = Product.find(params[:id])
  end

end

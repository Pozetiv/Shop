class ProductsController < ApplicationController
  before_action :search_product, only: [:edit, :show, :update, :destroy]
  before_action :admin, only: [:edit, :new]

  def index

    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
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




  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :image, :category_id)
  end

  def search_product
    @product = Product.find(params[:id])
  end

end

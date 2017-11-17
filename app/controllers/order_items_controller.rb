class OrderItemsController < ApplicationController
	def create
		@order = current_order
		@item = @order.order_items.new(item_params)
		category_id = Product.find(params[:order_item][:product_id]).category.id
		existing_product = current_order.products.find_by(category_id: category_id)
		current_order.order_items.find_by(product_id: existing_product.id).destroy if existing_product
		@order.save
		session[:order_id] = @order.id
		redirect_to products_path
	end

	def destroy
		@order = current_order
		@item = @order.order_item.find(params[:id])
		@item.destroy
		@order.save
		redirect_to cart_path		
	end


	private

	def item_params
		params.require(:order_item).permit(:product_id, :quantity, :fixprice)
		
	end
end



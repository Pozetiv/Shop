class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	has_many :products, through: :order_items
	before_save :update_total
	before_save :up_status



	def calculate_tota
		self.order_items.collect { |item| item.product.price * item.quantity }.sum	
	end

	private

	def update_total
		self.total_price = calculate_tota
		end


	def up_status
		if self.status == nil
			self.status = "In_cart"
		end
	end
end

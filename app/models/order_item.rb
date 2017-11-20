class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order

 validates :product_id, :fixprice, :quantity, presence: true

end

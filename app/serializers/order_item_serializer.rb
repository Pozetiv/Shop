class OrderItemSerializer < ActiveModel::Serializer
  attributes  :quantity, :fixprice
  belongs_to :order
  belongs_to :product
end

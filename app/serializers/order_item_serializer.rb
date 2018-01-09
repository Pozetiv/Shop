class OrderItemSerializer < ActiveModel::Serializer
  attributes  :product, :quantity
  belongs_to :order
  belongs_to :product
end

class OrderSerializer < ActiveModel::Serializer
  attributes :user, :order_items, :total_price
  has_many :order_items
  belongs_to :user
  has_many :products, through: :order_items
end

class OrderSerializer < ActiveModel::Serializer
  attributes :user, :order_items
  has_many :order_items
  belongs_to :user
  has_many :products, through: :order_items
end

class OrderSerializer < ActiveModel::Serializer
  attributes :user
  has_many :order_items
  belongs_to :user
end
